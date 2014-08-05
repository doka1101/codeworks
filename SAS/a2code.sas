/* Assignment2 SAS Code
 * Name: Dongsoo (Kurt) Kang
 * Student no.: 205925318
 */

/* Data */
option ls = 80 nodate;
data a2;
/* order = order of observations
 * stim = cue stimulus (1 = auditory, 2 = visual) 
 * time = elapsed time (1 = 5 secs, 2 = 10 secs, 3 = 15 secs)
 * rtime = reaction time
 * trmt = treatment
 */
input order stim time rtime;
trmt = 3 * (stim -1) + time;
cards;
1	2	3	0.256
2	2	3	0.281
3	1	2	0.167
4	2	3	0.258
5	1	2	0.182
6	2	2	0.283
7	2	1	0.257
8	2	2	0.235
9	1	1	0.204
10	1	1	0.170
11	2	2	0.260
12	1	2	0.187
13	1	3	0.202
14	2	1	0.279
15	2	1	0.269
16	1	3	0.198
17	1	3	0.236
18	1	1	0.181
;

/* Question 1 (a) 
 * one - way Anova Model
 */

Proc GLM data = a2;
	CLASS trmt;
	MODEL rtime = trmt;

	/* Question 1 (c) - performing contrasts */

	ESTIMATE 'u2 - u1' trmt  -1 1 0 0 0 0; 
	ESTIMATE 'u3 - u1' trmt  -1 0 1 0 0 0; 
	ESTIMATE 'u3 - u2' trmt  0 -1 1 0 0 0; 
	 
	/* Question 1 (e) - SCIs */
	MEANS trmt / TUKEY CLDIFF ALPHA = 0.05; /* Tukey */
	MEANS trmt / SCHEFFE CLDIFF ALPHA = 0.05; /* Scheffe */

	/*Question 2(b) - adding contrast of (mu2 + mu3)/2 - mu1 */
	ESTIMATE '(u2+u3)/2 - u1' trmt -2 1 1 0 0 / DIVISOR = 2;

	/*Question 4 - estimating contrast */
	ESTIMATE 'q4-H0' trmt 1 -1 0 1 -1 0 / DIVISOR = 2;

/* Obtaining the SCIs for Bonferroni Method - Question 1(e) and 2(b)*/
/* found the SAS command (tinv) from the textbook table A.4 */
data bonfT;
df = 12;
m = 3;
a = 0.05;
alph = (1 - (a /(2*m)));
t = tinv(alph,df);

proc print data=bonfT;



	

