function B = PR_Inv(A)
	 % aceasta functie functioneaza mai mult ca un nod de tranzitie intre cele 2
   % functii, pentru a usura scrierea codului
   [Q R] = GramSc(A); % aplicarea algoritmului QR
    B = SST(R, Q'); % determinarea inversei rezolvand sistemul SST rezultat 
endfunction