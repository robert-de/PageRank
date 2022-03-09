function R = Iterative(nume, d, eps)
  fid = fopen(nume, 'r');
  graf = dlmread(fid);
  %am observat ca fisierul are un format fix dependent de numarul 
  %de noduri al graficului
  %am folosit dlmread pentru facilitate in parcurgerea datelor
  %am explorat si optiunea de importdata dar facea parcurgerea 
  %datelor semnificativ mai dificila
  n = graf(1,1);  
  A = zeros(n,n);     %prealocare pentru eficienta
  K = zeros(n,n);
  Rp = zeros(n,1);
  Rc = zeros(n,1);  % R(t+1) din alg prez in resurse
  Rp(1:n) = 1/n;    %initializarea lui Rp == PR(pi;0) din alg prez in resurse
  unu = ones(n,1);
  
  %sectiune pentru formarea matricei de adiacenta precum
  %si a matricei diagonale cu "outdegrees" deja inversata
  for i = 2 : n+1 % parcurgerea liselor de adiacenta pentru fiecare nod
    for j = 3 : graf(i, 2) + 2  % numarul de elemente de pe a 2-a coloana a fisierului
       A(i-1, graf(i,j)) = 1;     %formarea matricei de adiacenta
     endfor
     if A(i-1, i-1) == 1          %eliminarea linkurilor catre aceeasi pagina
          K(i-1, i-1) = 1 / (graf(i, 2) -1);  
          A(i-1, i-1) = 0;
        else
          K(i-1, i-1) = 1 / graf(i, 2);
        endif
  endfor

  M = (K*A)';
   % formarea vectorului conform formulei prezentata in resurse
   while 1   
   Rc = d * M * Rp + (1 - d) / n * unu;
   if (abs(Rc - Rp) < eps)
     break;
   endif;
   Rp = Rc;   
  endwhile
  
  R = Rp;
  endfunction