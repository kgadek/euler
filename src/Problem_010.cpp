#include <cstdio>
#include <vector>
#include <cassert>

#define PRIME_LIMIT 2000000

using namespace std;
typedef unsigned long long ull;

inline int num2pos(ull x) { return (x>>1) - 1; }
inline int pos2num(ull x) { return (x<<1) + 3; }

int main() {
  vector<bool> primes(1000000, true); // only odd nums (so does *not* include "2")
  ull sqd, // 2*i for storing step
      it,  // i^2, i^2+2*i, i^4*i... for crossing
      sum; // result: sum of primes
  for(ull i = 3; (it = (i*i)) < PRIME_LIMIT; i+=2) { // for numbers i=3,5..
    if(primes[num2pos(i)] == false)          // if number i is prime...
      continue;
    for(sqd = (i<<1); it < PRIME_LIMIT; it += sqd) // ...then cross out i^2, i^2+2*i, i^2+4*i....
      primes[num2pos(it)] = false;
  }
  sum = 2;
  for(int i=0; pos2num(i) < PRIME_LIMIT; ++i)
    if(primes[i] == true)
      sum += pos2num(i);
  printf("%lld\n",sum);
}
