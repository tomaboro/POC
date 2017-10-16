function axy = pochodnaXY(image,x,y)
    [X,Y] = size(image);
    if(y < 2)
        y = 2;
    end
    if(y+1 > Y)
        y = Y-1;
    end
        if(x < 2)
        x = 2;
    end
    if(x+1 > X)
        x = X-1;
    end
    axy = (image(x+1,y+1) -image(x-1,y) - image(x,y-1) + image(x,y))/4;
end