% Calculate fitness of a element
%
function [x, y, z] = fitness(f, e, lw, up)
  [x, y] = decode(e, lw, up);
  z = f(x, y);
end