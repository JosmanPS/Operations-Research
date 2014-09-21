
% ************************ OR_Prim ***************************************

% Author: Jose Manuel Proudinat Silva
% C.U. 000130056

% Description: 
% This function computes the Minimum Spanning Tree of a graph. We use
% Prim's algorithm to solve the problem.

% Input:
% C : matrix of costs for each edge. Non existing edges are represented
% with Inf.
% r : root (default = 1).

% Output:
% T : minimum spanning tree of the graph (described by the edges).
% z : optimal value.

% ************************************************************************

% Inputs
C = input('Introduce the cost matrix: \n');
r = input('Introduce the root of the minimum spanning tree: \n');


% ****************** E R R O R S *****************************************
% Error 1.
if(size(C,1) ~= size(C,2))
    display('Error: matrix of costs must be square.')
    return
end

% Error 3.
if(C(1,1) ~= Inf)
    display('Error: If there is no vertex, please write Inf.')
    return
end
% ************************************************************************


% ************ M I N I M U M   S P A N N I N G   T R E E *****************

% Get the number of vertex.
n = size(C,1);

% Create the initial matrix for T.
T = zeros(n-1,2);

% V_T saves which vertex are in T.
% V_H saves which vertex are in G - T.
V_T = r;
V_H = 1:n;
V_H(V_T) = [];

% Initial cost value.
z = 0;

for t = 1:(n-1)
    
    min_cost = [];
    i_pos = 0;
    j_pos = 0;
    ind = 1;
    
    % Search the edge of minimum cost
    % For i in the vertex that are in the tree we look for the minimum cost
    % edges.
    for i = V_T
        % Use the min() function to find the minimum edge for each vertex
        % i.
        [min_cost(ind), k] = min(C(V_H, i));
        % Save the row position in cost matrix, that represents a vertex.
        i_pos(ind) = i;
        % Save the column position in cost matrix, that represents a
        % vertex.
        j_pos(ind) = V_H(k);
        ind = ind + 1;
    end
    
    % Now we have the minimum cost edge for each vertex in the tree.
    % So we take the minimum of them.
    [min_cost, k] = min(min_cost);
    % Save row and column position of the minimum edge.
    i_pos = i_pos(k);
    j_pos = j_pos(k);
    
    % Add the new vertex to the tree.
    V_T = [V_T, j_pos];
    % Update G - T.
    V_H(V_H == j_pos) = [];
    
    % Sum the cost of the new edge.
    z = z + min_cost;
    
    % Save the vertex.
    T(t, :) = sort([i_pos, j_pos]);  
    
end

disp(' ')
disp(' ')
disp('The edges of the minimum spanning tree are:')
T

disp(' ')
disp(' ')
disp('The optimal cost is:')
z

% ************************************************************************

