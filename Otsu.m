function [Threshold] = Otsu(A)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% By Parth Dethaliya  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=imhist(A);
N=sum(n); % sum the values of all the histogram values
max=0; %initial value of max
P = n/N;

for T=2:255      
    Wb=sum(P(1:T)); 
    Wf=sum(P(T+1:256)); 
    Ub= ( dot((0:T-1),(P(1:T)))      )/Wb; % Mean of Background%
    Uf= ( dot((T:255),(P(T+1:256)))  )/Wf; % Mean of ForeGround/Object
    Ub(isnan(Ub))=0;Uf(isnan(Uf))=0;      % Clearing divide by 0 condition
    sigma=Wb*Wf*((Uf-Ub)^2);              %Variance
    if sigma>=max % compare sigma with maximum 
        max=sigma; % New maximum sigma
        Threshold=(T-1); % Threshold
    end
end
disp('Threshold Value by Manual   Function  : ' + string(Threshold));
disp('Threshold Ratio by Manual   Function  : ' + string(Threshold/255));
disp('Threshold Ratio by built-in Function : ' + string(graythresh(A)));
Threshold = Threshold/255;
end

