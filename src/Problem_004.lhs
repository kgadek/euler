\begin{code}
module Problem_004 where
\end{code}


Problem 4
=========


Task
----

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.

Find the largest palindrome made from the product of two 3-digit numbers.


Solution
--------

First prototype. This is *brute force*. Computes ~15 sec but seems to work well.

\begin{code}
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = reverse xs == xs

numToList :: Int -> [Int]
numToList x = n2l x []
  where n2l 0 acc = acc
        n2l n acc = n2l (n `div` 10) ((n `rem` 10) : acc)

solution_one :: Int
solution_one = maximum [(x*y) | x <- [100..999], y <- [100..999], x <= y, isPalindrome $ numToList (x * y)]
\end{code}


Second prototype. Do the exact same job inside out. ~4 sec.

\begin{code}
solution :: Int
solution = head $ [x | x <- [999*999,999*999-1..100*100],
                       isPalindrome $ numToList x,
                       d <- [(max 100 $ x `div` 999)..(min 999 $ x `div` (max 100 $ x `div` 999))],
                       x `rem` d == 0
                  ]
\end{code}