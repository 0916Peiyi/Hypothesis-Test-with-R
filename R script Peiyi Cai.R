install.packages("stargazer")
library(stargazer)
library(broom)

deaths <- read.csv("C:/Users/DELL-LH2018/Desktop/r practice 3/comorbidities (any) expanded.csv")
deaths <- data.frame(deaths)

#1.probability of death. We can just calculate the mean directly to get the probability.
prop<-x/254018
prop
#t test
t1<-t.test(deaths$death,mu=0.042)
tidy_t1 <- broom::tidy(t1)

#prop test
x<-sum(deaths$death)
t2<-prop.test(x,254018,p=0.042,correct = TRUE)
tidy_t2 <- broom::tidy(t2)

#binom test
t3<-binom.test(x,254018,p=0.042)
tidy_t3 <- broom::tidy(t3)

#rename and create the table which bind three tests.
row.names(tidy_t1)<-c("t.test")
row.names(tidy_t2)<-c("prop.test")
row.names(tidy_t3)<-c("binom.test")
tidy_t<- rbind(tidy_t1,tidy_t2,tidy_t3)
write.csv(tidy_t,"Mytable1.csv")



#2.conduct multiple one-sample tests of proportion for multiple groups
# gender: 
d1 <- deaths %>% filter(sex=="Female")
d2 <- deaths %>% filter(sex=="Male")
#prop.test will give us a chi-square distribution with 1 degree of freedom, but if we use binom.test to test, we can get a result to observe and accurately test the probability. So here we use binom.test
x1<-sum(d1$death)
y1<-x1+sum(d1$death==0)
x2<-sum(d2$death)
y2<-x2+sum(d2$death==0)

t4<-binom.test(x1,y1,p=0.042)
t5<-binom.test(x2,y2,p=0.042)
tidy_t4 <- broom::tidy(t4)
tidy_t5 <- broom::tidy(t5)
row.names(tidy_t4)<-c("Female")
row.names(tidy_t5)<-c("Male")
tidy_tx1<- rbind(tidy_t4,tidy_t5)
write.csv(tidy_tx1,"Mytable2.csv")

# ethnicity
d3<- deaths %>% filter(ethnicity=="Hispanic/ Latino")
d4<- deaths %>% filter(ethnicity=="Non-Hispanic/ Latino")
d5<- deaths %>% filter(ethnicity=="Unknown")

x3<-sum(d3$death)
y3<-x3+sum(d3$death==0)
x4<-sum(d4$death)
y4<-x4+sum(d4$death==0)
x5<-sum(d5$death)
y5<-x5+sum(d5$death==0)

t6<-binom.test(x3,y3,p=0.042)
t7<-binom.test(x4,y4,p=0.042)
t8<-binom.test(x5,y5,p=0.042)
tidy_t6 <- broom::tidy(t6)
tidy_t7 <- broom::tidy(t7)
tidy_t8 <- broom::tidy(t8)
row.names(tidy_t6)<-c("Hispanic/ Latino")
row.names(tidy_t7)<-c("Non-Hispanic/ Latino")
row.names(tidy_t8)<-c("Unknown")
tidy_tx2<- rbind(tidy_t6,tidy_t7,tidy_t8)
write.csv(tidy_tx2,"Mytable3.csv")

# race
dr1<- deaths %>% filter(race=="African-American/ Black")
dr2<- deaths %>% filter(race=="American Indian/ Alaska Native")
dr3<- deaths %>% filter(race=="Asian")
dr4<- deaths %>% filter(race=="Native Hawaiian/ Pacific Islander")
dr5<- deaths %>% filter(race=="Other")
dr6<- deaths %>% filter(race=="Unknown")
dr7<- deaths %>% filter(race=="White")

a1<-sum(dr1$death)
b1<-a1+sum(dr1$death==0)
a2<-sum(dr2$death)
b2<-a1+sum(dr2$death==0)
a3<-sum(dr3$death)
b3<-a1+sum(dr3$death==0)
a4<-sum(dr4$death)
b4<-a1+sum(dr4$death==0)
a5<-sum(dr5$death)
b5<-a1+sum(dr5$death==0)
a6<-sum(dr6$death)
b6<-a1+sum(dr6$death==0)
a7<-sum(dr7$death)
b7<-a1+sum(dr7$death==0)

tr1<-binom.test(a1,b1,p=0.042)
tr2<-binom.test(a2,b2,p=0.042)
tr3<-binom.test(a3,b3,p=0.042)
tr4<-binom.test(a4,b4,p=0.042)
tr5<-binom.test(a5,b5,p=0.042)
tr6<-binom.test(a6,b6,p=0.042)
tr7<-binom.test(a7,b7,p=0.042)
tidy_tr1 <- broom::tidy(tr1)
tidy_tr2 <- broom::tidy(tr2)
tidy_tr3 <- broom::tidy(tr3)
tidy_tr4 <- broom::tidy(tr4)
tidy_tr5 <- broom::tidy(tr5)
tidy_tr6 <- broom::tidy(tr6)
tidy_tr7 <- broom::tidy(tr7)
row.names(tidy_tr1)<-c("African-American/ Black")
row.names(tidy_tr2)<-c("American Indian/ Alaska Native")
row.names(tidy_tr3)<-c("Asian")
row.names(tidy_tr4)<-c("Native Hawaiian/ Pacific Islander")
row.names(tidy_tr5)<-c("Other")
row.names(tidy_tr6)<-c("Unknown")
row.names(tidy_tr7)<-c("White")
tidy_tx3<- rbind(tidy_tr1,tidy_tr2,tidy_tr3,tidy_tr4,tidy_tr5,tidy_tr6,tidy_tr7)
write.csv(tidy_tx3,"Mytable4.csv")
getwd()



