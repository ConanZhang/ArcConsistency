function attack_possible = CS4300_P_no_attack(i,a,j,b)
% CS4300_P_no_attack - P function from Mackworth paper 1977
% On input:
% i (int): start node index
% a (int): start node domain value
% j (int): end node index
% b (int): end node domain value
% On output:
% attack_possible (boolean): Says whether the attack is possible
% Call:
% CS4300_P_no_attack(i,a,j,b);
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%
attack_possible = 0;

% Check col
if a == b
    attack_possible = 1;
end

% Check diagonal
index_difference = abs(i-a);
domain_difference = abs(j-b);

if index_difference == domain_difference
    attack_possible = 1;
end