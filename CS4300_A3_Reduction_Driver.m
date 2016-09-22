function P = CS4300_A3_Reduction_Driver()
% CS4300_A3_Reduction_Driver - Driver function for A3 to determine
% conditional expected reduction
% On input:
% On output:
%
% Call:
% CS4300_A3_Reduction_Driver();
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

% AC1_times = zeros(6*200*7, 1);
% AC3_times = zeros(6*200*7, 1);
% AC1_times = zeros(6*7, 1);
% AC3_times = zeros(6*7, 1);
AC1_times_counter = 1;
AC3_times_counter = 1;

% toc_timer_AC1 = 0;
% toc_timer_AC3 = 0;
num_ones_before = zeros(6*200*7, 1);
num_ones_after = zeros(6*200*7, 1);
reductions = zeros(6*200*7, 1);

for N = 4:10
    G = ~ eye(N,N);
    for p = 0:0.2:1
        for t = 1:200
            D = rand(N,N) <p ;
            num_ones_before (AC1_times_counter)= sum(sum(D));
            Dr = CS4300_AC1(G, D, 'CS4300_P_no_attack'); 
            
            num_ones_after (AC1_times_counter) = sum(sum(Dr));
            reductions(AC1_times_counter) = num_ones_before(AC1_times_counter) - num_ones_after(AC1_times_counter);

            AC1_times_counter = AC1_times_counter +1;            
%            Dr = CS4300_AC3(G, D, 'CS4300_P_no_attack');   
        end
    end 
end

N4_ones_before = num_ones_before(1:1200, 1);
N4_ones_after = num_ones_after(1:1200, 1);
N4_reductions = reductions(1:1200, 1);

N5_ones_before = num_ones_before(1201:2400, 1);
N5_ones_after = num_ones_after(1201:2400, 1);
N5_reductions = reductions(1201:2400, 1);

N6_ones_before = num_ones_before(2401:3600, 1);
N6_ones_after = num_ones_after(2401:3600, 1);
N6_reductions = reductions(2401:3600, 1);

N7_ones_before = num_ones_before(3601:4800, 1);
N7_ones_after = num_ones_after(3601:4800, 1);
N7_reductions = reductions(3601:4800, 1);

N8_ones_before = num_ones_before(4801:6000, 1);
N8_ones_after = num_ones_after(4801:6000, 1);
N8_reductions = reductions(4801:6000, 1);

N9_ones_before = num_ones_before(6001:7200, 1);
N9_ones_after = num_ones_after(6001:7200, 1);
N9_reductions = reductions(6001:7200, 1);

N10_ones_before = num_ones_before(7201:8400, 1);
N10_ones_after = num_ones_after(7201:8400, 1);
N10_reductions = reductions(7201:8400, 1);

expected_reduction = zeros(7, 101);
expected_reduction_count = zeros(7, 101);

xls = linspace(1, 7);
 
for i = 1:1200
    if N4_ones_before(i) ~= 0
        expected_reduction(1, N4_ones_before(i)) = expected_reduction(1, N4_ones_before(i)) + N4_reductions(i);
        expected_reduction_count(1, N4_ones_before(i)) = expected_reduction_count(1, N4_ones_before(i)) + 1;
    end
end

for i = 1:1200
    if N5_ones_before(i) ~= 0
        expected_reduction(2, N5_ones_before(i)) = expected_reduction(2, N5_ones_before(i)) + N5_reductions(i);
        expected_reduction_count(2, N5_ones_before(i)) = expected_reduction_count(2, N5_ones_before(i)) + 1;
    end
end

for i = 1:1200
    if N6_ones_before(i) ~= 0
        expected_reduction(3, N6_ones_before(i)) = expected_reduction(3, N6_ones_before(i)) + N6_reductions(i);
        expected_reduction_count(3, N6_ones_before(i)) = expected_reduction_count(3, N6_ones_before(i)) + 1;
    end
end

for i = 1:1200
    if N7_ones_before(i) ~= 0
        expected_reduction(4, N7_ones_before(i)) = expected_reduction(4, N7_ones_before(i)) + N7_reductions(i);
        expected_reduction_count(4, N7_ones_before(i)) = expected_reduction_count(4, N7_ones_before(i)) + 1;
    end
end

for i = 1:1200
    if N8_ones_before(i) ~= 0
        expected_reduction(5, N8_ones_before(i)) = expected_reduction(5, N8_ones_before(i)) + N8_reductions(i);
        expected_reduction_count(5, N8_ones_before(i)) = expected_reduction_count(5, N8_ones_before(i)) + 1;
    end
end

for i = 1:1200
    if N9_ones_before(i) ~= 0
        expected_reduction(6, N9_ones_before(i)) = expected_reduction(6, N9_ones_before(i)) + N9_reductions(i);
        expected_reduction_count(6, N9_ones_before(i)) = expected_reduction_count(6, N9_ones_before(i)) + 1;
    end
end

for i = 1:1200
    if N10_ones_before(i) ~= 0
        expected_reduction(7, N10_ones_before(i)) = expected_reduction(7, N10_ones_before(i)) + N10_reductions(i);
        expected_reduction_count(7, N10_ones_before(i)) = expected_reduction_count(7, N10_ones_before(i)) + 1;
    end
end

for i=1:7
    for j=1:101
        if i == 3
            expected_reduction(i,j)
            expected_reduction_count(i,j)
        end
        expected_reduction(i,j) = expected_reduction(i,j) / expected_reduction_count(i,j);
    end
end

plot(1:101, expected_reduction(1:7, 1:101))
legend('N=4','N=5','N=6','N=7','N=8','N=9','N=10');
end