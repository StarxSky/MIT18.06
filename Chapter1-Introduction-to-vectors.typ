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
  #text(size: 24pt, weight: "bold")[Introduction to Vectors] \
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

= Vectors and Linear Combinations 
== Summary 

#blockquote([
  - $ 3 arrow(v) + 5arrow(w)$ is a typical *Linear Combination* $ c arrow(v) + d arrow(w)$ of the Vectors $arrow(v) , arrow(w)$. 
  - For Vectors : $arrow(v) = mat(delim: "[", 1; 1) , arrow(w) = mat(delim: "[", 2; 3) $that combination is $ 3 mat(delim: "[", 1; 1) + 5 mat(delim: "[", 2; 3) = mat(delim: "[", 13; 18) $
  - The combination $ c mat(delim: "[", 1; 1) + d mat(delim: "[", 2; 3) $ fill the whole plane,They can produce every $ mat(delim: "[", x; y) $
  - The combination $ c mat(delim: "[", 1;1;1) + d mat(delim:"[", 2; 3; 4) $ fill the whole plane in $x y z$ space 

  - For the Equation : $ cases(c + 2 d = 1, c + 3d = 0, c + 4d = 0) $has no solution, because its right side vector $ mat(delim: "[", 1;0;0) $ is not on that plane. 
])
#pagebreak()
== Column Vectors. 
#blockquote([
  *Definition* : If the vector like this :  $ arrow(v) = mat(delim: "[", v_1; v_2) $ we call this a  *Column Vector* 

])
== Linear Combination 
We combine addition with scalar multiplication to produce a *"Linear Combination"* of $ arrow(v)$ and $arrow(w)$ : $ c arrow(v) + d arrow(w) \ c, v in bb(R) $

here are some special Linear Combinations : 

#image("Figures/c1.png", width: 80%)
#image("Figures/c2.png", width: 80%)


With the *zero vector* : Any Vector Space always contains the zero vector. 

=== Addition 
#blockquote([
  suppose we have two vectors like this :  $ arrow(a) = mat(delim: "[", a_1;a_2) ; arrow(b) = mat(delim: "[", b_1; b_2) $then, The addition for them is $ arrow(a) + arrow(b) = mat(delim: "[", a_1 + b_1 ; a_2 + b_2) $

])

=== Subtraction 
#blockquote([
  For the minus vector : $ - arrow(v) = mat(delim: "[", -v_1; - v_2) $ if we plus another vector : $ arrow(v) - arrow(v) = 0 = mat(delim: "[", 0 ;0) $thus, we get the *Zero Vector*. (In linear Algebra, the zero is not a number, it's a vector.)


])
=== The zero vector 
#blockquote([
  A zero vector exists for a vector space of any dimension. 
  If we have two vector like this :  $ arrow(v) = mat(delim:"[", v_1; v_2) ; - arrow(v) = -mat(delim:"[", v_1; v_2) $ then, we adds them to produce the zero vector : $ arrow(0) = arrow(v) - arrow(v) = mat(delim:"[", 0; 0) $

])

== Lengths and Dot Products 
=== Dot product 
#blockquote([
  For two vectors : $ arrow(v) = mat(delim: "[", v_1;v_2)  ; arrow(n) = mat(delim: "[", n_1;n_2) $. the *Product *(or *inner product*) to them is $ arrow(v) dot arrow(n) = v_1 dot n_1 + v_2 dot n_2 $
  - The product $ arrow(v_1) dot arrow(v_2) = arrow(v_2) dot arrow(v_1)$, the order of $arrow(v_1)$ and $ arrow(v_2)$ is not difference. 
])
=== Prependicular Vectors 
#blockquote([
  Assume we have two vectors : $ arrow(v_1) = mat(delim:"[", 4; 2) ; arrow(v_2) = mat(delim:"[", -1; 2) $then, we can multiply the vector $arrow(v_1)$ by another vector $arrow(v_2)$ to produce : $ arrow(v_1) dot arrow(v_2) = -4 + 4 = 0 $,*Dot Product is zero, two vectors are prependicular.* The angle between is $90 degree$. 

  - Reason : 
  $ cos theta = frac(arrow(v_1) dot arrow(v_2), norm(arrow(v_1) ) dot norm(arrow(v_2)))  = frac(0, sqrt(20) dot sqrt(5)) = 0 \ because 0 ≤ theta ≤ pi \ therefore theta = frac(pi, 2) $therefore the angle between two vectors is $90 degree$. 
  - Anothe View : 
  $ arrow(v_1) - arrow(v_2) =  mat(delim: "[", 5; 0) $
  $ norm(arrow(v_1))^2 + norm(arrow(v_2) )^2 = 16 + 4 + 1 + 4  = 25 \ = norm(arrow(v_1) - arrow(v_2)) ^2 $. this is the *Pythagoras Law* ($a^2 + b^2 = c^2$). therefore the angle between two vectors is $90 degree$.  

  - Notes : #text(fill: red, "The zero vector") $ arrow(v) = 0$#text(fill:red, "is prependicular to every vector ")$arrow(w)$ , because $ 0 dot arrow(w) = 0 $ is always right. 


])

=== The Lengths of the Vector  

#blockquote([
  For the vector : $ arrow(v) = mat(delim: "[", v_1; v_2) $. The length of it is : $ norm(arrow(v)) = sqrt((arrow(v) )^2) = sqrt( arrow(v) dot arrow(v)) = sqrt(v_1^2 + v_2^2) $

  - The angle between $ arrow(v)$ and itself is not $90 degree$, but, $0 degree$.The reason is obviously : $ because arrow(v) dot arrow(v) = norm(arrow(v))^2 \ therefore cos theta = frac( arrow(v) dot arrow(v) , norm(arrow(v)) dot norm(arrow(v))) = frac(norm(arrow(v))^2, norm(arrow(v))^2)  = 1 => theta = 0 degree $

])

=== The Unit Vector. 
#blockquote([
  *Definition* : A Unit vector $ arrow(u)$ is a vector whose length equals one : $ norm(arrow(u)) = 1 $

  - How to get the Unit Vector ? 
  Suppose we have a vector like this : $ arrow(n) = mat(delim: "[", n_1 ; n_2) $,we can produce the Unit Vector $ arrow(u)$ by : $ arrow(u) = frac(arrow(n), norm(arrow(n))) = frac(arrow(n), sqrt(n_1^2 + n_2^2)) = mat(delim: "[", frac(n_1, sqrt(n_1^2 + n_2^2)); frac(n_2, sqrt(n_1^2 + n_2^2))) $ check out : $ norm(arrow(u)) = sqrt(frac(n_1^2, n_1^2 + n_2^2) + frac(n_2^2, n_1^2 + n_2^2)) = 1 $
  #text(fill:red, "The direction of the unit vector") $ arrow(u)$ #text(fill:red, "is same as the original vector") $ arrow(n)$. 

  - In the $x y$ plane, the Unit Vector makes an angle "theta"
 with the x axis is (cos $theta$, sin $theta$) : $ arrow(u) = mat(delim:"[", cos theta ; sin theta) $. When the $theta = 0degree $ the Unit vector is $ arrow(i) = mat(delim: "[", 1; 0) $ that is the $x$ axis. 
 
 when the $theta = 90degree$ this is the $y$ axis. $ arrow(j) = mat(delim: "[", 0; 1) $

 Due to the $ sin ^2 theta + cos^2 theta = 1 $, therefore These vectors reach out to the unit circle (with radius is  1): 
#image("Figures/c3.png")
 
 ])

=== The angle between tow vectors 

#blockquote([
If the vectors $ arrow(v) " and" arrow(w) $ are nonezero vectors, then, the angle between them is : $ theta = arccos (frac( arrow(v) dot arrow(w), norm(arrow(v)) dot norm(arrow(w)))) $

- For unit vectors $ arrow(u) "and " arrow(U)$, the cosine of them is : $ cos theta = frac(arrow(u) dot arrow(U), 1) = arrow(u) dot arrow(U) $therefore, $ |arrow(u) dot arrow(U) | < 1 $

- Due to the $ -1 <= cos theta <= 1 => |cos theta | <= 1 \ => frac(|arrow(v) dot arrow(w) | , norm(arrow(v)) dot norm(arrow(w))) <= 1 $
so, we have $ " Schwarz Inequality : " | arrow(v) dot arrow(w) | <= norm(arrow(v)) dot norm(arrow(w)) \ " Triangle Inequality : " norm(arrow(v) + arrow(w)) <= norm(arrow(v)) + norm(arrow(w)) $
])

== Geometric Mean for Vectors 

#blockquote([
  For two vectors : $ arrow(v) = mat(delim:"[", a ; b) ; arrow(w) = mat(delim:"[", b ; a) $ the length of this vector is $ norm(arrow(v)) = sqrt(a^2 + b^2)  \ norm(arrow(w)) = sqrt(a^2 + b^2) $. The Schwarz Inequality tells our : $ |arrow(v) dot arrow(w)| = |a b + b a | \ = 2a b <=  norm(arrow(v)) dot norm(arrow(w)) = a^2 + b^2 \ => a^2 + b^2 >= 2 a b $. If $ x = a^2 \ y = b^2  $ then, we get the "Arithmetic Mean " : $ frac(x + y, 2) >= sqrt(x y) $
  so , $ frac(a^2 + b^2 , 2) >= a b <=> frac(x + y, 2) >= sqrt(x y) $
  "#text(fill:red, "the Arithmetic mean is large than the Geometric mean") "
])
= Matrices
== The Difference Matrix 
#blockquote([
  Suppose we have three vectors : $ arrow(u) = mat(delim:"[", 1 ; -1 ; 0) ; arrow(v) = mat(delim: "[", 0; 1; -1) ; arrow(w) = mat(delim:"[", 0; 0; 1) $
  we combine these by the "Matrices" : $ A = mat(delim:"[", 1 , 0, 0; -1 , 1, 0; 0, -1, 1) $

  - Matrix times the vector : *combination of columns of the $ A$*$ A arrow(x) = mat(delim:"[", 1, 0, 0; -1, 1, 0; 0, -1, 1) mat(delim: "[", x_1 ; x_2; x_3)  = mat(delim:"[", x_1; x_2 - x_1; x_3 - x_2)  = arrow(b) $
  this matrix $ A$ is acts on the vector $ arrow(x)$, the output is the combination of the columns of $ A$. 

  Simultanesouly, the matrix $ A$ is called *"Difference Matrix"*. (because the $ arrow(b)$ contains the differences of the input vector $arrow(x)$)
])
- The Multiplication for matrix : 

#blockquote([
  *Multiplication a row at a time* : $ A arrow(x) = mat(delim: "[", 1, 0, 0; -1 , 1, 0; 0, -1, 1) mat(delim:"[", x_1; x_2; x_3) = mat(delim: "[", (1 , 0, 0) dot (x_1, x_2, x_3) ; (-1, 1, 0) dot (x_1, x_2, x_3) ; (0, -1, 1) dot (x_1, x_2, x_3) ) $
  So, $ A arrow(x)$ is also dot products with rows. 

])

== Linear Equations 
#blockquote([
  - The Old Question is : Compute the linear combination $ x_1 arrow(u) + x_2 arrow(v) + x_3 arrow(w) = arrow(b).$
  - The New Question is : Which combination of the vectors  $ arrow(v), arrow(u), arrow(w) $ produces the particular vector $ arrow(b)$ ? This is a *Inverse Problem*- to find the input $ arrow(x)$ to produce the particular vector $ arrow(b)$.

  Fortunately, due to the Equations : $ cases(x_1 = b_1, -x_1 + x_2 = b_2, -x_2 + x_3 = b_3) $ is a "triangle" Equations. So, we can solve this Equations from top to bottom. get the : $ cases(x_1 = b_1 , x_2 = b_1 + b _2, x_3 = b_1 + b_2 + b _3) $. 

  Look at a specific choies : $ A arrow(x) = 0 = arrow(b)  => arrow(b) = 0 $
  For a Difference matrix $ A$, if $ A arrow(x) = 0$, the $arrow(x)$ must is $ 0$. (When this time, we call the matrix$ A$ is *invertible*. we can recover $arrow(x)$ from $arrow(b)$ : $ arrow(x) = A^(-1) dot arrow(b) $)
])
== The identity matrix  

#blockquote([
The "Identity Matrix" : $ I = mat(delim:"[", 1, 0,0; 0, 1,0; 0, 0, 1) $
Elements on the diagonal always is one and other place always is zero.

Any Matrix multiply by identity matrix still is itself : $ A I = A ; I A = A $
The effect of $I$ on another matrix is ​similar to that of the number 1.
])
== The Inverse Matrix 

#blockquote([
   $ A arrow(x) = mat(delim:"[", 1, 0,0; -1, 1, 0; 0, -1, 1) mat(delim: "[", 1; 2; 3) = mat(delim:"[", 1;1;1) = arrow(b) $
   For this Equation we have the Inverse matrix that will undo the effects produced by $ A$ and we call "inverse Matrix"  $A^(-1) $ : 

   $ A^(-1 ) A arrow(x) = A^(-1) arrow(b) = arrow(x) $ 
   therefore , $ mat(delim: "[", 1, 0, 0;1, 1, 0; 1, 1, 1) mat(delim: "[", 1, 0, 0; -1, 1, 0; 0, -1, 1) mat(delim: "[", 1;2;3) = mat(delim: "[", 1,0,0;0,1,0;0, 0,1) mat(delim: "[", 1;2;3) \ => A^(-1) A arrow(x) = I arrow(x) = arrow(b) \ => arrow(x) = A^(-1) arrow(b) \ therefore A^(-1) = mat(delim: "[", 1,0,0; 1, 1,0; 1, 1,1) $

- The connection between inverse matrices and integrals : 
The $x$ change to the function $ x(t)$, the matrix $ A$ change to the $ frac(d, d t) x(t)$ then, we get : $ A x = b  "and" x = A^(-1) b <=> frac(d x, d t) = b " and" x(t) = integral_0^x x(t) d t $
#image("Figures/c4.png")
])
== The Cyclic Matrix 
#blockquote([

  $ C = mat(delim: "[", 1, 0, -1; -1 , 1, 0; 0, -1, 1) $

  Suppose we have below euqation : $ C arrow(x) = mat(delim: "[", 1, 0, -1; -1, 1, 0; 0, -1, 1)mat(delim: "[", x_1; x_2; x_3)  = mat(delim: "[", x_1 - x_3 ; x_2 - x_1; x_3 - x_2) = arrow(b) $
  For this Equation, it's impossible to find the solution to $C x = b$, as the three euqations either have infinitely many solutions (sometime) or else no solution(usually). 
  - $C x = b$ have infinitely solutions : 
  $ mat(delim: "[", x_1 - x_3; x_2 - x_1; x_3 - x_2) = mat(delim: "[", 0; 0; 0) $ is solved by all vectors : $ mat(delim: "[", x_1; x_2; x_3) = mat(delim: "[", c; c; c) $the underdetermind constant $c$ can be any number. 


- $C x = b$ no solution : 
$ mat(delim: "[", x_1 - x_3; x_2 - x_1; x_3 - x_2)  = mat(delim: "[", 1 ; 3; 5) $
This euqation have no solution, because it's left sides add to zero, but right sides add to 9. 
In other view : 

#text(fill:red, "All combinations ") $ x_1 mat(delim: "[", 1; -1; 0) + x_2 mat(delim:"[", 0; 1; -1) + x_3 mat(delim:"[", -1 ; 0; 1) $ #text(fill: red, "lie on the same plane given by") $ b_1 + b_2 + b_3 = 0 $ and the vector $ mat(delim: "[", 1; 3; 5)$ is not in this plane. so we cannot produce the vector$ mat(delim: "[", 1 ;3 ; 5)$by combine those vectors.
#image("Figures/c5.png")

#text(fill:red, "The combinations of Independent vectors can fill the whole vector space. ")

 $ x_1 mat(delim: "[", 1; -1; 0) + x_2 mat(delim:"[", 0; 1; -1) + x_3 mat(delim:"[", -1 ; 0; 1) != mat(delim: "[", 1; 3; 5) $


])


== Independence and Dependence 

#blockquote([
  Suppose we have two vectors $ arrow(v) ; arrow(u) $. The key Question is whether the third vector is in that plane (constructed by $arrow(u) + arrow(v)$) 
- *Independence* :  If the third vector $ arrow(w)$ is not on that plane. 

- *Dependence* :  If the third vector in that plane : $ arrow(v) + arrow(u) = arrow(w) $


In another view : 
- *Independence* : For the euqation $ A x = 0$ only one solution $ A$ is *invertible*. 
- *Dependence* : For the euqation $C x = 0$ has many solutions, $C$ is *singular*.


So, we have below conclusions : 
1. If a matrix $A$ is invertible, the columns of $A$ must is *Independence*.  and $ A x =0$ #text(fill:red, "0nly one solution") ($x =0$).
2. If a matrix $C$ is singular, the columns of $C$ must is *Dependence*. and $C x =0$ #text(fill:red, "has many nonezero solutions. ")
])

