function Hist = HistoGram(A,b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


s=size(A);
tot=2^b;
Hist=zeros(1,tot);
xhist=0:(tot-1);
for i=1:s(1)
    for j=1:s(2)
        Hist((A(i,j)+1))= Hist((A(i,j)+1)) +1 ;
    end
end
figure,subplot(2,1,1);bar(xhist,Hist);title('By Manual Function');axis tight
subplot(2,1,2);imhist(A);title('By Built-in Function');axis tight
end
