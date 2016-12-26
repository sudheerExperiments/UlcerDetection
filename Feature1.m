function [f1,f2,f3,f4] = Feature1(R)
R=im2double(R);
[q1,q2]=size(R);



m=zeros(4,4);
for p= 1:4
     for q= 1:4
         for x= 1:q1
             
           for y= 1:q2
               m(p,q)=m(p,q)+(x^(p-1))*(y^(q-1))*R(x,y);
           end
         end
     end
end

u=zeros(4,4);
x1=m(2,1)/m(1,1);
y1=m(1,2)/m(1,1);

for p= 1:4
     for q= 1:4
         for x= 1:q1
           for y= 1:q2
               u(p,q)=u(p,q)+((x-x1)^(p-1))*((y-y1)^(q-1))*R(x,y);
           end
         end
     end
end

n=zeros(4,4);
for p= 1:4
     for q= 1:4
         if ((p+q)>2)
            n(p,q)=u(p,q)/u(1,1)^((p+q)/2);
         end
     end
end

f1=n(3,1)+n(1,3);
f2=(n(3,1)-n(1,3))^2+4*(n(2,2)^2);
f3=(n(4,1)-3*n(2,3))^2+(3*n(3,2)-n(1,4))^2;
f4=(n(4,1)+n(2,3))^2+(n(3,2)+n(1,4))^2;

