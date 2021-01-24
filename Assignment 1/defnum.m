
function y = defnum(x) 
    if x >0 
        if rem(x,2) == 1
            disp('positive, odd');
        elseif rem(x,2) == 0 
            disp('positive, even');
        end
    elseif x < 0
        if rem(x,2) == -1
            disp('negative, odd');
        elseif rem(x,2) == 0 
            disp('negative, even');
        end
    else x = 0
        disp('zero');
    
    end
end
