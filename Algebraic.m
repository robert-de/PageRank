function R = Algebraic(nume, d)
	fid = fopen(nume, 'r');
  graf = dlmread(fid);
  n = graf(1,1);
  A = zeros(n,n);
  K = zeros(n,n);
  unu = ones(n,1);
  I = eye(n);
  R = zeros(n);
  
   for i = 2 : n+1
    for j = 3 : graf(i, 2) + 2
       A(i-1, graf(i,j)) = 1;
     endfor
        if A(i-1, i-1) == 1
          K(i-1, i-1) = 1 / (graf(i, 2) -1);
          A(i-1, i-1) = 0;
        else
          K(i-1, i-1) = 1 / graf(i, 2);
        endif    
    endfor
    
   M = (K*A)'; 
   T = I - d*M; % o matrice auxiliare pentru simplificarea sintaxei
   % utilizarea formulei din resursele prezentate pentru calculul lui R
   R = PR_Inv(T)*((1-d)/n)*unu; % inversarea matricei si aplicarea in formula
 
	endfunction