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
delete = 1;

for i = 1:N
    for j = 1:M
        if  G(i, j) == 1
            queue{end+1} = {i,j};
        end
    end
end

[n,m] = size(queue);
noChangeCounter = 0;
%while delete == 1
while noChangeCounter<m
    delete = 1;
    for i =1:n
        for j = 1:m
            [del, D_rev] = CS4300_revise(queue(i,j),D, P);
            delete = del;
            if(del==0)
                noChangeCounter= noChangeCounter+1;
            end 
            D = D_rev;
        end
    end
end
D_revised = D;


