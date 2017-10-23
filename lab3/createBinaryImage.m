function binImage = createBinaryImage(image,Y,X,bitNumber)
    
    binImage = zeros(Y,X);
    for nX = 1:X
        for nY = 1:Y
            binImage(nY,nX) = bitget(image(nY,nX),bitNumber);
        end
    end
    
    binImage = boolean(binImage);
end

