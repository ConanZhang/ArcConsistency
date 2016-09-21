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

% AC1_times = zeros(6*200*7, 1);
% AC3_times = zeros(6*200*7, 1);
AC1_times = zeros(6*7, 1);
AC3_times = zeros(6*7, 1);
AC1_times_counter = 1;
AC3_times_counter = 1;

toc_timer_AC1 = 0;
toc_timer_AC3 = 0;
num_ones_before = zeros(6*200*7, 1);
num_ones_after = zeros(6*200*7, 1);

for N = 4:10
    G = ~ eye(N,N);
    for p = 0:0.2:1
        toc_timer_AC1 = 0;
        toc_timer_AC3 = 0;
        for t = 1:200
            %D = rand(N,N) <p ;
            D = ones(4,4);
            D(2,2) =0;
            D(2,3)=0;
            D(2,4)= 0;
            num_ones_before (AC1_times_counter)= countOnesHelper(D);
            
            tic;
            Dr = CS4300_AC1(G, D, 'CS4300_P_no_attack'); 
            %AC1_times(AC1_times_counter) = toc;
            %AC1_times_counter = AC1_times_counter +1;
            toc_timer_AC1 = toc_timer_AC1 + toc;
            
            
            num_ones_after (AC3_times_counter) = countOnesHelper(Dr);
            
            tic;
            Dr = CS4300_AC3(G, D, 'CS4300_P_no_attack');
            %AC3_times(AC3_times_counter) = toc;
            %AC3_times_counter = AC3_times_counter +1;
            toc_timer_AC3 = toc_timer_AC3 + toc;
            
            
        end
        AC3_times_counter = AC3_times_counter +1;
        AC1_times_counter = AC1_times_counter +1;
        AC1_times(AC1_times_counter) = toc_timer_AC1/200;
        AC3_times(AC3_times_counter) = toc_timer_AC3/200;
    end
    
end

% plot(num_ones_before);
%   title('Figure 3: Number of Ones Before Algorithms')
%   xlabel('Trials with varied probabilities of 1s and Number of Queens')
%   ylabel('Number of Ones')


% plot(num_ones_after);
%   title('Figure 4: Number of Ones After Algorithms')
%   xlabel('Trials with varied probabilities of 1s and Number of Queens')
%   ylabel('Number of Ones')

%AC1 Times plot
% plot(AC1_times);
 %set(gca,'YTick',[0, 1] );
%   title('Figure 1: AC-1 Trial Times')
%   xlabel('Trials with varied probabilities of 1s and Number of Queens')
%   ylabel('Time')

  plot(AC3_times);
%   %set(gca,'YTick',[0, 1] );
  title('Figure 2: AC-3 Trial Times')
  xlabel('Trials with varied probabilities of 1s and Number of Queens')
  ylabel('Time')

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
