function LUT(obraz, przekodowanie)

newImage = intlut(obraz,przekodowanie);
subplot(2,2,1:2);
plot(przekodowanie);
title('przekodowanie');
subplot(2,2,3);
imshow(obraz);
title('oryginał')
subplot(2,2,4);
imshow(newImage);
title('po operacji LUT')

end

