M = 2;
NBITS_PER_PARAM = 3;
phi_levels = -180:(360/(2**NBITS_PER_PARAM)):180;
phi_levels = (phi_levels(2:end) + phi_levels(1:end-1)) / 2;
disp(phi_levels);

theta_levels = [28.617 61.237];
disp(theta_levels);
phi_levels = phi_levels * pi / 180;
theta_levels = theta_levels * pi / 180;

phi_codebook = permn(phi_levels, M * (M + 1) / 2);
overall_codebook = [];
for i=1:length(theta_levels)
    new_codebook_block = zeros(rows(phi_codebook), columns(phi_codebook) + 1);
    new_codebook_block(:,1:end-1) = phi_codebook;
    new_codebook_block(:,end) = theta_levels(i);
    overall_codebook = [overall_codebook;new_codebook_block];
end;
disp('CODEBOOK:');
disp(overall_codebook);
n_codewords = rows(overall_codebook);

matrix_codebook = zeros(M, M, n_codewords);
for i=1:n_codewords
    matrix_codebook(:,:,i) = givens_reconstruct(overall_codebook(i,:));
end;

worst_case_matrices = [];
for i=2:n_codewords
    U1 = matrix_codebook(:,:,1);
    Ui = matrix_codebook(:,:,i);
    S = logm(U1'*Ui);
    middle_matrix = U1 * expm(S / 2);
    distance_from_U1 = norm(middle_matrix - U1, 'fro');
    found_better_quantied_point = 0;
    for j=2:n_codewords
        if j == i
            continue
        end;
        test_distance = norm(middle_matrix - matrix_codebook(:,:,j), 'fro');
        if test_distance < distance_from_U1
            found_better_quantied_point = 1;
            break;
        end
    end;
    if ~found_better_quantied_point
        worst_case_matrices = [worst_case_matrices middle_matrix];
    end
end;
worst_case_matrices = reshape(worst_case_matrices, 2, 2, columns(worst_case_matrices) / 2);
for i=1:size(worst_case_matrices)(3)
    disp(norm(matrix_codebook(:,:,1) - worst_case_matrices(:,:,i), 'fro'));
end;
