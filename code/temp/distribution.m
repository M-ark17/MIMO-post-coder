avg = 10000;
sig = zeros(1,avg);
sig_oct = zeros(1,avg);
unordered_svs = [];
for i = 1:avg;
  sig(i) = -log(rand(1,1));
  [~,s,v]= svd(sqrt(0.5)*(randn(2)+1j*randn(2)));
  sig_oct(i) = s(2,2);
  if rand > 0.5
    s = s(1,1);
  else
    s = s(2,2);
  end;
  unordered_svs = [unordered_svs; s.^2];
end;
hist(sig, 100, 1);
figure;
hist(unordered_svs, 100, 1,"facecolor", "r", "edgecolor", "b");

#legend ({"Verdu's distribution", "least significant eigen value(octave)"})
