/* MATH 4730 Group Presentation
 * Chapter 11 Question 15
 * Name: Dongsoo Kang
 * 		 Nahyun Lim
 */

option ls = 72 nodate;

data ch11q15;
input blk trmt vd @@;
cards;
MATH 4730 Group Presentation
Prepared by: Dongsoo Kang & Nahyun Lim
Chapter 11 Question 15
(a)	Show that the design consists of a group divisible design with three blocks repeated six times.
 	Treatment
Block	1	2	3	4	5	6
1	1	1	0	0	1	1
2	1	0	1	1	0	1
3	0	1	1	1	1	0
4	1	1	0	0	1	1
5	1	0	1	1	0	1
6	0	1	1	1	1	0
7	1	1	0	0	1	1
8	1	0	1	1	0	1
9	0	1	1	1	1	0
10	1	1	0	0	1	1
11	1	0	1	1	0	1
12	0	1	1	1	1	0
13	1	1	0	0	1	1
14	1	0	1	1	0	1
15	0	1	1	1	1	0
16	1	1	0	0	1	1
17	1	0	1	1	0	1
18	0	1	1	1	1	0
						
Note: 			
1: if treatment i occurs			
0: if treatment i does not occur			
i = 1, ・ 6			
						
Comments:  When we divide the blocks in six partitions, we can 
observe that every partition has identical values.

The groups in the group divisible design are:  (1, 6), (2, 5), and (3, 4) [numbers inside the parentheses are the treatment numbers]. Hence the group divisible design has three groups    (g = 3) with two labels (treatments) in each group (l = 2). 

First associates (ル1): ル1 = 12, because each pair; (1, 6), (2, 5), and (3, 4) appear exactly 12 times in the table.

Second associates (ル2): ル2 = 6, because each pair excluding (1, 6), (2, 5), and (3, 4) appear exactly 6 times in the table.

There are four conditions that need to be met for a group divisible design with chosen values of v, b, k, r, ル1, and ル2:
1.	vr = bk
2.	r(k ? 1) = ル1(l ? 1) + ル2l(g-1)
3.	r ｜  ル1
4.	rk ｜  ル2v
From the question, we obtain the following: v = 6, b = 18, k = 4, r = 12, ル1 = 12, and ル2 = 6 
Thus, 
1.	6(12) = 18(4) = 72
2.	12(4 - 1) = 12(2 - 1) + 6(2)(3-1) = 36
3.	12 ｜ 12
4.	12(4) ｜ (6)(6)
Therefore, all four conditions are met.
(b)	The equation of variance of pair-wise comparison between two treatments are:
-	if i and p are first associates:
Var ( ?ンi - ?ンp ) = 2kヲ2 / [vル2 + l(ル1 ? ル2)]

-	if i and p are second associates: 
Var ( ?ンi - ?ンp ) = 2k[vル2 + (ル1 ? ル2)]ヲ2 / vル2[vル2 + l(ル1 ? ル2)]

We use ヲ2 = MSE from SAS output ? 8.076. After computing the two formulas, we obtain 1.346 for the first associates variance, and 1.570 for the second associates variance.
(c)	Treatments that are first associated are treatments 1 & 6, treatments 2 & 5, and treatments 3 & 4. Treatments that are second associated are: (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 6), (3, 5), (3, 6), (4, 5), (4, 6), and (5, 6).
We believe the author chose this design, because according to page 342 from the textbook, it states: 
＾The importance of selecting an experimental plan with an even distribution of treatment labels within the blocks is to try to ensure that all treatment contrasts are estimable and that pair-wise comparison estimators have similar variances.￣ (Voss & Dean pg.342) 
The two variance values that we obtained from part (b) are similar. If the variance values are similar we can get confidence intervals with similar length. Therefore, we believe that the author chose this design.

(d)	 SAS Code: 
/* part (d) - writing down contrast coefficients */
contrast 'part(i)' trmt 1 1 1 -1 -1 -1;
contrast 'part(ii) - low dosage' trmt 1 0 0 0 0 -1;
contrast 'part(ii) - med dosage' trmt 0 1 0 0 -1 0;
contrast 'part(ii) - high dosage' trmt 0 0 1 -1 0 0; 
contrast 'part(iii) - linear-(Standard)' trmt -1 0 1 0 0 0;
contrast 'part(iii) - linear-(Test)' trmt 0 0 0 -1 0 1;
contrast 'part(iv) - quad - (Standard)' trmt 1 -2 1 0 0 0;
contrast 'part(iv) - quad - (Test)' trmt 0 0 0 1 -2 1;





SAS Output [Table 1]: 
 
(e)	Let¨s assume メ = 0.05. 
The model: yhi = レ + トh  + ンi + ュhi 
 レ : constant
 トh: effect of the hth block (h = 1, ・ , 18)
 ンi: effect of the ith treatment (I = 1, ・, 6)  
ュhi: error term (~ mutually independent)
Hypothesis Test
H0◇: All ンi¨s are equal vs H1: At least two of ンi¨s differ.




Table 1
 
Conclusion:  From the ANOVA table (table 1), the p-value is 0.0002. Hence we reject H0. However, all the p-values in table 2 are greater than the p-value from table 1 (0.0002). Hence, we can conclude that the contrast effects are less ＾significant￣ or ＾extreme￣ than the effect from table 1. Hence, the above individual treatment contrasts may seem unwarranted, therefore, the all the contrasts in part (d) can be negligible. 
SAS Code: 
1	1	2
1	2	8
1	5	9
1	6	7
2	1	6
2	3	9
2	4	3
2	6	8
3	2	6
3	3	12
3	4	4
3	5	6
4	1	9
4	2	11
4	5	14
4	6	13
5	1	10
5	3	17
5	4	8
5	6	10
6	2	7
6	3	5
6	4	6
6	5	9
7	1	4
7	2	10
7	5	11
7	6	13
8	1	11
8	3	9
8	4	3
8	6	15
9	2	9
9	3	14
9	4	5
9	5	8
10	1	4
10	2	7
10	5	10
10	6	10
11	1	12
11	3	9
11	4	15
11	6	15
12	2	8
12	3	11
12	4	7
12	5	8
13	1	4
13	2	4
13	5	5
13	6	9
14	1	7
14	3	8
14	4	3
14	6	9
15	2	15
15	3	10
15	4	6
15	5	8
16	1	2
16	2	4
16	5	6
16	6	6
17	1	4
17	3	13
17	4	5
17	6	12
18	2	10
18	3	13
18	4	4
18	4	18
;

proc glm data = ch11q15;
class trmt blk;
/* part(e) - constructing ANOVA table with alpha */
model vd = blk trmt;

/* part (d) - writing down contrast coefficients */
contrast 'part(i)' trmt 1 1 1 -1 -1 -1;
contrast 'part(ii) - low dosage' trmt 1 0 0 0 0 -1;
contrast 'part(ii) - med dosage' trmt 0 1 0 0 -1 0;
contrast 'part(ii) - high dosage' trmt 0 0 1 -1 0 0; 
contrast 'part(iii) - linear-(Standard)' trmt -1 0 1 0 0 0;
contrast 'part(iii) - linear-(Test)' trmt 0 0 0 -1 0 1;
contrast 'part(iv) - quad - (Standard)' trmt 1 -2 1 0 0 0;
contrast 'part(iv) - quad - (Test)' trmt 0 0 0 1 -2 1;
run;




