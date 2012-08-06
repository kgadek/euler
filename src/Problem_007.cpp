#include <cstdio>
#include <vector>

using namespace std;

#define PRIMES_TO_SEARCH 10001

//BTW. No, this is not a Eratosthenes sieve. Seriously.
int main() {
  vector<int> primes;
  int i;
  bool is_prime;
  primes.reserve(PRIMES_TO_SEARCH);
  vector<int>::iterator p_it;
  primes.push_back(2);
  for(i = 3; primes.size() < PRIMES_TO_SEARCH; i+=2) {
    for(p_it = primes.begin(), is_prime = true; p_it != primes.end() && (*p_it)*(*p_it)<=i; ++p_it)
      if(!(i % *p_it)) is_prime = false;
    if(is_prime)
      primes.push_back(i);
  }
  printf("%d\n", primes.back());
}