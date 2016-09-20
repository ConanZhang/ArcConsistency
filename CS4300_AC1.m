function D_revised = CS4300_AC1(G,D,P)
% CS4300_AC1 - AC1 function from Mackworth paper 1977
% On input:
% G (nxn array): neighborhood graph for n nodes
% D (nxm array): m domain values for each of n nodes
% P (string): predicate function name; P(i,a,j,b) takes as
% arguments:
% i (int): start node index
% a (int): start node domain value
% j (int): end node index
% b (int): end node domain value
% On output:
% D_revised (nxm array): revised domain labels
% Call:
% G = 1 - eye(3,3);
% D = [1,1,1;1,1,1;1,1,1];
% Dr = CS4300_AC1(G,D,'CS4300_P_no_attack' );
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

queue = {};
[N, M]= size(G);
change = 0;


for i = 1:N
    for j = 1:M
        if  G(i, j) == 1
            queue{1, j} = {i,j};
        end
    end
end
change =1;
[n,m] = size(queue);
while change==1 
    for i =1:n
        for j = 1:m
            change = CS4300_revise(queue(i,j),D, P);
        end
    end
end
    


