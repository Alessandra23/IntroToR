# Code Day 4

install.packages(c("tidyverse", "car", "agricolae", "emmeans", "multcomp"))

library(tidyverse)
library(car)
library(agricolae)
library(emmeans)
library(multcomp)



data <- c(5.1, 5.3, 5.5, 5.7, 5.9)
t.test(data, mu = 5.5)
t.test(data, mu = 5.5, alternative = "less")
t.test(data, mu = 5.5, alternative = "greater")


qqnorm(mtcars$wt, pch = 1, frame = FALSE)
qqline(mtcars$wt, col = "steelblue", lwd = 2)
shapiro.test(x = mtcars$wt)
var.test(wt~am)

# Question 1 --------------------------------------------------------------
t.test(airquality$Ozone, mu = 50, na.rm = TRUE)


# Filter data for cars with 6 cylinders

six_cylinder_data <- mtcars |>
  filter(cyl == 6)

# Perform t-test
t.test(six_cylinder_data$mpg, mu = 20, alternative = "less", conf.level = 0.95)



# Filter data for Setosa species
setosa_data <- iris |>
  filter(Species == "setosa")

# Perform t-test
t.test(setosa_data$Sepal.Length,
       mu = 5.0,
       alternative = "two.sided",
       conf.level = 0.95)




# Two populations ---------------------------------------------------------


# Sample data for two groups
group1 <- c(5.1, 5.3, 5.7, 6.0, 6.2)
group2 <- c(6.1, 6.3, 6.5, 7.0, 7.2)

# Two-sample t-test assuming equal variances (Student's t-test)
t.test(group1, group2, var.equal = TRUE)



# Question 2 --------------------------------------------------------------


# Filter data and select Sepal.Length
setosa_data <- iris |>
  filter(Species == "setosa")

versicolor_data <- iris |>
  filter(Species == "versicolor")

# Perform t-test
t.test(setosa_data$Sepal.Length, versicolor_data$Sepal.Length,
       alternative = "two.sided",
       conf.level = 0.95)


# -------

library(dplyr)

# Filter data and select mpg for 4-cylinder and 6-cylinder cars
four_cylinder_data <- mtcars |>
  filter(cyl == 4)

six_cylinder_data <- mtcars |>
  filter(cyl == 6)

# Perform t-test
t.test(four_cylinder_data$mpg, six_cylinder_data$mpg,
       alternative = "two.sided", conf.level = 0.95)



# ------


# Subset the data for May and September using dplyr
may_temp <- airquality |>
  filter(Month == 5)

september_temp <- airquality |>
  filter(Month == 9)

# Perform an independent two-sample t-test
t.test(may_temp$Temp, september_temp$Temp, var.equal = TRUE)

#-----

# Filter data for June and July and remove missing values
data <- airquality |>
  filter(Month %in% c(6, 7)) |>
  dplyr::select(Day, Month, Ozone) |>
  na.omit()

# Create separate vectors for June and July
ozone_june <- data |>  filter(Month == 6)
ozone_july <- data |>  filter(Month == 7)

# Perform paired t-test
t.test(ozone_june$Ozone, ozone_july$Ozone, paired = TRUE)






# One-way ANOVA -----------------------------------------------------------


data(PlantGrowth)

head(PlantGrowth)
names(PlantGrowth)

# boxplot
ggplot(data = PlantGrowth,
       aes(x = group, y = weight))+
  geom_boxplot()

# anova
aovPlantGrowth <- aov(weight ~ group, data = PlantGrowth)
summary(aovPlantGrowth)

# check plots
#par(mfrow= c(2,2))
plot(aovPlantGrowth)

# check assumptions
residualsPlantGrowth <- residuals(aovPlantGrowth)
shapiroPlantGrowth <- shapiro.test(residualsPlantGrowth)


bartlettPlantGrowth <- bartlett.test(weight ~ group, data = PlantGrowth)
bartlettPlantGrowth


library(car)
levenePlantGrowth <- leveneTest(weight ~ group, data = PlantGrowth)
levenePlantGrowth


# No assumption of equal variance:
oneway.test(weight ~ group, data = PlantGrowth)




# Question 3 --------------------------------------------------------------

# Load the iris dataset
data(iris)

# Create a box plot
ggplot(iris,
       aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of sepal length by species",
       x = "Species",
       y = "Sepal length") +
  theme_bw()

# 2. Perform one-way ANOVA
anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)  # Display the ANOVA table


## Normality Check
# Histogram of residuals
ggplot(data.frame(residuals = residuals(anova_model)), aes(x = residuals)) +
  geom_histogram(bins = 15, fill = "blue", alpha = 0.6, color = "black") +
  labs(title = "Histogram of Residuals", x = "Residuals", y = "Frequency") +
  theme_minimal()

# Q-Q Plot
qqnorm(residuals(anova_model))
qqline(residuals(anova_model), col = "red")

# Shapiro-Wilk Test for normality
shapiro.test(residuals(anova_model))

## Homogeneity of Variances
leveneTest(Sepal.Length ~ Species, data = iris)
# Bartlett’s Test
bartlett.test(Sepal.Length ~ Species, data = iris)


oneway.test(Sepal.Length ~ Species, data = iris)
