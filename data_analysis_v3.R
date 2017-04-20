#Data Division
training.index <- sample(1:nrow(quora3), 2100, replace = FALSE) 
training.set <- quora3[training.index,]
test.set <- quora3[-training.index,]

####################################

#creating glm model to predict is_duplicate in quora3
model <- glm(is_duplicate~Corelation_API, data=training.set, family = binomial)

#Prediction on model
scores <- predict(model, newdata = test.set, type= "response")
pr <- prediction(scores, labels= test.set$is_duplicate)
pred.fit.glm <- ifelse(scores>0.5, 1, 0)
confusionMatrix(pred.fit.glm, test.set$is_duplicate, positive = "1")

# Accuracy = 66.89%
#####################################

####################################

#creating glm model to predict is_duplicate in quora3
model <- glm(is_duplicate~Corelation_tfidf, data=training.set, family = binomial)

#Prediction on model
scores <- predict(model, newdata = test.set, type= "response")
pr <- prediction(scores, labels= test.set$is_duplicate)
pred.fit.glm <- ifelse(scores>0.5, 1, 0)
confusionMatrix(pred.fit.glm, test.set$is_duplicate, positive = "1")

# Accuracy = 67.89%
#####################################

####################################

#creating glm model to predict is_duplicate in quora3
model <- glm(is_duplicate~question1_senti + question2_senti, data=training.set, family = binomial)

#Prediction on model
scores <- predict(model, newdata = test.set, type= "response")
pr <- prediction(scores, labels= test.set$is_duplicate)
pred.fit.glm <- ifelse(scores>0.5, 1, 0)
confusionMatrix(pred.fit.glm, test.set$is_duplicate, positive = "1")

# Accuracy = 63.56%
#####################################

####################################

#creating glm model to predict is_duplicate in quora3
model <- glm(is_duplicate~diff_senti, data=training.set, family = binomial)

#Prediction on model
scores <- predict(model, newdata = test.set, type= "response")
pr <- prediction(scores, labels= test.set$is_duplicate)
pred.fit.glm <- ifelse(scores>0.5, 1, 0)
confusionMatrix(pred.fit.glm, test.set$is_duplicate, positive = "1")

# Accuracy = 63.56%
#####################################

####################################

#creating glm model to predict is_duplicate in quora3
model <- glm(is_duplicate~question1_senti + question2_senti+Corelation_tfidf, data=training.set, family = binomial)

#Prediction on model
scores <- predict(model, newdata = test.set, type= "response")
pr <- prediction(scores, labels= test.set$is_duplicate)
pred.fit.glm <- ifelse(scores>0.5, 1, 0)
confusionMatrix(pred.fit.glm, test.set$is_duplicate, positive = "1")

# Accuracy = 68.33%
#####################################

####################################

#creating glm model to predict is_duplicate in quora3
model <- glm(is_duplicate~question1_senti + question2_senti+Corelation_API, data=training.set, family = binomial)

#Prediction on model
scores <- predict(model, newdata = test.set, type= "response")
pr <- prediction(scores, labels= test.set$is_duplicate)
pred.fit.glm <- ifelse(scores>0.5, 1, 0)
confusionMatrix(pred.fit.glm, test.set$is_duplicate, positive = "1")

# Accuracy = 67.33%
#####################################

####################################
#Using Random forest

## On ALL
training.set.all <- training.set[,-1]
training.set.all <- training.set.all[,-2]
training.set.all <- training.set.all[,-3]

fit.rf <- randomForest(x = training.set.all[, 1:3], 
                       y = as.factor(training.set.all$is_duplicate),
                       data = training.set.all, scale = TRUE)

#Prediction on model
scores.rf <- predict(fit.rf, newdata = test.set, type= "prob")[,2]
pr <- prediction(scores.rf, labels= test.set$is_duplicate)

pred.fit.rf <- ifelse(scores.rf>0.5, 1, 0)
confusionMatrix(pred.fit.rf, test.set$is_duplicate, positive = "1")

# Accuracy : 65.44 %
######################################