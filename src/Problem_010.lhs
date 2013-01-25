\begin{code}
module Problem_010 where

import Data.PQueue.Prio.Min
\end{code}


Problem 10
==========


Task
----

The sum of the primes below 10 is $2 + 3 + 5 + 7 = 17$.

Find the sum of all the primes below two million.


Solution
--------

See *my* solution (well, [sort of][1]) to problem 7.

[1]: http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf

\begin{code}
--primes :: [Integer]
--primes = 2:([3..] `minus` composites)
--  where composites = union [multiples p | p <- primes]

--multiples :: Integer -> [Integer]
--multiples n = map (n*) [n..]


--minus :: [Integer] -> [Integer] -> [Integer]
--(x:xs) `minus` (y:ys) | x < y  = x:(xs `minus` (y:ys))
--                      | x == y = xs `minus` ys
--                      | x > y  = (x:xs) `minus` ys

--union :: [[Integer]] -> [Integer]
--union = foldr merge []
--  where
--    merge (x:xs) ys = x:merge' xs ys
--    merge' (x:xs) (y:ys) | x < y  = x:merge' xs (y:ys)
--                         | x == y = x:merge' xs ys
--                         | x > y  = y:merge' (x:xs) ys
\end{code}

The solution is simple:

\begin{code}
solution :: Integer
solution = sum $ takeWhile (<2000000) primes
\end{code}

Real question is: how make prime searching fast in Haskell?

\begin{code}
primes = 2 : sieve [3,5..]

sieve []                      	= []
sieve (x:xs)                  	= x : sieve' xs (insertprime x xs (empty))
  where insertprime p xs table	= insert (p*p) (map (*p) xs) table
        sieve' [] table       	= []
        sieve' (x:xs) table
					| nextComposite <= x	= sieve' xs (adjust table)
					| otherwise         	= x : sieve' xs (insertprime x xs table)
					    where
								nextComposite = fst $ findMin table
								adjust table
									| n <= x = adjust ()
\end{code}