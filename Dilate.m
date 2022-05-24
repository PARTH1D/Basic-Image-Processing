function [B] = Dilate(A,SE,Loc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


r= Loc(1);c=Loc(2);
% [r,c] = find(SE(n) == SE);
S = size(SE);
B=zeros(size(A));
Raw_padding = S(1)-r;Column_Padding = S(2)-c;
Ap = padarray(A,[Raw_padding Column_Padding]);
for i=1:size(A,1)
   for j=1:size(A,2)
           Temp = Ap(((i):(i+S(1)-1)),((j):j+S(2)-1));
           Tmp2 =  (Temp==SE);
           if any(Tmp2(:)==1)
               %Partial or complete match
                B(i,j)=1;
           else
               %No match condition
           end
   end
end
C = imdilate(A,SE);
figure,
subplot(1,2,1);imshow(C);title('Dilation by Built-in Function')
subplot(1,2,2);imshow(B);title('Dilation by Manual Function')
end