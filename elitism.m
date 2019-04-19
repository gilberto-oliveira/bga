% Make Elitism
%
function [pgap] = elitism(gap, P, z)
  for i = 1:gap
    [e, id] = max(z);
    pgap(i, :) = P(id, :);
    z(id) = [];
    P(id, :) = [];
  end
end