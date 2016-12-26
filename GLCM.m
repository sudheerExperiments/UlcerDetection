function [f1,f2,f3,f4] = GLCM(i)

i=rgb2gray(i);
 
 
 glcm = graycomatrix(i);

 glcm=glcm+glcm';
     
 glcm_sum = sum(sum(glcm(:,:)));
   glcm(:,:) = glcm(:,:)./glcm_sum;
 foo=glcm;

% Entropy
[x y]=size(foo);
en=0;
for i=1:x
    for j=1:y
     en=en-(foo(i,j)*log(foo(i,j) + eps));
    end
end


% Energy:
energy=sum(sum(foo.*foo));
[x y]=size(foo);
energ=0;
for i=1:x
    for j=1:y
     energ=energ+foo(i,j)*foo(i,j);
    end
end


%Inverse Difference Moment
inv=0;
for i=1:x
    for j=1:y
     inv=foo(i,j)/(1+(i-j)*(i-j));
    end
end





% Correlation:
[m,n]=size(foo);

px=sum(foo,2);
[i,j,v]=find(px);
mu_x=sum((i-1).*v);
sigma_x=sum((((i-1)-mu_x).^2).*v);
h_x=sum(sum(-((full(spfun(@log2,px))).*px)));
temp1=repmat(px,[1 m]);

py=sum(foo,1);
[i,j,v]=find(py);
mu_y=sum((j-1).*v);
sigma_y=sum((((j-1)-mu_y).^2).*v);
h_y=sum(sum(-((full(spfun(@log2,py))).*py)));
temp2=repmat(py,[n 1]);

[i,j,v]=find(foo);
correlation=(sum(((i-1)-mu_x).*((j-1)-mu_y).*v))/sqrt(sigma_x*sigma_y);
f1=correlation;
f2=inv;
f3=en;
f4=energ;
end
