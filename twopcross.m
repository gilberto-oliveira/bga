% Two point crossover
%
function [_e1, _e2] = twopcross(e1, e2)
  cps = randi([2 (length(e1) - 1)], 1, 2); 
  cps = sort(cps);
  _e1 = [e1(1:cps(1)) e2(cps(1) + 1:cps(2)) e1(cps(2) + 1:end)];
  _e2 = [e2(1:cps(1)) e1(cps(1) + 1:cps(2)) e2(cps(2) + 1:end)];
end