%Problem 10: Complex Neural Network%

function thresholded_output_unit = complex_net( input_pattern )

output_unit = [0;0]; % represents the level of activation in a single output unit, with an initial value of 0. 
                 %You will overwrite this value a few lines down.
input_pattern = [0;0;0]; 
                
weights = [ 1.6 0.5 0.5; -0.5 2.4 2.4 ]; 

output_unit =  weights*input_pattern; 

threshold = [2;2];

if output_unit(1,1) > threshold
    output_unit(1,1) = 1;
else
    output_unit(1,1) = 0;
end

if output_unit(2,1) > threshold
    output_unit(2,1) = 1;
else
    output_unit(2,1) = 0;
end

thresholded_output_unit = output_unit;