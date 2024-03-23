%1.转换为灰度图像后对图像进行直方图均衡
clear all;
A=imread('pic.jpeg');
m=size(A)
B=rgb2gray(A);%将彩色图片转换为灰度图像
%A为原始图像，B为灰度图像
C=histeq(B);
%C为灰度图像直方图均衡处理后图像
figure(1)
subplot(3,2,1),imshow(A),title('原始图像')
subplot(3,2,2),imhist(A),title('原始图像直方图')
subplot(3,2,3),imshow(B),title('灰度图像')
subplot(3,2,4),imhist(B),title('灰度图像直方图')
subplot(3,2,5),imshow(C),title('灰度图像直方图均衡处理后')
subplot(3,2,6),imhist(C),title('灰度图像直方图均衡化后直方图')

%2. 在RGB空间对图像进行直方图均衡化
clear all;
A=imread('pic.jpeg');
m=size(A)
%在RGB空间对图像进行直方图均衡化,R:红，G:绿，B:蓝
n=im2double(A);
R=n(:,:,1);
G=n(:,:,2);
B=n(:,:,3);
R1=histeq(R);
G1=histeq(G);
B1=histeq(B);
D=cat(3,R1,G1,B1);%串联数组
E=rgb2gray(D);
E1=histeq(E);
figure(2)
subplot(4,2,1),imshow(A),title('原始图像')
subplot(4,2,2),imhist(A),title('原始图像直方图')
subplot(4,2,3),imshow(D),title('RGB图像')
subplot(4,2,4),imhist(D),title('RGB图像直方图')
subplot(4,2,5),imshow(E),title('RGB灰度图像')
subplot(4,2,6),imhist(E),title('RGB灰度图像直方图')
subplot(4,2,7),imshow(E1),title('RGB灰度图像直方图均衡处理后')
subplot(4,2,8),imhist(E1),title('RGB灰度图像直方图均衡化后直方图')



%3.在HSV空间对图像进行直方图均衡化
clear all;
A=imread('pic.jpeg');
m=size(A)
%在HSV空间对图像进行直方图均衡化（对S，V均衡化）,h=色度，s=饱和度，v=亮度
a=rgb2hsv(A);
h=a(:,:,1);
s=a(:,:,2);
v=a(:,:,3);
S=histeq(s);
V=histeq(v);
F=hsv2rgb(h,S,V);
G=rgb2gray(F);
G1=histeq(G);
figure(3)
subplot(4,2,1),imshow(A),title('原始图像')
subplot(4,2,2),imhist(A),title('原始图像直方图')
subplot(4,2,3),imshow(F),title('HSV图像')
subplot(4,2,4),imhist(F),title('HSV图像直方图')
subplot(4,2,5),imshow(G),title('HSV灰度图像')
subplot(4,2,6),imhist(G),title('HSV灰度图像直方图')
subplot(4,2,7),imshow(G1),title('HSV灰度图像直方图均衡处理后')
subplot(4,2,8),imhist(G1),title('HSV灰度图像直方图均衡化后直方图')

%4.在YCbCr空间对图像进行直方图均衡
clear all;
A=imread('pic.jpeg');
m=size(A)
% 在YCbCr空间对图像进行直方图均衡（对y通道）,y=颜色的亮度，cb=蓝色的浓度偏移成分，cr=红色的偏移成分
b=rgb2ycbcr(A);
y=b(:,:,1);
cb=b(:,:,2);
cr=b(:,:,3);
Y=histeq(y);
I=ycbcr2rgb(cat(3,Y,cb,cr));
J=rgb2gray(I);
J1=histeq(J);
figure(4)
subplot(4,2,1),imshow(A),title('原始图像')
subplot(4,2,2),imhist(A),title('原始图像直方图')
subplot(4,2,3),imshow(I),title('YCbCr图像（Y通道均衡处理）')
subplot(4,2,4),imhist(I),title('YCbCr图像直方图')
subplot(4,2,5),imshow(J),title('YCbCr灰度图像')
subplot(4,2,6),imhist(J),title('YCbCr灰度图像直方图')
subplot(4,2,7),imshow(J1),title('YCbCr灰度图像直方图均衡处理后')
subplot(4,2,8),imhist(J1),title('YCbCr灰度图像直方图均衡化后直方图')
