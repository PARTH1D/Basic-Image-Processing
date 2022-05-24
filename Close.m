function B = Close(A,SE,Loc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Closing Image nothing but Dilation followed by Erosion;
B1 = Dilate(A,SE,Loc);clf;close 
B = Erode(B1,SE,Loc);clf;close 
C = imclose(A,SE);
figure,
subplot(1,2,1);imshow(C);title('Closing by Built-in Function')
subplot(1,2,2);imshow(B);title('Closing by Manual Function')
end