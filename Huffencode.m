function [Table] = Huffencode(Vector)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    U=unique(Vector).';
    Freq = histc(Vector,unique(Vector)).';
    P = [U Freq/length(Vector)];
    Q=sortrows(P,2,'descend');
    Depth =0;
    for i=1:size(U)-1
        code = repmat('1',[1 Depth]);
        H(i,1) = string(code + string(0)) ;
        Depth = Depth+1;
    end
    H(i+1,1)=string(repmat('1',[1 Depth]));
    Q(:,3) = H(:,1);
    varNames = {'Pixels','Probability','Huffcode'};
    Table =sortrows (table( Q(:,1),Q(:,2),H(:,1),'VariableNames',varNames),1 );
    disp(Table)
end