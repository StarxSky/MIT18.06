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
  #text(size: 24pt, weight: "bold")[A =LU Factorization] \
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

= $ A = L U$ Factorization 

#blockquote([
We first point out that the Elimination is eqaully to the $A= L U$ Factorization. Below is the summary to this Chapter's contents : 

- Each elimination step is inverted by $L_(i j)$. Off the main diagonal change $ - e_(i j)$ to $ e_(i j)$. 
- The whole forward elimination process (with no row exchanges) is inverted by $L$. 
- The Original matrix$ A$ is recovered from $ U$ by $A = L U = ("Lower triangular")("Upper triangular") $.

])

== The forward Elimination $E A = U$ .
#blockquote([
  Suppose we have a matrix : $ A = mat(delim: "[", 2, 1, 0; 1, 2,1; 0, 1, 2) $ we need to execute the elimination step by step : 

  - *Step 1* : We first eliminate the second pivot $ a_((2, 1)) = 1$ : 
  we need a elimination matrix $ E_((2,1))  = mat(delim:"[", 1, 0,0; -frac(1, 2), 1, 0; 0, 0, 1) $then, multiply it by matrix $ A$ to produce : $ E_((2, 1)) A = mat(delim: "[", 1, 0, 0; - frac(1, 2), 1, 0; 0, 0, 1) mat(delim: "[", 2, 1, 0; 1, 2, 1; 0, 1, 2) = mat(delim:"[", 2, 1, 0; 0, frac(3, 2), 1; 0, 1, 2) = U_(1) $ 

  - *Step 2* : We second need to eliminate the third pivot $ a_((3, 2)) = 1$ : $ E_((3, 2)) = mat(delim: "[", 1, 0, 0; 0, 1, 0; 0, - frac(2, 3), 1) $ then similarly : $ E_((3, 2)) U_1 = mat(delim: "[", 1, 0, 0; 0, 1, 0; 0, - frac(2, 3), 1) mat(delim:"[", 2, 1, 0; 0, frac(3,2), 1; 0, 1, 2) =  mat(delim: "[", 2,1, 0; 0, frac(3, 2), 1; 0,0, frac(4, 3)) =  U $  

  - *Step 3* : We can multiply the $ E_((2, 1))$ by $ E_((3, 2))$ to produce the Elimination Matrix $ E = E_((3, 2)) E_((2, 1)) =  mat(delim: "[", 1, 0, 0; -frac(1, 2), 1, 0; 0, - frac(2, 3) , 1) $. thus, we can say : $ E A = mat(delim:"[", 1, 0, 0; - frac(1, 2), 1, 0; 0, -frac(2, 3), 1) mat(delim:"[", 2, 1, 0; 1, 2, 1; 0, 1, 2) = mat(delim:"[", 2, 1, 0; 0, frac(3, 2), 1; 0, 0, frac(4, 3)) = U $


> where the row  3 of the matrix $U$  come from ? 

$ "row 3 of U" =  ("row 3 of A") - e_((2, 1)) ("row 1 of U") - e_((3, 2)) ("row 2 of U")  $
with the $ e_((2, 1)) = frac(1, 2) ; e_((3,2)) = frac(2, 3) $.


])

== The backward recover : $ A = L U$
#blockquote([
  Now, we wanna to recover the matrix $ A$ from the upper matrix  $ U$ : 
  the fisrt thing is we need to get the inverse of the Elimination matrix $E$ : 
  - $ E^(-1) E = I = mat(delim: "[", 1, 0, 0; 0, 1, 0; 0, 0, 1)  = E^(-1) mat(delim: "[", 1, 0, 0; -frac(1, 2), 1, 0; 0, -frac(2, 3), 1) => E^(-1) = mat(delim: "[", 1, 0, 0; frac(1, 2), 1, 0; 0, frac(2, 3), 1) $

so, if we multiply the matrix $E A$ and $U$ by matrix $ E^(-1)$ at the same time : $ E^(-1) E A = E^(-1) U \ I A = E^(-1) U  \ A = E^(-1) U  $so the finally we produce the equation : $ A = E^(-1) U $
simutaneously, we find out the matrix $E^(-1)$ is a lower triangular matrix, so we denote this as $ L$. 
thus, $ A = E^(-1) U  = L U $
$ L = E^(-1) $

this process is called "$ A = L U$ Factorization". 
"Whenever $E$ does, $L$ will undo them."

])

== The $ A = L D U$ Factorization 

#blockquote([
  we have seen the $A = L U$ Factorization in above section, but the $A = L U$ is not symmetric, we will introduce the symmetric form : $ A = L D U $
  - with $ D$ is a diagonal matrix, the pivots are on its diagonal.
  - with $ L$ still is the lower triangular matrix. 
  - the $ U$ is upper matrix, which the 1's on the diagonal. 

  For example : $ A = mat(delim: "[", 2, 1, 0; 1,2, 1; 0, 1, 2) ; U = mat(delim: "[", 2, 1, 0; 0, frac(3, 2), 1; 0, 0, frac(4, 3)) ; L = mat(delim: "[", 1, 0, 0; frac(1, 2), 1, 0; 0 , frac(2, 3), 1) $
$ A = L U  = L D U \ => \ mat(delim: "[", 1, 0, 0; frac(1, 2), 1, 0; 0, frac(2, 3), 1) mat(delim:"[", 2, 0, 0; 0, frac(3, 2) , 0; 0, 0,frac(4, 3)) mat(delim: "[", frac(2, 2), frac(1, 2), frac(0, 2); 0, frac(frac(3, 2), frac(3, 2)), frac(1, frac(3, 2)); 0, 0, frac(frac(4, 3), frac(4, 3)))  \ = mat(delim: "[", 1, 0, 0; frac(1, 2), 1, 0; 0, frac(2, 3), 1) mat(delim:"[", 2, 0, 0; 0, frac(3, 2) , 0; 0, 0,frac(4, 3)) mat(delim: "[", 1, frac(1, 2), 0; 0, 1, frac(2, 3); 0, 0, 1) = L D U $
Genrally, we can split $U$ into : 
$ 
  
  mat(
    d_1, 0, 0, dots.h;
    0, d_2, 0, dots.h;
    0, 0, dots.v, dots.v;
    dots.h, dots.h, dots.h, d_n
  )
  mat(
    1, u_12 / d_1, u_13 / d_1, dots.h;
    0, 1, u_23 / d_2, dots.h;
    0, 0, dots.v, dots.v;
    0, 0, 0, 1
  ) = D U
$
thus, *As we need to divide the pivot by values which on each row, so pivots cannot be zero!!!*
])
== Review for above subsection 
#blockquote([
  $ E A  = (E_((3, 2))E_((2, 1))) A = U \ A = (E_((2,1))^(-1) E^(-1)_((3, 2))) U  = L U  = L D U $
])

