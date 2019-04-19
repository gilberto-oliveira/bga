% Tournament Selection
%
function [id] = tournament(z)
  n = length(z);
  [~, i] = sort(z);
  i = i(round(n / 2 + 1):end);
  id = i(round(rand * (n / 2 - 1) + 1));
end