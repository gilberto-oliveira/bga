% Plot the problem
%
function [] = plotg(f, x, y, z, lw, up, step, gid)
  X = lw:step:up;
  Y = lw:step:up;
  [X, Y] = meshgrid(X, Y);
  contour(X, Y, f(X, Y), 6, 'linewidth', 1, 'linecolor', 'b');
  g = get(gcf, "currentaxes");
  set(g, "fontsize", 15, "linewidth", 2);
  hold on;
  plot(x, y, 'ks', 'markersize', 6, 'markerfacecolor', 'k', 'markeredgecolor', 'y');
  title(sprintf('Population after %02d generations', gid));
  xlabel('X');
  ylabel('Y');
  zlabel('Fitness');
  legend('Problem', 'Individual', 'location', 'southeast');
  hold off;
  drawnow;
  pause(.2);
end