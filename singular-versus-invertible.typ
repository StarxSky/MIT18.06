// Document Configuration
#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "Liberation Serif", lang: "zh", region: "cn")
#set heading(numbering: "1.1")
#show heading: set text(weight: "bold")

// Custom Blockquote Styling
#let blockquote(content) = rect(
  width: 100%,
  stroke: (left: 4pt + rgb("1c7ed6")),
  fill: rgb("#babdc0"),
  inset: (x: 15pt, y: 10pt),
  radius: (right: 4pt),
  content
)

= Inverse Matrices 


#blockquote([
    1. If square matrix $A$ has an inverse, then, both $A^(-1) A = I $and $A A^(-1) =I$. 
    2. The algortithm to test invertibility is elimination : $A$ must have $n$ piovts (nonzero). 
    3. The algebra test for invertibility is the determinant of $A$ : the determinant of $A$ must be not zero $det(A) != 0$.
    4. The equation that for invertibility is : $A x = 0$ , the $x$ must only be the 0. 
    5. If $A$ and $ B$ (same size) are invertible then, so is $A B $ also invertible, $(A B)^(-1) = B^(-1) A^(-1)$
    6. $A^(-1) A = I$ is $n$ equations for $n$ columns of $A^(-1)$, Gauss-Jordan eliminates $[A I] $ to $[I A^(-1)]$. 
 
])

== Inverse Matrix 
#blockquote([
    Definition : 
    the matrix $A$ is invertible if there exists a matrix $A^(-1)$ that "inverts" $A$ :  $ A^(-1) A = I $ and $ A A^(-1) = I $
])

Not all Matrices have inverse.

- Note 1 : The inverse exists if and only if elimination produces $ n$ piovts (row exchanges are allowed.) Acutally, the elimination solves $ A x = b$ without explicitly use the Inverse $A^(-1)$. $ A^(-1) A x = A^(-1) b => x = A^(-1) b $
- Note 2 : The matrix $ A$ only have one inverse :  if $A C =I $ and $B A = I$ then , $ C = B  = A^(-1) $
- Note 3 : If $A$ is invertible, the one and the only solution to $A x = b $ is $ x = A^(-1) b $.
- Note 4 : Suppose there is a nonzero vector $x $ ($x != 0$) such that : $A x = 0$. then, *the $A$ is not invertible (haven't inverse).*  as no matrix can bring 0 back to x (nonzero). So, *If $A x = 0$ then, the only solution must is $x= 0$*.
- Note 5 : $A$ is a 2 by 2 matrix, and is invertible and only  if the determinant $a d - b c$ of the matrix $ A$ is not zero, $ det(A) = a d - b c != 0$  
$ mat(delim: "[" , a, b; c, d) ^(-1) = frac(1, a d - b c) mat(delim:"[", d, -b ; -c , a) $
- Note 6 : A digonal matrix has an inverse provied no digonal entries are zero : 
If $ A = mat(delim: "[",
  d_1,          ,     ;
     , dots.down,     ;
     ,          , d_n ;
) $ then, $ A = mat(delim: "[",
  frac(1, d_1),          ,     ;
     , dots.down,     ;
     ,          , frac(1, d_n) ;
) $

= The inverse of a Product $A B$

For the inverse of a Product $A B$ is come from *reverse order* :  
#blockquote([If $A$ and $B$ are invertible then, so is $A B$, the inverse of a Product $A B$ is 
$ (A B)^(-1) = B^(-1) A^(-1) $ 
])

> "If you put on socks and then shoes, the first to be taken off
are the shoes. "

#blockquote([
    Inverse of $A B$ : 
    $ (A B)(B^(-1) A^(-1)) = A I A^(-1) =A A^(-1) = I $
    Same as the three case : 
    $ (A B C)^(-1) = C^(-1) B^(-1) A^(-1)  $ that because of : $ (C^(-1 ) B^(-1) A^(-1) )A B C = I $
])

= Calculating $A^(-1)$ bt Gauss-Jordan Elimination 

== 1. The Core Idea

Gilbert Strang emphasizes that matrix multiplication works by columns. If $A$ multiplied by its inverse $A^(-1)$ yields the identity matrix $I$, we are essentially solving $n$ systems of equations simultaneously:

$ A A^(-1) = A [x_1 thin x_2 thin dots thin x_n] = [e_1 thin e_2 thin dots thin e_n] = I $

Where:
- $x_j$ is the $j$-th column of $A^(-1)$.
- $e_j$ is the $j$-th column of the identity matrix (a vector with $1$ in the $j$-th row and $0$ elsewhere).

Instead of solving $A x_j = e_j$ separately for each column, the **Gauss-Jordan method** solves them all at once by constructing a massive augmented matrix.

---

== 2. The Augmented Matrix Setup

We multiply the size of our workspace by pinning $A$ and $I$ side-by-side:

$ [A thin | thin I] = mat(
  a_(11), a_(12), dots, a_(1n), |, 1, 0, dots, 0;
  a_(21), a_(22), dots, a_(2n), |, 0, 1, dots, 0;
  dots, dots, dots, dots, |, dots, dots, dots, dots;
  a_(n 1), a_(n 2), dots, a_(n n), |, 0, 0, dots, 1;
) $

Using row operations (elimination), we clear out the entries below *and above* the pivots. Our goal is to reduce the left side ($A$) to the identity matrix $I$. 

As Strang famously summarizes: **Multiply by $A^(-1)$ on the left to see what happens.**
$ A^(-1) [A thin | thin I] = [I thin | thin A^(-1)] $

If elimination succeeds in producing $I$ on the left, the inverse automatically appears on the right.

---

== 3. Step-by-Step Gauss-Jordan Algorithm

1. *Forward Elimination:* Produce zeros below the pivots to reach an upper triangular matrix $U$ on the left half.
2. *Backward Elimination:* Work from the bottom row upward, using the pivots to clear out entries *above* them to reach a diagonal matrix $D$.
3. *Normalize:* Divide each row by its respective pivot to turn the diagonal elements into $1$s, completing the transition from $D$ to $I$.

> *Note on Invertibility:* If elimination encounters a zero in a pivot position that cannot be fixed by swapping rows, the matrix is singular (it has no inverse).

---

== 4. Worked Example: A $2 times 2$ Matrix

Let's find the inverse of $A = mat(2, 3; 1, 2)$.

=== Step 1: Set up the augmented matrix $[A thin | thin I]$
$ mat(2, 3, |, 1, 0; 1, 2, |, 0, 1) $

=== Step 2: Clear below the first pivot
Subtract $1/2$ of Row 1 from Row 2 ($R_2 <- R_2 - 1/2 R_1$):
$ mat(2, 3, |, 1, 0; 0, 1/2, |, -1/2, 1) $

=== Step 3: Clear above the second pivot (Upward Elimination)
Subtract 6 times Row 2 from Row 1 ($R_1 <- R_1 - 6 R_2$):
$ mat(2, 0, |, 4, -6; 0, 1/2, |, -1/2, 1) $

=== Step 4: Divide by the pivots to get $I$ on the left
Divide Row 1 by 2, and multiply Row 2 by 2:
$ mat(1, 0, |, 2, -3; 0, 1, |, -1, 2) $

Therefore, the inverse matrix is:
$ A^(-1) = mat(2, -3; -1, 2) $

= Singular versus Invertible 
#blockquote([- $A^(-1) $ exists exactly when $A$ has a full set of $ n$ piovts.
(Row exchanges are allowed.) Prove by Gauss-Jordan Elimination : 
1. With $n$ piovts, elimination solves all equations $A x_i = e_i$, the columns $x_i$ go into $A^(-1)$. Then $ A A^(-1) = I$ and $ A^(-1)$ is the *right reverse*. 

2. Elimination is really a sequence of multiplications by $E$ and P and $D^(-1)$ : 
$ C A = (D^(-1) ... E ... P ... E ) A = I $
 
$ D^(-1)$ divides by the piovts. The Matrices $E$ produce zeros below and above the piovts . and the matrix $P$ will exchange the rows (if needed). 
the product matrix in equation $ C A$ is evidently (显然地) a *left-inverse of $A$*
])

#blockquote([- Reasoning in reverse will show that $A $ must have $n$ piovts if $A C = I$ : 
1. If $A$ don't have $n$ piovts, elimination will lead to a zero row.
2. Those elimination setps are taken by an invertible $M$. so a row of $ M A$ is zero.
3. If $A C =I$ had been possible, then, $M A C = M$ the zero row of $M A$ times the matrix $C$ gives a zeros row of $M$ ifself. 
4. An invertible matrix $M$ can't have a zeros row, so the matrix $A$ must have $n$ piovts if $A C=I$ .
so the conculusion is : If $A C = I $ then $ C A = I$ and the $C = A^(-1) $.
])

- Note 1 : If $ A$ is a triangular matrix, if and only if no diagonal entries are zero. 
 


= Recognizing an Invertible Matrix

#blockquote([
  The matrix $A$ is invertible when *Diagonally dominant matrices* : 
  Each $a_(i i)$ on the diagonal is larger than the total sum along the rest of row $i$. On every row , : $ |a_(i i) | > sum _(j != i) |a_(i j) |  $
  Example : $A$ is Diagonally dominant ($3 > 2$) , $B$ is not (but still invertible), $C $ is singular . 
  $ A = mat(delim: "[", 3, 1, 1; 1, 3, 1; 1,1,3) \ B = mat(delim: "[", 2, 1,1; 1,2,1; 1,1,3) \ C = mat(delim: "[" , 1,1,1;1,1,1;1,1,3) $


])
- *Reasoning* : 
Take any nonzero vector $x$ , suppose its largest componet is $|x_i|$ . Then $A x = 0$ is impossible, because the row $i$ of $A x = 0$ would need : $ a_(i 1) x_1 + ... + a_(i i)x_(i) + ... + a_(i n) x_(n) = 0 $ Those can't add to zero when $A$ is Diagonally dominant . the size of $ a_(i i) x_i$ is greater than all the other terms combind : $ |x_(j)| < | x_(i) |  \ sum_(j != i) |a_(i j) x_j | <=  sum_(j != i)|a_(i j)| |x_i| < |a_(i i) | |x_i| $
*This shows that the $A x = 0$ is only possible when $x = 0$, so $A$ is invertible*