function P = CS4300_A3_Driver(i,a,j,b)
% CS4300_A3_Driver - Driver function for A3
% On input:
% i (int): start node index
% a (int): start node domain value
% j (int): end node index
% b (int): end node domain value
% On output:
%
% Call:
% CS4300_A3_Driver(i,a,j,b);
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

for N = 4:10
    G = ~ eye(N,N);
    for p = 0:0.2:1
        for t = 1:200
            D = rand(N,N) <p ;
            %timer start
            Dr = CS4300_AC1(G, D, p);
        end
    end
end