##  Examples of using RWeka

library(RWeka)

############ OneR ############
Iris_OneR = OneR(Species ~., data=iris)
Iris_OneR
summary(Iris_OneR)


############ J48 ############
Iris_J48 = J48(Species ~., data=iris)
Iris_J48
summary(Iris_J48)

## Another way to get Cross-validation results
evaluate_Weka_classifier(Iris_J48, numFolds = 10, seed=1)

## J48 changing the value of minNumObj to 5
WOW(J48)			## To find possible arguments for Weka_control
Iris_J48_M5 = J48(Species ~ ., data = iris, control = Weka_control(M=5))
Iris_J48_M5
summary(Iris_J48_M5)


############ Naive Bayes ############
NB <- make_Weka_classifier("weka/classifiers/bayes/NaiveBayes")
Iris_NB = NB(Species~., data=iris)
Iris_NB
summary(Iris_NB)

## Predict a new example
TestExample = data.frame(Sepal.Length=5.8, Sepal.Width=3.1, 
	Petal.Length=4.3, Petal.Width=1.2)
predict(Iris_NB, TestExample)


########## k-Means Clustering ##############
# Create a Weka control object to specify our parameters
weka_ctrl <- Weka_control( 
  N = 3,		# number of clusters
  I = 100 		# max no iterations overall
)
SKM_I = SimpleKMeans(iris[,1:4], control = weka_ctrl)
SKM_I





