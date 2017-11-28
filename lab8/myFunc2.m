function wynik = myFunc2(nhood)

    pixel = nhood(2,2);
    suma = sum(nhood(:));
    
    if pixel == 1 && (suma == 3 || suma == 4)
          wynik = 1;
    elseif pixel == 1 && (suma == 1 || suma == 2 || suma > 4) 
          wynik = 0;
    elseif pixel == 0 && suma == 3
          wynik = 1;
    else
        wynik = pixel;
    end;
           
end

