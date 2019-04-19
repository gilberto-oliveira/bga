% Decode Binary value in the Decimals x and y
%
function [x, y] = decode(e, lw, up)
  bpv = round(length(e) / 2);
  fac = (up - lw) / (2 ^ bpv - 1);
  x = b2d(e(1:bpv)) * fac + lw;
  y = b2d(e(bpv + 1:end)) * fac + lw;
end