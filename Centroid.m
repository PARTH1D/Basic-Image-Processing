function B = Centroid(A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%It Assumes there is only one object in Image
Rr = 1 / ceil(max(size(A))/400);
A=imresize(A,Rr);
S = size(A);
Marker = min(floor(S/40));
%Row wise centroid
Ir=1;Ic=1;
Row=zeros(size(A,1),3);
Col=zeros(size(A,2),3);

for i=1:S(1)
    Temp = A(i,:);Tmp = rot90(Temp,2);
    Sum = cumsum(Temp) + rot90(cumsum(Tmp),2);
    if any(Sum>0)
        Loc= ceil(mean(find(Sum==max(Sum)).'));
        Row(Ir,:)=[i Loc 1];
        Ir=Ir+1;
    end
end


for j=1:S(2)
    Temp = A(:,j).';Tmp = rot90(Temp,2);
    Sum = cumsum(Temp) + rot90(cumsum(Tmp),2);
    if any(Sum>0)
        Loc =ceil(mean( find(Sum==max(Sum))));
        Col(Ic,:) = [Loc j 1];
        Ic = Ic + 1;
    end
end
Row(Row(:,3)==0,:)=[];Row=Row(:,1:2);
Col(Col(:,3)==0,:)=[];Col=Col(:,1:2);
I = intersect(Row,Col,'rows','stable');
% I(1)= I(1)+30;I(2)=I(2)-20;
Mask = zeros(size(A));
Mask(I(1),I(2)-Marker:I(2)+Marker)=1;
Mask(I(1)-Marker:I(1)+Marker,I(2))=1;
B = imoverlay(A,Mask,[0 0 1]);
disp('Size was Reduced to save Time')
disp('Best results, when there is only one object in the Image')
figure
imshow(B);title('Centroid marked on the Input Image')
end