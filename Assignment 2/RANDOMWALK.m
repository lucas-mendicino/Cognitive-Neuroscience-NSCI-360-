%%Problem 7: Random Walk Model Response Times%%


RT = zeros(1,150);
Thresholds = zeros(1,150);
figure;
hold on;

for t = 1:150 % 150 walks
    walk = 0; % walk begins at 0
    time = 0; % init time variable    
    while -1 < walk % until walk crosses -1       
        if walk >= 1 % or crosses 1
            Thresholds(t) = 1; % assign 1 as the result
            RT(t) = time; % record RT of crossing 1
            break
        end        
        walk = walk + 0.01 + normrnd(0,0.25); %increment walk
        time = time + 1; % increment time
    end    
    RT(t) = time; % record RT of crossing -1
    if Thresholds(t) ~= 1 % if the walk crossed -1
        Thresholds(t) = -1; % assign -1 as the result
    end
end

%dfittool
histogram(RT) % create RT histogram
save('RT') % save RT data
save('Thresholds') % save Threshold data