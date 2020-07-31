function r = y_integral(y)
  x = y:0.0001:35;
  g = (1 - x / 9).^2 .* (x.^8).*exp(-x) / 4480 + x.^8 .* exp(-x) / 40320;
  r = trapz(x, (log2(x) - log2(y)) .* g);
end
