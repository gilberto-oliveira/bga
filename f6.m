% F6 Function
%
function [z] = f6(x, y)
  z = 0.5 - ((sin(sqrt(x .^ 2 + y .^ 2)) .^ 2 - .5) ./ ...
            (1 + .001 * (x .^ 2 + y .^ 2)) .^ 2);
end