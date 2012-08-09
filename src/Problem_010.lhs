\begin{code}
module Problem_010 where
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

The solution:

\begin{code}
solution :: Integer
solution = sum $ takeWhile (<2000000) primes
\end{code}

And what? This is slow, runs for about 30sec.

