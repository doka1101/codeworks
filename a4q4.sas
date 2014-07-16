/* Assignment 4 Question 4 */
option ls=72 nodate;

DATA a4q4;
INPUT WEEK STORE TRTMT Y @@;
CARDS;
1 1 2 31 1 2 1 23 1 3 3 12 1 4 4  3 1 5 1 10 1 6 3 30 1 7 2 23 1 8 4 14
2 1 1 19 2 2 4 16 2 3 2 14 2 4 3  4 2 5 2 21 2 6 4 25 2 7 3 17 2 8 1 14
3 1 4 15 3 2 3 30 3 3 1 12 3 4 2  6 3 5 3 12 3 6 1 47 3 7 4  5 3 8 2  3
4 1 3 16 4 2 2 27 4 3 4  5 4 4 1 11 4 5 4 12 4 6 2 38 4 7 1 13 4 8 3  6
;

proc glm data = a4q4;
class week store trtmt;
model y = week store trtmt / solution;
/* part (g) */
means trtmt / tukey cldiff alpha = 0.05;
output out = a4q4_out predicted = ypred residual = z;
run;

proc standard std=1.0;
var z;

proc rank normal=blom;
var z;
ranks nscore;

/*part (b) - residual plots */
proc plot;
plot z*ypred / vref=0 vpos=15 hpos=20; /*checking constant variance assumption*/
plot z*nscore / vref=0 vpos=15 hpos=30; /*checking normality assumption */
run;

/*part (c) - plotting adjusted data */
data a4q4_2;
input week what @@;
cards;
1 2.25 2 0.25 3 0.25 4 0.00
;
run;

proc means mean; /* print average of the week effect estimates*/
var what;
run;

data a4q4_3;
input store shat @@;
cards;
1 11.00 2 14.75 3 1.50 4 -3.25 5 4.50 6 25.75 7 5.25 8 0.00
run;

proc means mean; /* print average of the store effect estimates */
var shat;
run;

/* what = 0.6875, shat = 7.4375 */
data a4q4_3;
set a4q4;
if week = 1 then yadj = y - (2.25 - 0.6875);
else if week = 2 then yadj = y - (0.25 - 0.6875);
else if week = 3 then yadj = y - (0.25 - 0.6875);
else if week = 4 then yadj = y - (0.00 - 0.6875);

if store = 1 then yadj = yadj - (11.00 - 7.4375);
else if store = 2 then yadj = yadj - (14.75 - 7.4375);
else if store = 3 then yadj = yadj - (1.50 - 7.4375);
else if store = 4 then yadj = yadj - (-3.25 - 7.4375);
else if store = 5 then yadj = yadj - (4.50 - 7.4375);
else if store = 6 then yadj = yadj - (25.75 - 7.4375);
else if store = 7 then yadj = yadj - (5.25 - 7.4375);
else if store = 8 then yadj = yadj - (0.00 - 7.4375);

/* adjusted data plot */ 
proc plot;
plot yadj * trtmt / VPOS=19 HPOS=50; ;
run;



