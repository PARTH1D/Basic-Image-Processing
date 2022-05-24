function B = Convo(A,m,Mode)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Mode = 1 for Applying the filter m
%Mode = 2 for Median filter Specify kernel size as m
%Mode = 3 for Mode filter Specify kernel size as m
s=size(A);
if Mode ==1
    len = length(m);
    m=rot90(m,2);
elseif Mode == 2 || 3
    if size(m,2)== 1
       len = m*m;
    else
       disp('unexpected Value of Kernel')
      return
    end
else
    disp('unexpected Value of MOde')
    return
end
st=(len-1)/2;
B=zeros(s(1)-len+1,s(2)-len+1);
% B=zeros(s(1),s(2));
% HI = histo(A,8); clf; close all;
% pix=(2^b -1);

sti= (len+1)/2;
stj= (len+1)/2;
spi= s(1) - st;
spj= s(2) - st;
switch Mode
    case 1
        for i=sti:spi
            for j=stj:spj
               Temp = A(((i-st):(i+st)),((j-st):j+st));
               B(i-st,j-st)=  sum(double(Temp) .* m , 'all');    
            end
        end
%         C = imfilter(A,m,'conv','same');
        C = uint8(conv2(A,m,"valid"));
    case 2
        for i=sti:spi
            for j=stj:spj
               Temp = A(((i-st):(i+st)),((j-st):j+st));
               B(i-st,j-st)=  median(double(Temp), 'all');    
            end
        end
        C = medfilt2(A,[m*m m*m]);
    case 3
        for i=sti:spi
            for j=stj:spj
               Temp = A(((i-st):(i+st)),((j-st):j+st));
               B(i-st,j-st)=  mode(double(Temp), 'all');    
            end
        end
        C = uint8(B); % There is no internal function for mode filter in Matlab19
end
B=uint8(B);
figure,
subplot(1,2,1);imshow(C);title('By Built-in Function')
subplot(1,2,2);imshow(B);title('By Manual Function')
end


