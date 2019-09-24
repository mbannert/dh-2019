# This is a comment
a <- 1
b <- c(1,2,5)
d <- 1:3

m <- cbind(b,d)
class(m)

mr <- matrix(c(1:9), nrow = 3)

# Note the boolean param!
dframe <- data.frame(n = 1:5, ltrs = letters[1:5],
                     stringsAsFactors = FALSE)

str(dframe)


l <- list(a = a, b = b, df =  dframe)

str(l)
l$a

?data

sum(b)
