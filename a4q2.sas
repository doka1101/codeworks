/* Assignment 4 Question 2 */
option ls = 72 nodate;
/* 
  block: 1 = Tom, 2 = Derek, 3 = Tsai, 4 = Yang
  Colour: 1 = Red, 2= White, 3= Blue, 4 = Yellow (treatment)
  bSize: size of each blokc
  bTime: burning time (in seconds)
 */ 
data a4q2;
input blk color bSize bTime @@;
cards;
1 1 1 989 1 1 2 1032 1 1 3 1077	1 1	4 1019 1 2 1 1044 1 2 2 979 1 2 3 987 1 2 4 1031
1 3 1 1011 1 3 2 951 1 3 3 928 1 3 4 1022 1 4 1 974 1 4 2 998 1 4 3 1033 1 4 4 1041
2 1 1 899 2 1 2 912 2 1 3 911 2 1 4 943 2 2 1 847 2 2 2 880 2 2 3 879 2 2 4 830
2 3 1 899 2 3 2 800 2 3 3 820 2 3 4 812 2 4 1 886 2 4 2 859 2 4 3 901 2 4 4 907
3 1 1 898 3 1 2 840 3 1 3 955 3 1 4 1005 3 2 1 840 3 2 2 952 3 2 3 961 3 2 4 915
3 3 1 909 3 3 2 790 3 3 3 871 3 3 4 905 3 4 1 950 3 4 2 992 3 4 3 920 3 4 4 890
4 1 1 993 4 1 2 957 4 1 3 1005 4 1 4 982 4 2 1 987 4 2 2 960 4 2 3 920 4 2 4 1001
4 3 1 864 4 3 2 925 4 3 3 824 4 3 4 790 4 4 1 949 4 4 2 973 4 4 3 978 4 4 4 938
;

/* part (b),(c), and (d) */

proc glm data = a4q2;
class blk color;
model bTime = blk color blk * color;
run;

/* part (e) */
proc sort data = a4q2;
by color;
run;

proc means data = a4q2;
var bTime;
by color;
run;






 

