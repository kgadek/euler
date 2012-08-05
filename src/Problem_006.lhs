\begin{code}
module Problem_006 where
\end{code}


Problem 6
=========


Task
----

The sum of the squares of the first ten natural numbers is,
$1^2 + 2^2 + ... + 10^2 = 385$

The square of the sum of the first ten natural numbers is,
$(1 + 2 + ... + 10)^2 = 3025$

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is $3025 - 385 = 2640$.
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


Solution
--------

I don't like this kind of solutions, as I'm sure there was a simple equation for $1^2+\ldots+n^2$ but I can't recall it.
Equation for $1+\ldots+n$ is $\frac{n (n+1)}{2}$ but we're doing it in *ugly-way* anyway.

\begin{code}
solution_one :: Integer
solution_one = (sum [1..100])^2 - (sum $ map (^2) [1..100])
\end{code}

But *why so serious*? [A000330](http://oeis.org/A000330) gives the answer: $1^2+\ldots+n^2 = \frac{2 n^3 + 3 n^2 + n}{6}$.

\begin{code}
solution :: Integer
solution = square_sum - sum_squares 
  where sum_squares = (2*n*n+3*n+1)*n `div` 6
        square_sum  = just_sum^2
        just_sum    = n*(n+1) `div` 2
        n           = 100
\end{code}

