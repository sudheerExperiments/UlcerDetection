
numofim=0;
vv=1;


for i=1:18
    str=strcat('Tr/');
    if i<10
        str1=strcat(str,'00',int2str(i),'/');
        list=dir(strcat(str1,'*.jpg'));
    else
        str1=strcat(str,'0',int2str(i),'/');
        list=dir(strcat(str1,'*.jpg'));
    end
    [x y]=size(list);
    numofim=numofim+x;
end
target=zeros(18,numofim);
outp=zeros(numofim,12);
for imvar=1:18
    str=strcat('Tr/');
    if imvar<10
        str1=strcat(str,'00',int2str(imvar),'/');
        lis=dir(strcat(str1,'*.jpg'));
    else
        str1=strcat(str,'0',int2str(imvar),'/');
        lis=dir(strcat(str1,'*.jpg'));
    end
    




[x y]=size(lis);
arr1=zeros(12,18);
for var=1:x
    I=imread(strcat(str1,lis(var).name));
    I=imresize(I,[128 128]);
    [f5,f6,f7,f8]=GLCM(I);
[f1,f2,f3,f4]=Feature1(I);
I=rgb2gray(I);

C = corner(I,'MinimumEigenvalue',20);
BW = edge(I);
[m n]=size(I);
yellow=0;
red=0;
black=0;
white=0;
pink=0;
for i=1:m
    for j=1:n
        if(I(i,j)>200&&I(i,j)<220)
            yellow=yellow+1;
        elseif(I(i,j)>220&&I(i,j)<=255)
            white=white+1;
        elseif(I(i,j)>0&&I(i,j)<99)
            black=black+1;
        elseif(I(i,j)>100&&I(i,j)<110)
            red=red+1;
        elseif(I(i,j)>120&&I(i,j)<200)
            pink=pink+1;
        end
    end
end
x=m*n;
yellow=(yellow/x)*100;
red=(red/x)*100;
black=(black/x)*100;
white=(white/x)*100;
pink=(pink/x)*100;
arr=zeros(12,1);
arr(1)=yellow;
arr(2)=red;
arr(3)=black;
arr(4)=pink;
arr(5)=f1;
arr(6)=f2;
arr(7)=f3;
arr(8)=f4;
arr(9)=f5;
arr(10)=f6;
arr(11)=f7;
arr(12)=f8;
outp(vv,:)=arr;
target(imvar,vv)=1;
vv=vv+1;

end

end
outp=outp';
glcminput=zeros(4,303);
glcminput=outp(1:4,:);



MomInvarinput=zeros(4,303);
MomInvarinput=outp(5:8,:);


Momfeainput=zeros(4,303);
Momfeainput=outp(9:12,:);


