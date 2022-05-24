function [B] = Erode(A,SE,Loc)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


r= Loc(1);c=Loc(2);
S = size(SE);
B=zeros(size(A));
Raw_padding = S(1)-r;Column_Padding = S(2)-c;
Ap = padarray(A,[Raw_padding Column_Padding],1);
for i=1:size(A,1)
   for j=1:size(A,2)
           Temp = Ap(((i):(i+S(1)-1)),((j):j+S(2)-1));
           Tmp2 =  (Temp==SE);
           if any(Tmp2(:) ==0)
               %No match condition or partial match
           else
               %Both array are matching exactly
               B(i,j)=1;
           end
   end
end
C = imerode(A,SE);
figure
subplot(1,2,1);imshow(C);title('Erosion by Built-in Function')
subplot(1,2,2);imshow(B);title('Erosion by Manual Function')
end