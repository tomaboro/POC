function ax = pochodnaX(image,x,y)
    [X,Y] = size(image);
    if(x < 2)
        x = 2;
    end
    if(x+1 > X)
        x = X-1;
    end
    if(y < 1)
        y = 1;
    end
    if(y > Y)
        y = Y;
    end
    ax = (image(x+1,y) - image(x-1,y))/2;
end