%Problem 9: micro-SAT computations%


RT = zeros(1,150);
Thresholds = zeros(1,150);

for t = 1:150 %150 walks
    walk = 0; %walk begins at 0
    time = 0; %init time variable
    
    while -1 < walk %until walk crosses -1
       
        if walk >= 1 %or crosses 1
            Thresholds(t) = 1; %assign 1 as the result
            RT(t) = time; %record RT of crossing 1
            break
        end
        
        walk = walk + 0.01 + normrnd(0,0.25); %increment walk
        time = time + 1; %increment time
    end
    
    RT(t) = time; %record RT of crossing -1
    if Thresholds(t) ~= 1 %if the walk crossed -1
        Thresholds(t) = -1; %assign -1 as the result
    end
end


[sorted_rt, index] = sort (RT); %sort the RT times
sorted_Thresholds = zeros(1,150); %init list of thresholds

for i = 1:150 %populate sorted thresholds
    sorted_Thresholds(i) = Thresholds(index(i));
end

xlim([0, 9]);
prop_pos = zeros(1,10);
prop_neg = zeros(1,10);

for i = 0:9 %window counter
    pos = 0;
    neg = 0;
    for a = 1:15 %index within window
        if sorted_Thresholds(i * 15 + a) == 1
            pos = pos + 1;
        else
            neg = neg + 1;
        end
        total = pos + neg; 
    end
    prop_pos(i+1) = pos / total;
    prop_neg (i+1) = neg / total;
end

plot(prop_pos, 'r.-') % plot proportion of 1s

neg_One_Cross = 0;
num_Neg_Crosses = 0;
One_Cross = 0;
num_Crosses = 0;

for i = 1:150 %average RT for 1/-1 trials
    if sorted_Thresholds(i) == 1
        One_Cross = One_Cross + sorted_rt(i);
        num_Crosses = num_Crosses + 1;
    else
        neg_One_Cross = neg_One_Cross + sorted_rt(i);
        num_Neg_Crosses = num_Neg_Crosses + 1;
    end
end

avg_One_Cross = One_Cross / num_Crosses;
avg_One_Neg_Cross = neg_One_Cross / num_Neg_Crosses;
disp(avg_One_Cross)
disp(avg_One_Neg_Cross)