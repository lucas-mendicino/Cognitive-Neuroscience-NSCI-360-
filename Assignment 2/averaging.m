%%Problem 11: Averaging%%

RT = zeros(1,15);
Thresholds = zeros(1,15);

walks = zeros(15, 100); %store 15 walks

for t = 1:15 %15 walks
    walk = 0; %walk begins at 0
    time = 0; %init time variable
    
    while -1 < walk %until walk crosses -1
       
        if walk >= 1 %or crosses 1
            Thresholds(t) = 1; %assign 1 as the result
            RT(t) = time; %record RT of crossing 1
            break
        end
        
        walk = walk + 0.01 + normrnd(0,0.25); %increment walk
        walks(t, time+1) = walk; %store walks
        time = time + 1; %increment time
    end
    
    RT(t) = time; %record RT of crossing -1
    if Thresholds(t) ~= 1 %if the walk crossed -1
        Thresholds(t) = -1; %assign -1 as the result
    end
end

posWalks = zeros(15,100); %init positive walks
negWalks = zeros(15,100); %init negative walks

for i = 1:15 %separate walks into 1 terminating or -1 terminating
    if Thresholds(i) == 1
        for j = 1:100
            posWalks(i,j) = walks(i,j);
        end
    else
        for j = 1:100
            negWalks(i,j) = walks(i,j);
        end
    end 
end


avgPosLock = zeros(1,100);
avgNegLock = zeros(1,100);

for c = 1:100 %generate stimulus locked averaging
    sumPos = 0; %init sum
    sumNeg = 0;
    thingsToAddPos = 0; %init counter
    thingsToAddNeg = 0;
    for r = 1:15
        if posWalks(r,c) ~= 0
            sumPos = sumPos + posWalks(r,c);
            thingsToAddPos = thingsToAddPos + 1;
        end
        if negWalks(r,c) ~= 0
            sumNeg = sumNeg + negWalks(r,c);
            thingsToAddNeg = thingsToAddNeg + 1;
        end
    end
    avgPosLock(c) = sumPos / thingsToAddPos;
    avgNegLock(c) = sumNeg / thingsToAddNeg;
end

figure;
plot(avgPosLock) %plot 1s stimulus locked
figure;
plot(avgNegLock) %plot -1s stimulus locked
        
for i = 1:15 %response lock 1 terminating walks
    temp = [];
    for c = 1:100
        if posWalks(i,c) ~= 0
            temp = [temp, posWalks(i,c)];
        end
    end
    array = 100 - length(temp);
    arrayzeros = zeros(1,array);
    posWalks(i,:) = [arrayzeros,temp];
end
        
for i = 1:15 %response lock -1 terminating walks
    temp = [];
    for c = 1:100
        if negWalks(i,c) ~= 0
            temp = [temp, negWalks(i,c)];
        end
    end
    array = 100 - length(temp);
    arrayzeros = zeros(1,array);
    negWalks(i,:) = [arrayzeros,temp];
end

for c = 1:100 %generate response locked averaging
    sumPos = 0; %init sum
    sumNeg = 0;
    thingsToAddPos = 0; %init counter
    thingsToAddNeg = 0;
    for r = 1:15
        if posWalks(r, c) ~= 0
            sumPos = sumPos + posWalks(r,c);
            thingsToAddPos = thingsToAddPos + 1;
        end
        if negWalks(r,c) ~= 0
            sumNeg = sumNeg + negWalks(r,c);
            thingsToAddNeg = thingsToAddNeg + 1;
        end
    end
    avgPos(c) = sumPos / thingsToAddPos;
    avgNeg(c) = sumNeg / thingsToAddNeg;
end

figure;
plot(avgPos) %plot 1s response locked
figure;
plot(avgNeg) %plot -1s response locked