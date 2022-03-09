function [R1 R2] = PageRank(nume, d, eps)
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  
  fid = fopen(nume, 'r');  
  graf = dlmread(fid);    %am utilizat aceeasi citire ca la cerintele precedente
  n = graf(1, 1);
  val1 = graf(n+2, 1);  %variabilele aditionale specifice cerintei
  val2 = graf(n+3, 1);
  nameout = [nume ".out"];  %concatenarea numelui
  fidout = fopen(nameout, 'w');   %crearea fisierului de iesire
  
  [B, I] = sort(R2, "descend");   %sortare descrescatoare
  %B este vectorul de valori iar I cel de indici initiali, deci numarul paginilor
  fprintf(fidout, "%d\n", n);
  fprintf(fidout, "\n");
  fprintf(fidout, "%2.6f\n", R1(1:n));
  fprintf(fidout, "\n");
  fprintf(fidout, "%2.6f\n", R2(1:n));    %afisarea rezultatelor primelor
  fprintf(fidout, "\n");                  %doua cerinte
  
  %afisarea celei de-a 3-a cerinte
  %am ales un numar identic de zecimale cu cel prezent in exemplu
  for i = 1:n
  fprintf(fidout, "%d %d %2.6f\n", i, I(i), u(B(i), val1, val2));
  endfor
  
  fclose(fidout);
  fclose(fid);
endfunction