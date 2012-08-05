\begin{code}
module Problem_003 where
\end{code}


Problem 3
=========


Task
----

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?


Solution
--------

This is probably *just ok*. It computes the result in $O\left(\sqrt{n}\right)$.

Divide the number n by $2$ (as long as you can) and then by $3, 5, \ldots 2k+1$ until we get 1. Note: we divide the number as long as we can, so for example 12 is divided by 2 (we get 6), then again by 2 (we get 3), we proceed to dividing by 3 (we get 1) and we finish.

\begin{code}
solution :: Int
solution = find_factors n 2 2
  where find_factors :: Int -> Int -> Int -> Int
        find_factors num divisor acc
          | num == 1 = acc
          | num_mod == 0 = find_factors num_div divisor divisor -- could we skip to next divisor already?
          | divisor == 2 = find_factors num 3 acc
          | otherwise = find_factors num (divisor + 2) acc
          where num_mod = num `rem` divisor
                num_div = num `div` divisor
        n = 600851475143
\end{code}