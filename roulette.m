% Roulette Selection
%
function [id] = roulette(z)
  acc = cumsum(z);
  lim = rand * acc(end);
  id = find(acc >= lim, 1);
end