# globals.R

# Maximal Margin Classifier
# Generating linearly separable data.
set.seed(0)
x1 = c(rnorm(100, 0, 4), rnorm(100, 1, 3))
x2 = c(rnorm(100, 0, 1), rnorm(100, 6, 1))
y = as.factor(c(rep(-1, 100), rep(1, 100)))
linearly.separable = data.frame(x1, x2, y)

# set.seed(0)
# train.index = sample(1:200, 200*.8)
# test.index = -train.index
# 
# svm.mmc.linear = svm(y ~ ., #Familiar model fitting notation.
#                      data = linearly.separable, #Using the linearly separable data.
#                      subset = train.index, #Using the training data.
#                      kernel = "linear", #Using a linear kernel.
#                      cost = 1) #A very large cost; default is 1.
