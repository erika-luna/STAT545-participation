
number <- 80499 + 233302
number*2

#Vector example: travel times. "c" creates a vector/object
(times <- c(60,40,33,15,20,55,35)) #shortcut: putting brackets around the whole line
                                #to print the result.
times/60

#function: it takes an input and returns an output.

mean(times)
sqrt(times)
range(times)

#Logicals:
times < 30 #element smaller than 30
times == 20 #elements equal 20
times != 20 #elements not equal to 20
times > 20 & times < 50 #Vector of trues and falses AND another vector of trues and falses
times < 20 | times > 50 #OR
i <- which(times < 30)
sum(times < 30)
a <- all(times < 30)

#Subsetting:
times[3]
times[-3]
times[c(2, 4)]
times[c(4, 2)]
times[1:5]
times[3, 5]
times[times < 30] #logicals inside brackets
times #hasnt changed
times[times > 50] <- 50 #all elements greater than 50 are 50
times

#Missing data in a dataset (missing values) NAs.
times[8] <- NA #Assigning the 8th element NA
times
mean(times) #We get NA from this
?mean
#From documentation: mean(x, trim = 0, na.rm = FALSE, ...)
mean(x = times, na.rm = TRUE) #naming the arguments; if we named it, then the order doesn't matter.
mean(times, 0, TRUE) #without naming the arguments; if we don't named the arguments, then the order matters.

#Data Frames
mtcars
str(mtcars) #
names(mtcars) #extracts a vector of names.
mtcars$mpg #extracts columns from our df. 
mean(mtcars$mpg)



