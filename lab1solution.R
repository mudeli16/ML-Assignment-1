# Loading necessary packages
library(tidyverse)
library(tidymodels)

# Loading the data that is csv file
students_data <- read_csv("studentInfo.csv")

# Modify variables
students_data <- students_data %>%
  mutate(pass_as_binary = ifelse(final_result == "Pass", 1, 0)) %>% # Convert pass to binary
  mutate(pass_as_factor = as.factor(pass_as_binary)) %>%  # Convert pass to factor
  mutate(disability_as_factor = as.factor(disability))  # Convert disability to factor

# Review dataset
students_data

# constructing dditionl features
students_data <- students_data %>%
  mutate(imd_band_as_factor = factor(imd_band, levels = c("0-10%", "10-20%", "20-30%", "30-40%", "40-50%", "50-60%", "60-70%", "70-80%", "80-90%", "90-100%"))) %>%
  mutate(imd_band_as_integer = as.integer(imd_band_as_factor)) # Convert IMD band to integer

#Now Spliting the data
set.seed(20230712)
training_testing_split <- initial_split(students_data, prop = 0.80)
training_data <- training(training_testing_split)
testing_data <- testing(training_testing_split)

# Create a recipe
recipe_model <- recipe(pass_as_factor ~ disability_as_factor + imd_band_as_integer, data = training_data) # Recipe formulation

# Defining the model
logistic_regression_model <- 
  logistic_reg() %>% 
  set_engine("glm") %>% 
  set_mode("classification")

# Adding the  model and recipe to the workflow
workflow_model <- 
  workflow() %>% 
  add_model(logistic_regression_model) %>% 
  add_recipe(recipe_model)


fitted_model <- fit(workflow_model, data = training_data)


testing_split <- initial_split(testing_data, prop = 0.8)  # Splitting testing data


final_fitted_model <- last_fit(workflow_model, split = testing_split)

# final fitted model
final_fitted_model

#Prediction
final_fitted_model %>%
  collect_predictions()

# Define the model configurtion
final_fitted_model %>%
  collect_predictions() %>%
  select(.pred_class, pass_as_factor) %>%
  mutate(correct_prediction = .pred_class == pass_as_factor) %>%
  tabyl(correct_prediction)
