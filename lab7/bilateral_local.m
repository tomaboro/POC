function data_filtered = bilateral_local(data,local_window)
Nx = size(data,2);
ro = 3;
Ncy = ceil(local_window(1)/2);
Ncx = ceil(local_window(2)/2);
h = fspecial('gaussian',local_window,25);
    for i=1:Nx   
        %odczytujemy lokalne okno
        window = reshape(data(:,i),local_window);
        %obliczamy ||p - x|| (dist)
        [rows, cols] = find(window == window);
        rows = reshape(rows, local_window);
        cols = reshape(cols,local_window);
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
        %obliczmy psi
        psi = dist .* h;
        %obliczamy odleglosc w przeciwdziedzinie
        dist_anty = abs(window - window(Ncy,Ncx));
        %obliczamy gamma
        gamma = (-1)*(dist_anty .* dist_anty)/(2*ro*ro);
        %obliczamy Wn
        Wn = sum(sum(psi .* gamma));
        
        data_filtered(i) = sum(sum(psi .* gamma .* window))/Wn;
    end
end