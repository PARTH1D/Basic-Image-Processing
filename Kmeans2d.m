function [Afinal,C] = Kmeans2d(A,C)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=size(C,2);
D=zeros(size(A,1),k);
 Init = zeros(1,size(A,1));
 C2 = zeros(size(C,2),1).';
 Ak=zeros(size(A,2),1).';
 Bv=1;
 n=0;
 while(Bv==1)
 for i =1: size(A,1)
     for j=1:k
        D(i,j)=pdist2(A(i,:),C(j,:),'euclidean');
     end
 end
    for i= 1:size(A,1)
        [~,L] = min(D(i,:));
        Ak(i,:) = C(L,:);
    end
 Afinal = [A Ak];
 for o=1:size(C,2)
     idx = Afinal(:,3:4)==C(o,:);
     for p=1:k
         Init = Init & (idx(:,p));
     end
     for q = 1:k
       C2(o,q)=floor(mean(Afinal(Init,q)));
     end
    
 end
 C(isnan(C))=0;
 C2(isnan(C2))=0;
 Breakvalue = sum(C2==C);
 
 if Breakvalue == k*2
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

