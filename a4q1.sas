/* 
	Assignment 4 Question 1 
	Name: Dongsoo Kang
	Student No.: 205925318
 */

option ls = 72 nodate;
data a4q1;
input a b c d td @@;
cards;
0 0	0 0	21.6 0 0 0	1 11.54 0 0	0 2	19.09 0	0 0	3 13.11 
0 0	1 0	21.60 0	0 1	1 11.50 0 0	1 2	21.08 0	0 1	3 11.72 
0 1	0 0	21.09 0	1 0	1 11.14 0 1	0 2	21.31 0	1 0	3 11.26
0 1	1 0	22.17 0	1 1	1 11.32 0 1	1 2	20.44 0	1 1	3 12.82 
1 0	0 0	21.60 1	0 0	1 11.75 1 0	0 2	19.50 1	0 0	3 13.72 
1 0	1 0	21.86 1	0 1	1 9.82 1 0 1 2 21.66 1 0 1 3 13.03
1 1	0 0	19.57 1	1 0	1 11.69 1 1	0 2	20.11 1	1 0	3 12.09 
1 1	1 0	21.86 1	1 1	1 11.18 1 1	1 2	20.24 1	1 1	3 12.29
;

proc glm data=a4q1;
class a b c d;
model td = a b c d a*b a*c a*d b*c b*d c*d;
/* part (d) */
means d / bon cldiff alpha=0.02;
/* part (f) */
means d / tukey cldiff alpha=0.02;

output out=a4q1_out predicted= ypred residual = z;
run;

/* part (c) - checking assumptions */
/*standardizing normal */
proc standard std=1.0;
var z;

proc rank normal=blom;
var z;
ranks nscore;

proc print;

proc plot;
plot z * ypred / Vref=0 vpos=19 hpos = 30;
plot z * nscore / Vref=0 vpos=19 hpos = 30;
run;

/* part(g) */
proc glm data = a4q1;
class c d;
model td = c d c*d;
run;


