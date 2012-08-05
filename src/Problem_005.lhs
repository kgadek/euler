\begin{code}
module Problem_005 where
\end{code}


Problem 5
=========


Task
----

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


Solution
--------

This is another straightforward solution. We start with list containing $\{2\}$.
For each number $[3,\ldots 20]$ we try to divide it by everything in a list.
What is left is added to the list. When we're done, we multiply contents of
a list and that's the result.

I *think* this is correct in general case, but I have no formal proof.


\begin{code}
solution :: Int
solution = foldl (*) 1 $ foldl consIf [2] [3..20]
  where consIf list num = case newFactor num list of
          Nothing -> list
          Just x -> (x : list)
        newFactor 1 []      = Nothing
        newFactor x []      = Just x
        newFactor x (hd:tl)
          | x `rem` hd == 0 = newFactor (x `div` hd) tl
          | otherwise       = newFactor x tl
\end{code}
