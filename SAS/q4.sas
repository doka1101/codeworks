/* Assignment 3 Question 4 SAS Code */
options ls = 72 nodate;

data a3q4;
/*
 * rTime: reaction time
 * a: factor for cue stimulus (a=1: auditory, a=2: visual)
 * b: factor for elapsed time (b=1: 5 secs, b=2: 10 secs, b=3: 15 secs)
 */
input order rTime a b;
cards;
1	0.256	2	3
2	0.281	2	3
3	0.167	1	2
4	0.258	2	3
5	0.182	1	2
6	0.283	2	2
7	0.257	2	1
8	0.235	2	2
9	0.204	1	1
10	0.170	1	1
11	0.260	2	2
12	0.187	1	2
13	0.202	1	3
14	0.279	2	1
15	0.269	2	1
16	0.198	1	3
17	0.236	1	3
18	0.181	1	1
;
run;

proc glm data = a3q4;
class a b;
model rTime = a b a*b;
estimate 'u1.-u2.' a 1 -1;	/* Question 4(e)*/
estimate 'u11-u21' a 1 -1 a*b 1 0 0 -1 0 0; 	/*Question 4(f)*/
run;


/* computing mean for interaction plot (part (c)) */
proc sort data=a3q4;
by a b;

proc means data=a3q4;
var rTime;
by a b;
run;


