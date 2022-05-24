function B = Open(A,SE,Loc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Opening Image nothing but Erosion followed by Dilation;
B1 = Erode(A,SE,Loc);close
B = Dilate(B1,SE,Loc);close
C = imopen(A,SE);
figure,
subplot(1,2,1);imshow(C);title('Opening by Built-in Function')
subplot(1,2,2);imshow(B);title('Opening by Manual Function')
end

