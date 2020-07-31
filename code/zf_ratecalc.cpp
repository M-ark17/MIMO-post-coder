#include <itpp/itcomm.h>

using namespace itpp;

double
get_rate(int NR, double P, double alpha)
{
	return NR * log2(1 + P / NR / alpha);
}

#define ITER 100000

int
main(int argc, char *argv[])
{
	RNG_randomize();
	vec snr_range = "0:5:40";
	auto snr_range_linear = inv_dB(snr_range);

	int NT = argc > 1 ? atoi(argv[1]) : 9;
	int NR = argc > 2 ? atoi(argv[2]) : 3;

	double alpha;
	cmat H;
	for (int i = 0; i < ITER; ++i) {
		H = randn_c(NR, NT);
		vec s;
		svd(H, s);
		alpha = alpha + sum(pow(s, -2));
	}
	alpha = alpha / ITER;
	std::cout << alpha << "\n";

	for (int i = 0; i < snr_range.size(); ++i) {
		std::cout << snr_range(i) << "\t" << get_rate(NR, snr_range_linear(i), alpha) << "\n";
	}

	return 0;
}
