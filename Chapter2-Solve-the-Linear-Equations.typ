// 1. Document-wide Settings (The "Show" Rules)
#set page(
  paper: "us-letter", // Options include "a4", "us-letter", etc.
  margin: (x: 1in, top: 1in, bottom: 1in),
  numbering: "1",     // Standard "1, 2, 3" page numbering
  
)
#set heading(
  numbering: "1."

)

#set text(
  font: "Liberation Serif", // Commonly available serif font. Change to "Linux Libertine" or "Times New Roman" if preferred.
  size: 11pt,
  lang: "en",
)

// Configure paragraph spacing and justification
#set par(
  justify: true,
  leading: 0.65em,     // Line spacing
)
#show par: set block(spacing: 1.2em) // Spacing between paragraphs

// Configure Heading styles
#show heading: set text(weight: "bold", font: "Liberation Sans")
#show heading.where(level: 1): it => {
  v(1.5em, weak: true)
  it
  v(1em, weak: true)
}



// 2. Document Metadata / Title Block
#align(center)[
  #text(size: 24pt, weight: "bold")[Solve the Linear Euqations] \
  #v(0.5em)
  #text(size: 12pt, style: "italic")[Copyright. Hongsheng .X] \ 
  #text(size: 12pt, style: "oblique")[ Starxsky\@outlook.com] \ 
  #text(size: 10pt, fill: gray)[#datetime.today().display("[Month repr:long] [Day], [Year]")]
]

#v(2em)

// 3. Table of Contents
#outline(
  title: [Table of Contents], // Customizes the title text
  indent: 1.5em,              // Indents nested sub-headings
)

// Define a reusable custom blockquote layout
#let blockquote(body, author: none) = block(
  width: 100%,
  stroke: (left: 3pt + gray.lighten(30%)), // Left border accent
  inset: (left: 15pt, y: 5pt),              // Space inside the block
  fill: gray.lighten(95%),                  // Subtle background tint
  radius: (right: 4pt),
)[
  #set text(style: "italic")                // Make the text italicized
  #body
  
  #if author != none [
    #v(0.5em)
    #align(right, text(weight: "bold", style: "normal")[— #author])
  ]
]
#pagebreak()
- Author : Hongsheng Xing 
- Date :  #datetime.today().display("[Month repr:long] [Day], [Year]")

$ "Stay Hungry, Stay Foolish" \ "---Steve · Jobs " $

= Vectors and Linear Equations 
#blockquote([
  First we give two euqations : $ cases(x - 2 y = 1 , 3 x - 2y = 11) $
- we begin a row at a time. The first equation $ x - 2y = 1$ is a straight line in the $ x y$plane. the point $ (1, 0)$ is on the line because it solves that equation. the point $ (3, 1)$ also on the plane, that, we have the "*Row picture*" 
])

== Row picture 

#blockquote([
  *Definition* : The row picture shows two lines meeting at a single point. (this point is the solution to this Euqations.)

  #image("Figures/c6.png")
])

== Column picture 

#blockquote([
  *Definition* : The columns picture combines the colum vectors on the left side to produce the vector $ arrow(b)$ on the right side :

  $ x dot mat(delim: "[", 1; 3) + y dot mat(delim: "[", -2; 2) = mat(delim: "[", 1; 11) = arrow(b) $

  so, the problem is " *To find the combination of those vectors that equals the vector on the right.*"

  #image("Figures/c7.png")
])

== Coefficient Matrix : 

#blockquote([
  *Definition* : The Coefficient Matrix on the left side of the euqations is the 2 by 2 matrix $ A$ : $ A = mat(delim: "[", 1, -1; 3, 2) $
  This is a typical of linear algebra : a matrix multiply another matrix : $ A arrow(x) = arrow(b) \ => mat(delim: "[", 1 , -2 ; 3, 2) mat(delim: "[", x ; y) = mat(delim: "[", 1 ; 11) $
])


== The Equations in Three Unknowns  

#blockquote([
  If the three Unknowns are $ x y z $, we have the three euqations : $ cases( x + 2 y + 3 z = 6, 2 x + 5 y + 2 z = 4, 6 x - 3 y + z = 2) $
So, the Row picture and the Column picture will be changed :

- *Row* : The row picture shows three planes meeting at s single point. 
- *Column* : The columns picture combines three columns to produce $ arrow(b) = ( 6, 4, 2)$

with the Row picture, each equation produces a plane in 3-dimensional space. 
#image("Figures/c8.png")

with the column picture starts with the vector form of the euqations $ A arrow(x) = arrow(b)$ : 
$ "Combine Columns " space x dot mat(delim:"[", 1 ; 2; 6) + y dot mat(delim: "[", 2; 5; -3) + z mat(delim: "[", 3; 2; 1) = mat(delim: "[", 6;4;2) = arrow(b) $

#image("Figures/c9.png")
])


= The matrix form of the Equations

For the euqations : $ cases( x + 2 y + 3 z = 6, 2 x + 5 y + 2 z = 4, 6 x - 3 y + z = 2) $we get the Coefficient matrix : $ A = mat(delim: "[", 1, 2, 3; 2,5,2; 6, -3, 1) $
thus, we have the Matrix Equation : $ " A x = b : " mat(delim: "[", 1, 2, 3; 2 ,5, 2; 6, -3, 1)  mat(delim: "[", x; y; z) = mat(delim: "[", 6; 4 ;2) $

- *What' the mean to "Multiply $A$ times $ arrow(x)$" ? *
#blockquote([
- The Row view :
$ A arrow(x)$ comes from *dot products* :  
$ A arrow(x) = mat(delim: "[", ("row 1") dot arrow(x);("row 2") dot arrow(x); ("row 3") dot arrow(x) ) $

- The column View : 
$ A arrow(x)$ is a combination of column vectors : 
$  A arrow(x) = x dot ( "column 1") +y dot ( "column 2")  + z dot ( "column 3")    $
])

= The Matrix Notation 
For a matrix : $ mat(delim: "[", a_(11), a_(12); a_(21), a_(22)) $, the entry $ a_(57) = A(5, 7)$would be  in the row 5, column 7.
so, above matrix can be denoted as : $ A = mat(delim: "[", a_(11), a_(12); a_(21), a_(22)) = mat(delim: "[", A(1, 1), A(1, 2); A(2, 1), A(2, 2)) $ 


= The idea of Elimination
Before elimination, $x$ and $y$ appear in both equations. after elimination, the first unknown $x$ has disappeared from the second equation $ 8 y = 8$ 
#image("Figures/c10.png")

By this form, we can instantly get the $y = 1$ from $ 8y =8$. 
#blockquote([
- *Elimination* produce the *Upper triangular system* this is our goal. because in the bottom of this system we can instantly get the basic solution (in this instance is $ y= 1$). 
- The system solved this euqations from bottom upwards --- first we $ y=1$ and then $ x= 3$. this process called *'Back substitution'*
])
In the next, we will introduce the "Pivot" and "Multiplier" : 

Assume : $ cases(4 x - 8 y = 4, 3 x + 2 y = 11) $
we get below result: $  cases(4 x - 8 y = 4, 8 y = 8) $ by Operations : $ "Multiply equation 1 by " frac(3, 4) \ "Subtract from equation 2" $

#blockquote([
- *Pivot* : the first nonzero in the row that does the elimination. 
- *Multiplier* : (entry to elimination ) divided by (pivot) $ = frac(3, 4)$.so the Multiplier is $ "Multiplier " = frac("Entry to eliminate in row " i, "Pivot in row" j) $ thus, *Pivots can't be zero !!!*
])
the new euqations with the second pivot is $ 8$, we would use it to elimiate $y$ from the third equation if there were one. 

#image("Figures/c11.png")

== Breakdown of Elimination 

Nomrally, elimination produces the pivots that take us to the solution. But in some situation, the Elimination maybe failure. At this point, the method (elimination) might ask us to divide by zero. 
Look below examples : 

#blockquote([
> 1. Example 1 : 
  Fails with no solution to $ 0y = 8 $.
  Below figure shows the Row picture and the Column Picture for the Example 1: no solution 
  #image("Figures/c12.png")

  *Permanent with no solution * : $ cases(x - 2y = 1, 3 x - 6 y = 11) => "Elimination" => cases(x - 2y = 1, 0 y = 8) $ there is no solution to $ 0y = 8$. *Zero is never allowed as a pivot !!!*
  Here two views about why  the pivot can't be zero : 
  - *Row Picture* : two lines are failure to meet at one point. 
  - *Column Picture* : two vectors can't be combined to produce the third vector $ arrow(b)$ .

 > 2. Example 2 : 
  Fails with too many solutions to $0 y = 0$ 
  $ cases(x - 2y = 1, 3 x - 6 y = 3) => "Elimination" => cases(x - 2y = 1, 0 y = 0) $
  - *Row picture* :  All solutions to this equations are on the same line. 
  - *Column Picture* : the right side vector $ arrow(b) = (1, 3)$ is same as column 1. 

  #image("Figures/c13.png")

  - *Failure* : for n equations we do not get $n$ pivots. 
  - *Elimination leads to an equation* $ 0 != 0$ (no solution) or $ 0 =0$ (many solutions). 



> #text(fill: red, "3. Example 3") : 

  succeeds by exchanging the equations. 

  *Success comes with $n$ pivots. But we may have to exchange the $n$ equations. * : 

  - If the first pivot position contains zero, we can exchange it with other nonzero elements : 
  $ cases(0 x +  2 y = 4, 3 x - 2 y = 5) => " Exchange the equaltion 1 with equation 2 " \ => cases(3x - 2y = 5, 2 y = 4) => cases( y= 2, x = 3)  $

  the new euqations system is already triangular.  $ mat(delim: "[", 3, -1; 0,2)$

])
== Three Equations in Three Unknowns 

#blockquote([
  $ cases(2 x + 4 y - 2 z = 2 , 4 x + 9 y - 3 z = 8, -2 x - 3 y + 7 z = 10) $

  we would elimiate the Unknowns step by step : 

  - *Step 1* : To eliminate the unknown $x$ : we subtract 2 times equation 1 from equaltion 2. this leads to $ y + z = 4 $. the result is : $ cases(2 x + 4 y - 2z = 2, y + z = 4, -2 x - 3 y + 7 z = 10) $

  - *Step 2* : Subtract 1 times equation 1 from equation 3 to produce $ y + 5 z = 12 $ and $ cases(2 x + 4 y - 2 z = 2, y + z = 4, y + 5 z = 12) $

  - *Step 3* : Subtract the equaltion 2 from 3 : $ cases(2 x + 4 y - 2 z = 2, y + z = 4 , 4 z = 8) $

  So, we finally get the upper triangular $U$ : $ U arrow(x) = arrow(c)  $if we note it as matrix form : $ underbrace(mat(delim: "[", 2, 4 ,-2; 0, 1, 1; 0, 0, 4), "U") underbrace(mat(delim: "[", x ; y; z), "x") = underbrace(mat(delim: "[", 2 ; 4; 8), "c") $
.* Notice the pivots 2, 1, 4 along the diagonal of $U$*. 

by above euqations we can quickly get the solution to this euqations : $ cases(x = -1, y = 2 , z = 3) $so , the final form will be : $ underbrace(mat(delim: "[", 2, 4 ,-2; 0, 1, 1; 0, 0, 4), "U") underbrace(mat(delim: "[", -1 ; 2; 2), "x") = (-1) dot mat(delim: "[", 2; 4; -2) + 2 dot mat(delim: "[", 4 ; 9; -3) + 2 dot mat(delim: "[", -2; -3; 7) = underbrace(mat(delim: "[", 2 ; 4; 8), "c") $

])


= Elimination Using Matrices
#blockquote([
  suppose we have a euqations : $ cases(2 x_1 + 4 x_2 - 2 x_3 = 2, 4 x_1 + 9 x_2 - 3x_3 = 8, -2 x_1 - 3 x_2 + 7 x_3 = 10) $
  is same as $ mat(delim: "[", 2, 4, -2; 4, 9, -3 ; -2 , -3 , 7 ) mat(delim: "[", x_1; x_2; x_3)  = mat(delim: "[", 2 ; 8; 10)   => A arrow(x) = arrow(b )  $

  When the number of equations (three ) mathcs the number of the Unknowns (three). Our matrix is 3 by 3. 
  - *The number of row of the matrix must mathcs the number of the Unknowns.* 
])

#blockquote([
To solve this Equations we use the Elimination but is Matrix Form :
- *Step 1* : To eliminate the $e_((2, 1))$ in the original equations : 
$ underbrace(mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1), "E_(2, 1)") underbrace(mat(delim: "[", 2, 4, -2; 4, 9, -3; -2, -3, 7), "A") mat(delim:"[", x_1; x_2; x_3) = mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1) mat(delim: "[", 2 ; 8; 10) => \ mat(delim: "[", 2, 4, -2; 0, 1, 1; -2, -3 ,7) mat(delim: "[", x_1; x_2; x_3) = mat(delim: "[", 2 ; 4; 10) $


- *Step 2* : To eliminate the $e_((3, 1))$ : 
$ underbrace(mat(delim: "[", 1, 0, 0; 0, 1, 0; 1, 0, 1), "E_(3, 1)") mat(delim: "[", 2, 4, -2; 0, 1, 1; -2, -3, 7) mat(delim: "[", x_1;x_2; x_3) = mat(delim: "[", 1, 0, 0; 0, 1, 0; 1, 0, 1) mat(delim: "[", 2 ; 4; 10) \ mat(delim: "[", 2 , 4, -2; 0, 1, 1; 0, 1, 5) mat(delim: "[", x_1 ; x_2 ; x_3) = mat(delim: "[", 2 ; 4; 12) $

- *Step 3* : 
$ underbrace( mat(delim: "[", 1, 0, 0; 0, 1, 0; 0, -1, 1), "E_(3, 2)")mat(delim: "[", 2, 4, -2; 0, 1, 1; 0, 1, 5) mat(delim: "[", x_1; x_2; x_3) = mat(delim: "[", 1, 0, 0; 0, 1, 0; 0, -1, 1) mat(delim: "[", 2 ; 4; 12) \ underbrace(mat(delim: "[", 2, 4, -2; 0, 1, 1; 0, 0, 4), "U") mat(delim: "[", x_1; x_2;x_3) = mat(delim: "[", 2; 4 ;8) $

so we get the Elimination Matrix $ E =  E_((2, 1))  E_((3, 1))  E_((3, 2))  = mat(delim: "[", 1, 0, 0; -2, 1, 0; 1, -1, 1)  $
thus, we can get : $ A arrow(x) = b => \ E A arrow(x) = E arrow(b) => U arrow(x) = E arrow(b) $
])

= Augmented Matrix 

#blockquote([
  Suppose we have two matrix $A :mat(delim: "[" , 2 , 4, -2; 4, 9, -3; -2 , -3 ,7)  " and " b :mat(delim:"[", 2 ;  8; 10) $ we can puts them together to produce the "*Augmented Matrix*" : 

  $ " Augmented Matrix " [A space b] = mat(delim: "[", 2, 4 ,-2, 2 ; 4, 9, -3 , 8; -2, -3, 7, 10)  $


  We can execute the elimination at the same time with Augmented Matrix : $ mat(delim:"[", 1, 0, 0; -2, 1, 0; 0, 0, 1) mat(delim: "[", 2, 4 ,-2, 2 ; 4, 9, -3 , 8; -2, -3, 7, 10) = mat(delim: "[", 2, 4 ,-2, 2 ; 0, 1, 1 , 4; -2, -3, 7, 10) $
])


= The Matrix $P_(i j)$ for a Row Exchange 

#blockquote([
  The $P_(i j)$ Matrix is also known "Permutation Matrix". A row exchange is needed when zero is in the pivot position. 

  Fisrt we introduce the $P_(23)$, it exchanges the row 2 and row 3 : $ P_(23) = mat(delim: "[", 1, 0, 0; 0, 0, 1; 0, 1, 0) $

  Such as  : $ P_(23) mat(delim: "[", 1 ; 3; 5) = mat(delim: "[", 1, 0, 0; 0, 0, 1; 0, 1, 0) mat(delim: "[", 1 ; 3; 5) = mat(delim: "[", 1 ; 5; 3) " and " mat(delim: "[", 1, 0, 0; 0, 0, 1; 0, 1, 0) mat(delim: "[", 2, 4, 1 ;0, 0 ,3; 0, 6, 5) = mat(delim: "[", 2, 4, 1 ; 0 , 6, 5; 0, 0, 3) $

- *Row Exchange Matrix* : $P_(i j)$ is the identity matrix with row i and j reversed. 

])


= Indetity Matrix 
#blockquote([
  $ I = mat(delim:"[" , 1, 0, 0; 0, 1,0; 0, 0, 1) $
])

= Rules for Matrix Operations
== Matrix Multiplication 


Fundamental Law of Matrix Multiplication : 

#blockquote([
  1. $A_(m times n) B_(n times p) = C_(m times n)$ 
  2. $ (A B)C = A (B C)$
  3. $ " The entry in row i and column j of AB :" \ ("row i of "A ) times ("column j of "B)  $
  #image("Figures/c14.png")

])


#blockquote([
  Suppose we have two Matrices : $ E : mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1)  " and" A : mat(delim: "[", 2, 4, -2; 4, 9, -3; -2, -3, 7) $
  So the Multiplication E  by A is : $ E A =mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1)mat(delim: "[", 2, 4, -2; 4, 9, -3; -2, -3, 7) \ =   mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1) mat(delim: "[", 2,;4 ; -2) +  mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1) mat(delim: "[", 4;9 ; -3) + mat(delim: "[", 1, 0, 0; -2, 1, 0; 0, 0, 1) mat(delim: "[", -2,;-3 ; 7)   $

  so , $ "Matrix Multiplication " A B = A [arrow(b_1) arrow(b_2) arrow(b_3)] = [A arrow(b_1) A arrow(b_2) A arrow(b_3)]  $
])
=== The Columns view : A linear combination to the matrix A 
Matrix $A$ times every column of $ B$ : 
$ A [b_1, dots , b_p] = [A b_1, dots , A b_p] $

Each column of $A B$ is *a combination of the columns of $A$. *

=== The Rows view : A linear combination to the Matrix B

Every row of $ A$ times matrix $ B$ : $ ["row i of A"] B = ["row i of AB"] $
Every row of $A B$ is *a combination of the rows of $B$. *

=== Columns Multiply Rows 

$ A B = mat(delim: "[", a, b; c, d) mat(delim: "[", E, F; G, H) = mat(delim: "[", a E + b G, a F + b H; c E + d G, c F + d H) \ => \ mat(delim: "[", a ; c) mat(delim: "[", E , F)  + mat(delim: "[", b ; d) mat(delim: "[", G ,H) $

== Basic Rules : 
#blockquote([
  1. $ A + B = B + A$ 
  2. $ c ( A + B ) = c A + c B$
  3. $ A + (B+ C) = (A + B) + C $
  4. $ A B != B A $
  5. $ I A = A I $ with the $I$ is "Identity Matrix" 
])

== Block Matrices and Block Multiplication 

#blockquote([
  Any Matrices are can cut into blocks. Here is a 4 by 6 matrix broken into blocks of size of 2 by 2  : $ 
A = mat(
  1, 0, 1, 0, 1, 0;
  0, 1, 0, 1, 0, 1;
  1, 0, 1, 0, 1, 0;
  0, 1, 0, 1, 0, 1;
 
)
= mat(
  I, I, I;
  I, I, I;
).
$

- If $B$ also is 4 by 6 and the block sizes match, we can add $ A + B$ a block at a time.

- If blocks of $A$ can multiply blocks of $ B$, then block multiplication of $A B$ is allowed. Cuts between columns of $A$ match cuts between rows of $ B$ 
$ mat(delim: "[", A_(11), A_(12); A_(21), A_(22)) mat(delim: "[", B_(11); B_(21)) = mat(delim: "[", A_(11) ; A_(21)) mat(delim: "[", B_(11)) + mat(delim: "[", A_(12); A_(22)) mat(delim: "[", B_(21)) \ = mat(delim: "[", A_(11) B_(11) + A_(12)B_(21); A_(21) B_(11) + A_(22) B_(21)) $

- Important Special Case : 
#image("Figures/c15.png")
])

=== Block Elimination 
#blockquote([
  Suppose a matrix has four blocks : $ A = mat(delim: "[", A, B ; C, D) $we will construct a block matrix to elimniate the blokc $ C$ within the matrix $A$ : 
  $ "Block Multiplication : " mat(delim: "[", I, 0; - C A^(-1), I) mat(delim: "[", A, B; C, D) = mat(delim: "[", I ; -C A^(-1)) mat(delim: "[", A, B)  + mat(delim: "[", 0; I) mat(delim: "[", C , D) \ = mat(delim: "[", A, B; -C A^(-1) A, -C A^(-1) B) + mat(delim:"[", 0, 0; C , D) \ = mat(delim: "[", A, B; 0, D - C A^(-1)B ) $
  by this process we get the "*Schur Complement*" :  $ S = D - C A^(-1) B $
]) 
