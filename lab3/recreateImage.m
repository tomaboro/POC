function nImage = recreateImage(currImage,binaryImage,Y,X,bitNumber)
    
    nImage = uint8(zeros(Y,X));
    
    for j=1:Y
        for i=1:X
            nImage(j,i) = currImage(j,i) + uint8(binaryImage(j,i))*(2^(bitNumber-1));
        end
    end
end

