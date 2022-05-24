function B = CorRelation(A,m)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%



s=size(A);
Im=A;
A=padarray(A,[size(m,1)/2 size(m,2)/2]);
len = length(m);
cls = class(A);
if cls== "logical"
    norm = (size(m,1) * size(m,2));
elseif cls=="uint8"
%     m=255*m;
    norm=(size(m,1) * size(m,2))*255;
end
st=(len-1)/2;
B=zeros(s(1)-len+1,s(2)-len+1);
sti= (len+1)/2;
stj= (len+1)/2;
spi= s(1) - st;
spj= s(2) - st;
        for i=sti:spi
            for j=stj:spj
               Temp = A(((i-st):(i+st)),((j-st):j+st));
               B(i-st,j-st)=  sum( ((double(Temp) .* m)), 'all')/norm;   
            end
        end
if cls== "logical"
      B=logical(B);
elseif cls=="uint8"
      B=uint8(B);
      B= (histeq(B));
end
figure
subplot(2,2,1);imshow(Im);title('Input Image');axis on
subplot(2,2,2);imshow((B));title('Correlation by Manual Function');axis on
subplot(2,2,3:4);imshow(uint8(m));title('Kernel');axis on
end