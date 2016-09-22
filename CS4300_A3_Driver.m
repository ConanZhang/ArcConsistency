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

time_complexity = [];
time_complexity_AC3 = [];
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
            D = rand(N,N) <p ;
            
          
            num_ones_before (AC1_times_counter)= countOnesHelper(D);
            
            tic;
            Dr = CS4300_AC1(G, D, 'CS4300_P_no_attack'); 
%             AC1_times(AC1_times_counter) = toc;
%             AC1_times_counter = AC1_times_counter +1;
            toc_timer_AC1 = toc_timer_AC1 + toc;
            
            
            num_ones_after (AC3_times_counter) = countOnesHelper(Dr);
            
            tic;
            Dr = CS4300_AC3(G, D, 'CS4300_P_no_attack');
%             AC3_times(AC3_times_counter) = toc;
%             AC3_times_counter = AC3_times_counter +1;
            toc_timer_AC3 = toc_timer_AC3 + toc;
            
            
        end
%         AC3_times_counter = AC3_times_counter +1;
%         AC1_times_counter = AC1_times_counter +1;
%         AC1_times(AC1_times_counter) = toc_timer_AC1/200;
%         AC3_times(AC3_times_counter) = toc_timer_AC3/200;
    end
        
         time_complexity(end+1) = toc_timer_AC1/1200;
         time_complexity_AC3(end+1) = toc_timer_AC3/1200;
         %AC3_times(AC3_times_counter) = toc_timer_AC3/200;
end

%  plot(num_ones_before);
%    title('Figure 3: Number of Ones Before Algorithms')
%    xlabel('Trials with varied probabilities of 1s and Number of Queens')
%    ylabel('Number of Ones')


%  plot(num_ones_after);
%    title('Figure 4: Number of Ones After Algorithms')
%    xlabel('Trials with varied probabilities of 1s and Number of Queens')
%    ylabel('Number of Ones')

% %AC1 Times plot
%  i = 0;
%  list = [];
%     while(i<0.8)
%         list(end+1) = i;
%         i = i+ 0.02;
%     end
%    list
%   plot(AC1_times);
%   set(gca,'YTick',list );
%     title('Figure 1: AC-1 Trial Times')
%     xlabel('Trials with varied probabilities of 1s and Number of Queens')
%     ylabel('Time')
% 
%     plot(AC3_times);
%     set(gca,'YTick',list );
%     title('Figure 2: AC-3 Trial Times')
%     xlabel('Trials varied probabilities of 1s and Number of Queens')
%     ylabel('Time')
% 

t= [4:10];
x = polyfit(t,time_complexity,2)
x2 = linspace(4,10);
y2 = polyval(x, x2);
plot(t,time_complexity,'o', x2, y2)
title('Figure 5: Avg time of AC1 for every N and fitting to polynoial function' )
xlabel('N')
ylabel('AVG Time')

hold on

x3 = polyfit(t,time_complexity_AC3,2)
y3 = polyval(x3, x2);
plot(t,time_complexity_AC3,'+', x2, y3)
title('Figure 5: Avg time of AC3 for every N and fitting to polynoial function' )
xlabel('N')
ylabel('AVG Time')

legend('AC1', 'BestFit for AC1', 'AC3', 'BestFit for AC3');
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
