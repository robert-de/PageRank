function pr = u (x, val1, val2)
   % Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
   % era mai usor si sugestiv de apelat astfel, avand in vedere cerinta
   a = 1 / (val2 - val1);  % parametrii rezultati din rezolvarea sistemului 
   b = -val1 * a;          % de ecuatii liniare
   pr = a * x + b;  % aplic functia lui x indiferent de valoarea lui
  
   if pr < 0
     pr = 0;
    elseif pr > 1    % filtrarea valorii functiei pentru intervale
     pr = 1;
   endif
endfunction
