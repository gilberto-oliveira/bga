% Mutate
%
function [_e] = mutate(e, mutp)
  _e = e;
  p = find(rand(size(e)) <= mutp);
  _e(p) = 1 - e(p);
end