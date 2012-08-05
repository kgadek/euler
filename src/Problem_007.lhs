\begin{code}
module Problem_007 where
\end{code}


Problem 7
=========


Task
----

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10 001st prime number?


Solution
--------

This nice prime generator was created by [Bird][1]. I must admit I failed to prove myself a worthy programmer and used C++ to solve this problem...

    #define PRIMES_TO_SEARCH 10001
  
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

Anyway, here is *the Haskell way* solution; primes generator.

[1]: http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf

\begin{code}
primes :: [Int]
primes = 2:([3..] `minus` composites)
  where composites = union [multiples p | p <- primes]

multiples :: Int -> [Int]
multiples n = map (n*) [n..]


minus :: [Int] -> [Int] -> [Int]
(x:xs) `minus` (y:ys) | x < y  = x:(xs `minus` (y:ys))
                      | x == y = xs `minus` ys
                      | x > y  = (x:xs) `minus` ys

union :: [[Int]] -> [Int]
union = foldr merge []
  where
    merge (x:xs) ys = x:merge' xs ys
    merge' (x:xs) (y:ys) | x < y  = x:merge' xs (y:ys)
                         | x == y = x:merge' xs ys
                         | x > y  = y:merge' (x:xs) ys
\end{code}

...the solution:

\begin{code}
solution :: Int
solution = primes !! 10000
\end{code}

Take a note that we're counting from 0, that's why it's 10000 and not 10001.