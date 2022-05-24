warning off;clc;clear all;close all;
disp('Digital Image Processing')
disp('          ');
disp('         ');
disp('Assignment')
disp('          ');
disp('         ');
disp('Submitted by Parth Dethaliya 161020011031')
disp('          ');
disp('         ');

A=imread('baby.jpg');A=rgb2gray(imresize(A,0.75*0.3));
figure,imshow(A),title('Image of a Baby :')
CompressionRatio('baby.jpg');
pause(1);
%% Histogram and Histogram Equalisation
EqH(A,8);pause(1);

%% Local Equalisation
localEq(A,4,6);pause(1);
%% Mean Filter
disp('Mean Filter : ')
m= ones(5)/25;
disp('Using this filter for mean = ')
disp((m))
Convo(A,m,1);pause(1);
%% Median Filter 
disp('Median Filter : ')
disp('Size of Kernel = ')
m= 3;
disp((m))
Convo(A,m,2);pause(1);
%% Mode Filter
disp('Mode Filter : ')
disp('Size of Kernel = ')
m= 3;
disp((m))
Convo(A,m,3);pause(1);
disp('No internal Command for mode so displaying same images in both section')
%% Correlation
disp('Finding Corelation with Small portion of same image :')
m=double(A(401:600,1:200));
% disp(m)
% disp('Column Matrix')
V = CorRelation(A,m);pause(1);
%% Edge detection
disp('Covolution with this Kernel(Laplacian) for Edge Detection')
m=[-1 -1 -1;-1 8 -1;-1 -1 -1];
disp(m)
Convo(A,m,1);pause(1);
%% Thresholding
T=Otsu(A);
Ab=imbinarize(A,T);%Binarizing by Otsu's Threshold
figure,imshow(Ab);title('Binarized by Otsus Method');pause(1);
%% Morphological Operations
disp('Eosion, Dilation, Opening, Closing, Corners, Centroid');
%% 1.Erosion
disp('Structuring Element = ');
SE = ones(3);
disp(SE);disp('with centre at (2,2)')
Erode(Ab,SE,[2 2]);pause(1);

%% 2.Dilation
disp('Structuring Element = ');
SE = ones(3);
disp(SE);disp('with centre at (2,2)')
Dilate(Ab,SE,[2 2]);pause(1);

%% 3.Opening 
disp('Structuring Element = ');
SE = ones(3);
disp(SE);disp('with centre at (2,2)')
Open(Ab,SE,[2 2]);pause(1);

%% 4.Closing 
disp('Structuring Element = ');
SE = ones(3);
disp(SE);disp('with centre at (2,2)')
Close(Ab,SE,[2 2]);pause(1);

%% 5.Corners 
Corners(Ab);
pause(1);
%% 6.Centroids
Im = (imopen(~Ab,ones(50)));
disp('Binary Image was Complemented for Black Background and White Object.')
disp('Opening and Closing was performed to have single object in Image')
Centroid(Im);
%% Huffman coding 
disp('A 2d Matrix : ')
Vector = [1 1 2 2 2;3 3 3 3 4;4 4 4 4 5;5 5 5 5 5;6 7 8 9 10 ];
disp(Vector)
disp('Huffman Coding : ')
disp('       ')
Huffencode(Vector(:).');


%% K- Means Clustering
close all
disp('Colouring Based on their Clusters :')
disp('Initial centers are choosen randomely.')
TClustering(A,3);pause(1);
TClustering(A,2);pause(1);
TClustering(A,5);pause(1);
TClustering(A,3);pause(1);



