function imgg_mm = reduce_saltp(imgg, taille)
  if mod(taille, 2) == 0
    taille = taille+1;
  end
  % la dim de la matrice
  [rows cols] = size(imgg);
  % creation d'une duplication => "same"
  imgg_mm = imgg;
  % le debut , pour ne pas etre au dehors de la matrice
  debut = 1 + ((taille - 1)/2);
  r = debut-1;
  for i=debut:rows-r
    for j=debut:cols-r      
      imgns = imgg(i-r:i+r , j-r:j+r);
      ss = sort(imgns)(:);
      aa = [];
      for k=1:size(ss)(1)
        if ss(k)!=0 && ss(k)!=255
          aa = [aa; ss(k)];
        end
      end
      
      if size(aa) == [0 0]
        aa = ss;
      end
      
      if imgg_mm(i, j) == 0 || imgg_mm(i, j) == 255
        value = mean(aa);
        imgg_mm(i, j) = value;
      end
    endfor
  endfor
endfunction
