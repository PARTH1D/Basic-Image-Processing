function [Im,C] = TClustering(A,k)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 Im=A;
 if size(A,3)==3
     B1 = A(:,:,1);
     B2 = A(:,:,2);
     B3 = A(:,:,3);
     Cel={};
     for i = 1:425
     for j = 1:319
        Cel{i,j} = [double(B1(i,j)) double(B2(i,j)) double(B3(i,j))];
     end
     end
     A = cell2mat(Cel(:));
 else
     A = double(A(:));
 end
 msize = size(A,1);
C = A(randperm(msize, k),:);
 
 C2 = zeros(size(C));
 Ak=zeros(size(A));
 Bv=1;
 n=0;
 while(Bv==1)
 D=abs((A-C(:).'));
    for i= 1:size(A,1)
        [~,L] = min(D(i,:));
        Ak(i) = C(L);
    end
 Afinal = [A Ak];
 for o=1:size(C,1)
     idx = Afinal(:,2)==C(o);
     C2(o)=floor(mean(Afinal(idx,1)));
 end
 C(isnan(C))=0;
 C2(isnan(C2))=0;
 Breakvalue = sum(C2==C);
 
 if Breakvalue == k
     Bv=0;
 else
     C=C2;clear C2
 end
 n=n+1;
 C(isnan(C))=0;

 end

 label =1;
 for u=1:k
     l = Afinal(:,2) ==C(u);
     Im(l) = label;
     label=label+1;
 end
 Im = label2rgb(Im);
 figure
 imshow(Im);title('segmented Image using ' + string(k) + ' Cluster Centers')
 disp('Centers (Linear indices of centers) :')
 disp(C)
end

