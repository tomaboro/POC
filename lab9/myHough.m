function AB = myHough(image,aMin,aMax,aSkok,bMin,bMax,bSkok)
    AB = zeros((aMax-aMin),(bMax-bMin));
    a_v = aMin:aSkok:aMax;
    b_v = bMin:bSkok:bMax;
    [X Y] = imsize(image);
    for I=1:Y
        for J=1:X
            if(image(Y,X) == 1)
                [v bb] = min(abs(b_v - Y - aa*X))
                
                %%for aa=a_v
                %%b = Y - aa*X;
                %%[v bb] = min( abs(b_v - b));
                %%AB(aa,bb) = AB(aa,bb) + 1;
                %%end
            end;
        end
    end
end

