%Problem 12: Non Homogenous Poisson%

function non_homog_poisson_()

figure;
hold on;

d_rate = 3; % # of firing rate changes
trials = 10; 
number_of_spikes = 30; % spikes per trial
y = trials; 
firing_rate = [ 3 11 7 ]; % three firing rates
st = zeros(1,number_of_spikes); % bin for spike data

for i = 1:number_of_spikes % spike times
    st(i) = i;
end

                                                % spike raster with rate changes plot
for trial = 1:trials %iterate through trials
    times = zeros(1,number_of_spikes*3);    
    for rate_change = 1:d_rate % apply changes to firing rates
        isd = exprnd(firing_rate(rate_change),1,number_of_spikes); % interspike durations    
        for spike = 1:length(isd)   % spike times with rate change
            times(st(spike)) = isd(spike); 
        end       
        for index = 1:length(st)
            st(index) = index + number_of_spikes;
        end
    end    
    times = cumsum(times); %create spike times   
    for spike = 1:number_of_spikes*3
        plot([ times(spike),times(spike) ],[y-1 y]);
        xlim([0, 300]);
        ylim([0,10]);
    end
    
    y = y - 1;

end

figure;
histogram(times)