% Langerman's function
% 0 <= x, y <= 10
% See http://www.robertmarks.org/Classes/ENGR5358/Papers/functions.pdf
%
function [z] = langerfnc(x, y)
    a = [3 5 2 1 7];
    b = [5 2 1 4 9];
    c = [1 2 5 2 3];
    m = 5;
    z = 0;
    for i = 1:m
        z += c(i) * exp(-(x - a(i)) .^ 2 / pi - (y - b(i)) .^ 2 / pi) .* ...
             cos(pi * (x - a(i)) .^ 2 + pi * (y - b(i)) .^ 2);
    end
end
