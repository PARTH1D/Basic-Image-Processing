function B = localEq(A,m,n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


s=size(A);
B=zeros(s);
for i=1:s(1)/m:(s(1))
        if i+ s(1)/m >s(1)
            i=s(1)- s(1)/m;
        end
    for j=1:s(2)/n:(s(2))

        if j+s(2)/n>s(2)
            j=s(2)-s(2)/n;
        end
        subImage=A(i:i+s(1)/m,j:j+s(2)/n,:);
        B(i:i+s(1)/m,j:j+s(2)/n,:)=histeq(subImage);
    end
end
B=uint8(B);
disp('Dividing Image in row in '+ string(m) + ' parts and column in ' + string(n) + ' parts');
figure,
imshow(B);title('Picewise equalisation')
end
