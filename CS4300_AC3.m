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

for i = 1:N
    for j = 1:M
        if  G(i, j) == 1
            queue{end+1} = {i,j};
        end
    end
end

[n,m] = size(queue);

while m>0
    arc = queue(1,1);
    queue = queue(:,2:end);
    m = m-1;
    [del, D_rev] = CS4300_revise(arc,D, P);
    D = D_rev;
    if del == 1
       if isEmptyDomain(arc{1,1}{1,1}, M, D) 
           D_revised = zeros(N,M);
       end

       neighbours = getNeighbours(arc{1,1}{1,1}, arc{1,1}{1,2},M, G);
       [neighbor_row, neighbor_col] = size(neighbours);
       for k = 1: neighbor_col
            queue{end+1} = neighbours{1, k};
       end
    end
end
D_revised = D;
end

function neighbours = getNeighbours(i, j, M, G) % neighbours of i not including j, sizeof G M
    neighbours = {};
    for l = 1:M
        if l~=j
            neighbours{end+1} = G(i,l);
        end
    end
end


function check = isEmptyDomain(i,M,D)
    check = 1;
    for l = 1:M
        if D(i,l)== 1
            check = 0;
        end
    end
end
