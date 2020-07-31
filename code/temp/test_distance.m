1;
function [worst_mat]= test_dist(matrix_codebook)
  for i = 1:size(matrix_codebook,1)/2
    mat_code(:,:,i) = matrix_codebook(2*i-1:2*i,:);
  end
  matrix_codebook = mat_code;
  worst_case_matrices = [];
  n_codewords = size(matrix_codebook,3);
  for i=2:n_codewords
      U1 = matrix_codebook(:,:,1);
      Ui = matrix_codebook(:,:,i);
      S = logm(U1'*Ui);
      middle_matrix = U1 * expm(S / 2);
      distance_from_U1 = norm(middle_matrix - U1, 'fro');
      distance_from_Ui = norm(middle_matrix - Ui, 'fro');
      distance_U1_Ui = norm(U1- Ui, 'fro');
      
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
%  disp("--Worst case Matrices--");
%  disp(worst_case_matrices);
  worse_code = zeros(2,2,size(worst_case_matrices,2)/2);
  for i = 1:size(worst_case_matrices,2)/2
    worse_code(:,:,i) = worst_case_matrices(:,2*i-1:2*i);
  end
%  disp("--Norm of the distance from first matrix in the codebook--")
  size_of_worst = size(worse_code)(3);
  store_norm = zeros(size_of_worst,1);
  for ii=1:size_of_worst
     store_norm(ii) = (norm(matrix_codebook(:,:,1) - worse_code(:,:,ii), 'fro'));
  end;
  [~,in] = max(store_norm);
  worst_mat = worse_code(:,:,in);
end
