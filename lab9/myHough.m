function AB = myHough(image,aMin,aMax,aSkok,bMin,bMax,bSkok)
    AB = zeros(abs(aMax-aMin)/aSkok + 1,abs(bMax-bMin)/bSkok + 1);
    a_v = aMin:aSkok:aMax
    b_v = bMin:bSkok:bMax
    [X Y] = size(image);
    size(AB)
    for I=1:Y
        for J=1:X
            if(image(Y,X) == 1)
                for aa=1:length(a_v)
                    b = Y - a_v(aa)*X;
                    [v bb] = min( abs(b_v - b));
                    AB(aa,bb) = AB(aa,bb) + 1;
                end
            end
        end
    end
end

