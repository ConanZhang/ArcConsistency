function P = CS4300_A3_Driver()
% CS4300_A3_Driver - Driver function for A3
% On input:
% On output:
%
% Call:
% CS4300_A3_Driver();
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

AC1_times = zeros(6*200*7, 1);
AC3_times = zeros(6*200*7, 1);
AC1_times_counter = 1;
AC3_times_counter = 1;

num_ones_before = zeros(6*200*7, 1);
num_ones_after = zeros(6*200*7, 1);

for N = 4:10
    G = ~ eye(N,N);
    for p = 0:0.2:1
        for t = 1:10
            D = rand(N,N) <p ;
            
            num_ones_before (AC1_times_counter)= countOnesHelper(D);
            
            tic;
            Dr = CS4300_AC1(G, D, 'CS4300_P_no_attack'); 
            AC1_times(AC1_times_counter) = toc;
            AC1_times_counter = AC1_times_counter +1;
            
            num_ones_after (AC3_times_counter) = countOnesHelper(Dr);
            
            tic;
            Dr = CS4300_AC3(G, D, 'CS4300_P_no_attack');
            AC3_times(AC3_times_counter) = toc;
            AC3_times_counter = AC3_times_counter +1;
            
            
        end
    end
    
end

%plot(num_ones_before);
plot(num_ones_after);

% plot(AC1_times);
% plot(AC3_times);

end

function one_count = countOnesHelper(matrix)
[n, m] = size(matrix);
one_count = 0;
for i= 1:n
    for j= 1:m
        if matrix(i,j)==1
            one_count = one_count +1;
        end
    end
end

end
