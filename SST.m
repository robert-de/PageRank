function Tinv = SST(R, Qt)
    % determinarea inversei prin rezolvarea unui sistem superior triunghiular
    % algoritm preluat din laboratorul 2
    Tinv = zeros(size(R));
    [n,n] = size(R);
    for z = 1: n  % rezolvarea coloana cu coloana, crescator
       for i = n : -1 : 1   % fiind un SST ordinea rezolvarii este descendenta
         Tinv(i,z) = Qt(i,z); % Tinv(i,z) = x(i); Qt(i,z) = b(i)
         for j = i+1 : n
           Tinv(i,z) -= R(i,j)*Tinv(j,z); % scaderea sumei Aij*x(j)
         endfor
         Tinv(i,z) /= R(i,i); %impartirea prin Aii
       endfor
    endfor
endfunction
%T*T^-1 = I
%QRT^-1 = I
%R*T^-1 = Q'
%RT^-1 = Q'
%Rx = b de n ori
%Ax = b de n ori