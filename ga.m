close all;
clear all;
clc;

# compute start time
st = time();

% Evaluation function
f = @(x, y) f6(x, y);

% GA global paramenters
posz = 100; gesz = 50;
mutp = .01; crossp = .75;
lw = -100;  up = 100;
# number of generations and gap (elitism)
numg = 500; ngap = 0;
npsz = 10;  nrsz = 10;

# output parameters
x = zeros(1, posz);
y = zeros(1, posz);
z = zeros(1, posz);

mean_fits = zeros(1, numg); 
best_fits = zeros(1, numg);
best_fits_run = zeros(nrsz, numg);
mean_fits_run = zeros(nrsz, numg);
best_fits_pop = zeros(npsz, numg);
mean_fits_pop = zeros(npsz, numg);

for pid = 1:npsz
  % Creating an initial population
  P = genp(posz, gesz);
  P_tmp = P;
  for rid = 1:nrsz
    for gid = 1:numg
      for i = 1:posz
        [x(i), y(i), z(i)] = fitness(f, P(i, :), lw, up);  
      end
      # plot visual result
      # plotg(f, x, y, z, lw, up, .1, gid);
      # collect statistics
      best_fits(gid) = max(z); 
      mean_fits(gid) = mean(z);
      # print statistics
      printf('Population %02d. Run %02d\n', pid, rid);
      printf('Generation %02d, mean fitness: %f\n', gid, mean_fits(gid));
      printf('Best fitness: %f\n\n', best_fits(gid));
      fflush(stdout);
      # new population
      newp = zeros(posz, gesz);
      cnt = 0;
      # elitism
      if (ngap > 0)
        pgap = elitism(ngap, P, z);
        [cnt, ~] = size(pgap);
        newp(1:cnt, :) = pgap(1:cnt, :);
      end
      # generation loop
      while (cnt < posz)
        # selection
        #e1 = P(roulette(z), :);
        #e2 = P(roulette(z), :);
        e1 = P(tournament(z), :);
        e2 = P(tournament(z), :);
        # crossover
        if (rand <= crossp)
            #[e1, e2] = onepcross(e1, e2);
            #[e1, e2] = twopcross(e1, e2);
            [e1, e2] = unipcross(e1, e2);
        end
        # mutation
        e1 = mutate(e1, mutp);
        e2 = mutate(e2, mutp); 
        # update new population
        cnt += 1;
        newp(cnt, :) = e1;
        cnt += 1;
        newp(cnt, :) = e2;
      end
      # pop old population
      P = newp;
    end
    best_fits_run(rid, :) = best_fits;
    mean_fits_run(rid, :) = mean_fits;
    P = P_tmp;
  end
  best_fits_pop(pid, :) = mean(best_fits_run);
  mean_fits_pop(pid, :) = mean(mean_fits_run);
end

# computation time
dt = time() - st;
printf('Computation time: %fs - %fmin\n\n', dt, (dt / 60));

# save results
#csvwrite("renER1p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reER1p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("renET2p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reET2p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("renERUn.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reERUn.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reETUn.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("renETUn.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reE2R1p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reE2T1p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reE3T2p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);
#csvwrite("reE3R2p.csv", [squeeze((1:numg))' mean(mean_fits_pop)' mean(best_fits_pop)']);

# plot results
t = 1:numg;
figure;
plot(t, mean(best_fits_pop), '--b', 'linewidth', 2, ...
     t, mean(mean_fits_pop), '--r', 'linewidth', 2);
g = get(gcf, 'currentaxes');
set(g, "fontsize", 15, "linewidth", 2);
h = legend('Best fitness', 'Mean fitness', 'location', 'southeast');
set(h, 'fontsize', 15); 
#grid minor;
title('Evolution');
xlabel('Number of generations');
ylabel('Fitness');