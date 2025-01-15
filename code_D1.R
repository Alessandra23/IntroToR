'Hello World!'


# This is a comment and won't affect the code.


2+2
2-2
2*2
2^2
(2+2^2)/2


# Assigning a number to a variable
x <- 10    # You can also use x = 10
y <- 5

# Printing the value of a variable
print(x)

# or simply
y



# ------ Question 1 ------
volume <- 3.14 * 25^2 * 120
volume


# -----------

# Numeric
num_var <- 42
num_var

# Character (text)
char_var <- "Hello, R!"
char_var

# Logical (boolean)
bool_var <- TRUE
bool_var



# Logical operations
is_greater <- 5 > 3
is_less <- 5 < 3
is_equal <- 5 == 3
not_equal <- 5 != 3

# Printing the results
is_greater
is_less
is_equal
not_equal


# Logical expressions
x <- 10
y <- 5

and_condition <- (x > 5) & (y < 10)  # Both conditions must be TRUE
or_condition <- (x > 5) | (y > 10)   # At least one condition must be TRUE
not_condition <- !(x == y)           # Negates the condition

# Printing the results
and_condition
or_condition
not_condition




# ----- Question 2 -----

# Assign scores
participant1 <- 85
participant2 <- 50
participant3 <- 75

# 1. Check if all participants scored above 40 (and)
(participant1 > 40) & (participant2 > 40) & (participant3 > 40)  # TRUE

# 2. Check if any participant scored exactly 50 (or)
(participant1 == 50) | (participant2 == 50) | (participant3 == 50)  # TRUE

# 3. Check if none of the participants scored less than 30 (not)
!((participant1 < 30) | (participant2 < 30) | (participant3 < 30))  # TRUE


# -------



# Vectors

x <- c(10, 20, 30, 40, 50)
x

# Create a vector of a sequence of numbers we can use the : operator.
y <- c(1:10)
y

# Create a character vector
fruits <- c("apple", "banana", "cherry")
fruits

# Create a vector of a sequence of letters
lowercase <- letters[1:10]
lowercase

uppercase <- LETTERS[1:5]
uppercase


# accessing elements

x[1]
x[1:2]
x[c(1,2,5)]



# Matrices

# Create a 3x3 matrix
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)
my_matrix

colnames(my_matrix) <- c('Col 1', 'Col 2', 'Col 3')
rownames(my_matrix) <- c('Row 1', 'Row 2', 'Row 3')

my_matrix

# accessing elements of the matrix

my_matrix[1,1]
my_matrix[1,]
my_matrix[,1]
my_matrix[1:3,1]
my_matrix[1,1:3]
my_matrix[c(1,3),1]
my_matrix[c(1,3),c(2,3)]


# Data frames

# Create a simple data frame
my_dataframe <- data.frame(
  id = 1:3,
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35)
)
my_dataframe

# Accessing specific elements of a data frame
my_dataframe$name  # Access 'name' column
my_dataframe[1,1]
my_dataframe[, 'id']
my_dataframe[2,]


# List

# Create a list
my_list <- list(
  name = "Alice",
  age = 25,
  scores = c(80, 85, 90)
)
my_list

# Accessing elements in a list
my_list$name # Access 'name' element
my_list[[3]]  # Access 'scores' vector


# ----- Questions 3, 4 and 5 ----

# 3. Vector
fertilisers <- c("FertA", "FertB", "FertC")
fertilisers[2] == "FertB"  # Check if the second element is "FertB"

# 4. Matrix
yields_matrix <- matrix(
  c(3.2, 3.5, 4.1, 4.4),  # Yield data
  nrow = 2,                # Two fields
  byrow = TRUE,            # Fill by row
  #dimnames = list(c("Field A", "Field B"), c("Wheat", "Corn"))
)
colnames(yields_matrix) <- c("Field A", "Field B")
rownames(yields_matrix) <- c("Wheat", "Corn")

yields_matrix["Field B", "Wheat"]  # Yield of wheat in Field B

# 5. Data Frame
fields_df <- data.frame(
  Field = c("Field A", "Field B", "Field C"),
  Area = c(5, 10, 8),
  Crop = c("wheat", "corn", "soybean")
)
fields_df[fields_df$Field == "Field C", "Crop"]  # Crop in Field C



# ---------


# Using built-in functions in R

# Create a numeric vector
numbers <- c(10, 20, 30, 40, 50)

# Calculate the mean (average)
avg <- mean(numbers)
avg

# Calculate the sum of the numbers
total <- sum(numbers)
total

# Get the length of the vector
count <- length(numbers)
count


# ----- Question 6 ------

x <- c(1,2,3)
y <- c(1,5,10,15)

length(x) > length(y)
length(x) < length(y)
length(x) == length(y)


# -----------



# creating your own functions

square <- function(x) {
  result <- x^2    # Square the input
  return(result)   # Return the result
}

# Use the function
output <- square(5)
output


# -------- Question 7 ----------

# Create the function
convert_to_kg <- function(yield_tons) {
  yield_kg <- yield_tons * 1000  # Convert to kilograms
  return(yield_kg)              # Return the result
}

# Test the function
convert_to_kg(3.2)  # Should return 3200
convert_to_kg(5)    # Should return 5000



# -----------


# Installing packages

install.packages(ggplot2)


