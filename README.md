# Hypothesis-Test-with-R
I will analyze the probability of death in different situation about the cases and deaths in Georgia which are due to COVID-19.


Go a step further, the data set used in this report contains 254019 rows and 6 variables which means there are 254018 cases in Georgia. The cases in this data set are all in the “Any Chronic Condition”, and they have their own gender and race/ethnicity, as an independent individual. During the analysis, I will use hypothesis test including using t.test, prop.test and binom test to test mortality and compare it to the national COVID-19 infection fatality rate during the same period at the same time.


Features:
comorbidity : The patient’s chronic disease situation in the case 
sex: The patient’s gender in the case
ethnicity: The patient’s ethnicity in the case
race: The patient’s race in the case 
cases: Whether it’s a COVID-19 case (0: not case, 1: case)
deaths: Whether this case is fatal or not (0: death occurred, 1: death not occurred)


B.Analysis- Part I
At the very beginning, I calculated the COVID-19 infection mortality rate of this data set, and then I can get the proportion of death is 0.0447. As we know, the value is 0.042 nationwide which doesn’t intuitively seem to be equal to 0.0447 we get. So, we did a hypothesis test.

First, set the null and the alternative hypothesis for the whole test:
H0: the Georgia’s infection mortality rate ＝ 0.042
H1: the Georgia’s infection mortality rate ≠ 0.042

Then, use three t-test functions prop.test(), binom.test() and t.test():
1.In prop.test() function, we calculated the total number of deaths and the total number of cases. And use this function to get some statistical values such as a 95% confidence interval, p-value, the degree and freedom and t value.
2.In binom.test() function, the operation is consistent with the operation of prop.test, almost identical, and these statistical values can also be obtained.
3.In t.test() function, since we have changed the value of the variable “deaths” to binary indicator variable in which “0” means death not occurred while “1” means death occurred, we can get the proportion of deaths directly by calculating the mean of values in this column. 

 

Then, for more convenient observation and comparison, I combined the results of the above three functions and got the following table:

Table 1: The first total table of results of t.test(), prop.test and binom.test
	estimate	statistic	p.value	parameter	conf.low	conf.high
t.test	0.04472124	6.635540334	3.24E-11	254017	0.043917454	0.045525027
prop.test	0.04472124	46.6825908	8.35E-12	1	0.043922369	0.045533915
binom.test	0.04472124	11360	1.28E-11	254018	0.043920689	0.0455322

Table 2: The second total table of results of t.test(), prop.test and binom.test
	method	alternative
t.test	One Sample t-test	two.sided
prop.test	1-sample proportions test with continuity correction	two.sided
binom.test	Exact binomial test	two.sided


The above two tables are disassembled by the total table I have merged. And we can get some significant values such as p-value to help us to determine whether to reject the null hypothesis.


Conclusion: 
Based on the p-value we got from the table 1 and table 2, we can find that the p-value of all three t-tests is greater than 0.05, so we need to reject the null hypothesis and there is enough evidence for us to support that the claim that the proportion of deaths in Georgia is not equal to the national infection mortality rate which is 0.042. Although we can see that the difference in values is small by looking directly, we find that we need to reject the null hypothesis by t-test.
What’s more, by using t.test() function with calculating the mean directly, we find that although the p value we get is not as small as the p values of the remaining two tests, we can get an accurate degree of freedom which is 254017 because the t.test() is not the function which need to calculate the proportion firstly. And by comparing the p values of three kinds of t-tests. We can clearly see the p value of prop.test() at the minimum but every p value is very small which means the difference of COVID-19 infection mortality rate between the country and Georgia is highly significant.
In the end, compared three t-tests. I think t.test() function is more reliable even though it’s p value is the biggest. Because it has a more convenient way to calculate for the binary indicator variables, and it has a accurate degree of freedom, and it also has a super small p value to reject the null hypothesis. 
