function [B,M] = EqH(A,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


s=size(A);
tot=(s(1)*s(2));
B=zeros(s(1),s(2));
M=zeros(1,256);
HI = HistoGram(A,8); %clf; close all;
pix=(2^b -1);
for i = 0:pix
    tmp = sum(HI(1:(i+1)));
    M(i+1)=pix*tmp/tot;
    if     M(i+1) > pix
           M(i+1)=pix;
    elseif M(i+1) < 0
           M(i+1)= 0;
    end
end
for i=1:s(1)
    for j=1:s(2)
       Temp = (A(i,j));
       B(i,j)= M((Temp+1));    
    end
end
B=uint8(B);
figure,
subplot(2,1,1);imshow(histeq(A),[]);title('Equalisation by built-in Function')
subplot(2,1,2);imshow(B,[]);title('Equalisation by Manual Function')

end


