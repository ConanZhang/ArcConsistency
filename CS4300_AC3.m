function D_revised = CS4300_AC3(G,D,P)
% CS4300_AC3 - AC3 function from Mackworth paper 1977
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
% Dr = CS4300_AC3(G,D,'CS4300_P_no_attack');
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
            queue = {i,j};
        end
    end
end

[n,m] = size(queue);

while m>0
    for i =1:n
        for j = 1:m
            arc = queue(i,j);
            queue = queue(:,2:end);
            if CS4300_revise(arc, D, P)
               if isEmptyDomain(i, M) 
                   D_revised = zeros(N,M);
               end
               
               neighbors = getNeighbors(i, j,M, G);
               neighborSize = size(neighbors);
               for k = 1: neighborSize(2)
                    queue{end+1} = neighbors{1, k};
               end
            end
        end
    end
end
end

function neighbors = getNeighbours(i, j, M, G) %neighbours of i not including j, sizeof G M
    neighbors = {};
    for l = 1:M
        if l~=j
            neighbors{1, i} = G(i,l);
        end
    end
end


function check = isEmptyDomain(i ,M)
    check = 1;
    for l = 1:M
        if D(i,l)~=0
            check = 0;
        end
    end
end
