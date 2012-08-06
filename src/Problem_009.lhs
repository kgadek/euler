\begin{code}
module Problem_009 where
\end{code}


Problem 9
=========


Task
----

A Pythagorean triplet is a set of three natural numbers, $a < b < c$, for which, $a^2+b^2=c^2$

For example, $3^2 + 4^2 = 9 + 16 = 25 = 5^2$.

There exists exactly one Pythagorean triplet for which $a + b + c = 1000$.

Find the product $abc$.


Solution
--------

**First observation**: from $a<b<c$ and $a+b+c=1000$ we know that $a \leq 332\,,\quad b \leq 333\,,\quad c \leq 334$.
We can limit $b$ even more if we assume $a$ is already given: $c = 1000 - (a+b) \geq 334$ then $a+b \leq 666$ and so
$b \leq 666 - a$.

**Second observation**: from $a^2+b^2=c^2$ and $a+b+c=1000$, after we rule out $c$, we get $500000+a b = 1000*(a+b)$.
This single equation is strong enough to rule out all but one pair $\left( a,\,b\right)$ that matches. In general this
is not sufficient though.

\begin{code}
solution :: [(Int, Int, Int)]
solution = [(a,b,a*b*(1000-a-b)) | a <- [1..332], b <- [a+1..666-a], 500000+a*b == 1000*(a+b)]
\end{code}
