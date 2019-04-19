% Uniform crossover
%
function [_e1, _e2] = unipcross(e1, e2)  
  alpha = randi([0 1], size(e1));
  _e1 = alpha .* e1 + (1 - alpha) .* e2;
  _e2 = alpha .* e2 + (1 - alpha) .* e1;
endfunction