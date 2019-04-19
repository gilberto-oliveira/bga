% Show values like a table
%
function disptbl(d, V, int)
  p = find(mod(V(:, 1), 50) == 0 | V(:, 1) == 1);
  x = p;
  y = V(p, 2);
  z = V(p, 3);
  disp(d);
  disp([x y z]);
  printf("\tAVG\t%f\t%f\n", mean(V(:, 2)), mean(V(:, 3)));
  fflush(stdout);
end