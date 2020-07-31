M = 2;
NBITS_PER_PARAM = 1;
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
