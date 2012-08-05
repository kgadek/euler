\begin{code}
module Problem_001 where
\end{code}


Problem 1
=========


Task
----

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.


Solution
--------

So that was simple(tm). Sum everything from range $[1,\ldots 1000-1]$ that's divisible by 3 and by 5 and then substract what's counted twice (multiplies of 15).

Note that all numbers from $0$ to $n$ that are divisible by $x$ can be computed with: $x + 2 x + 3 x + \ldots + \left\lfloor\frac{n}{x}\right\rfloor x = x (1 + 2 + 3 + \ldots ) = x \frac{\left\lfloor\frac{n}{x}\right\rfloor (\left\lfloor\frac{n}{x}\right\rfloor+1)}{2}$

\begin{code}
solution :: Integer
solution = (sumBy 3) + (sumBy 5) - (sumBy 15)
  where nMax = 1000 - 1
        sumBy x = x * nn * (nn + 1) `div` 2
          where nn = nMax `div` x
\end{code}