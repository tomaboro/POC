function ay = pochodnaY(image,x,y)
    [X,Y] = size(image);
    if(y < 2)
        y = 2;
    end
    if(y+1 > Y)
        y = Y-1;
    end
    if(x < 1)
        x = 1;
    end
    if(x > X)
        x = X;
    end
    ay = (image(x,y+1) - image(x,y-1))/2;
end