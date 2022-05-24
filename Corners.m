function [B] = Corners(A)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Using HIt-miss transform on types of corner like Structuring elements
SE1 = [ NaN 1 NaN;
        1   1  0;
        NaN 0  0  ];
SE2 = [ NaN 1 NaN;0 1 1;0 0 NaN  ];
SE3 = [ NaN 0 0;1 1 0;NaN 1 NaN  ];
SE4 = [ 0 0 NaN;0 1 1;NaN 1 NaN  ];
Ap = padarray(A,[1 1],0);
B=zeros(size(A));
for i=1:size(A,1)
   for j=1:size(A,2)
           Temp = Ap(i:i+2,j:j+2);
           Tmp2 =  [(sum((Temp==SE1),'all')==6) (sum((Temp==SE2),'all')==6)...
               (sum((Temp==SE3),'all')==6) (sum((Temp==SE4),'all')==6)] ;
           if any(Tmp2 ==1)
               %Hit Condition
                B(i,j)=1;
           else
               %Miss Condition
           end
   end
end 

B=logical(uint8(B));
% An = imoverlay(A,B,[1 0 0]);
[r1,r2]=find(B==1);c1=[r2 r1];
c=corner(A);
figure,
subplot(2,2,1:2);imshow(A);title('Original Image');
subplot(2,2,3);imshow(A);title('Corners by Built-in Function'); hold on; plot(c(:,1),c(:,2),'r.'); hold off;
subplot(2,2,4);imshow(A);title('Corners by Manual Function');hold on;plot(c1(:,1),c1(:,2),'r.'); hold off;
disp('As we are using small kernal size so more corners are detected than built-in function')
end

