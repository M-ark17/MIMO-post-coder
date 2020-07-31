function [phi_vals, theta_vals] = gparam_test(U)
M = columns(U);
U_prev = U;

phi_vals = [];
theta_vals = [];
for i = 1:(M)
    current_column_angles = [zeros(1, i - 1) angle(U_prev(i:end,i))'];
    U_current_column_real = diag(exp(-1j * current_column_angles)) * U_prev;
    phi_vals = [phi_vals angle(U_prev(i:end,i))'];
    for j = i+1:M
        G = eye(M);
        G([i j], [i j])  = givens(U_current_column_real(i,i), U_current_column_real(j,i));
        disp(atan2(real(G(i, j)), real(G(i, i))));
        theta_vals = [theta_vals atan2(real(G(i, j)), real(G(i, i)))];
        U_current_column_real = G * U_current_column_real;
    end;
    U_prev = U_current_column_real;
end;
endfunction
