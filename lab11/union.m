function nTablica = union(indeksP,indeksQ,tablica)
    nTablica = tablica;
    nTablica(root(indeksP,tablica)) = root(indeksQ,tablica);
end

