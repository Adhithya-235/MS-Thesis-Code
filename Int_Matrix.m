%Given a set of three n-vectors representing x,y,z coordinates
%of n point vortex charges, this function yields three interaction matrices
%representing relative x-positions (A), relative y-positions (B), and
%exponentiated inverse euclidean distances (D).


function[D,A,B] = Int_Matrix(x_vec,y_vec,z_vec)

n = length(x_vec);
D = zeros(n,n);
A = zeros(n,n);
B = zeros(n,n);

for i = 1:n
    for j = 1:n
        
        A(i,j) = x_vec(i) - x_vec(j);
        B(i,j) = y_vec(i) - y_vec(j);
        
        if i==j
            D(i,j) = 0;
        else
            D(i,j) = ((A(i,j))^2 + (B(i,j))^2 + (z_vec(i) - z_vec(j))^2)^(-3/2);
        end
                    
    end
end

end
