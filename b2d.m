% Convert from Binary to Decimal
%
function [d] = b2d(b)
  wlen = length(b);
  shift = wlen-1:-1:0;
  d = sum(bitshift(b, shift));
end;