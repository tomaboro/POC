function data_filtered = nlm_local(data,local_window)
Nx = size(data,2);
ro = 3;
alfa = 3;
    for i=1:Nx   
        %odczytujemy lokalne okno
        window = reshape(data(:,i),local_window);
        %znajdujemy punkt x
        [rows, cols] = find(window == window);
        rows = reshape(rows, local_window);
        cols = reshape(cols,local_window);
        Ncy = ceil(local_window(1)/2);
        Ncx = ceil(local_window(2)/2);
        %wyznaczamy fuckcję gaussa
        h = fspecial('gaussian',local_window,25);
        %oblcizamy omega
        omega = exp((-1)*(norm((window .* h - window(Ncy-2:Ncy+2,Ncx-2:Ncy+2) .*h)).^2)/(alfa*ro*ro));
        
        data_filtered(i) = sum(sum(omega .* window));
    end
end