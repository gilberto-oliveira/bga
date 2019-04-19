% One-point crossover
%
function [_e1, _e2] = onepcross(e1, e2)
  cpt = randi([2 (length(e1) - 1)]);
  _e1 = [e1(1:cpt) e2(cpt + 1:end)];
  _e2 = [e2(1:cpt) e1(cpt + 1:end)];
end