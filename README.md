# Student Performance Prediction Model

This repository contains code aimed at constructing a predictive model to estimate student performance based on various factors like study hours, quiz scores, forum participation, and previous grades. The model is developed in R using supervised learning methods.

## Generating the Dataset

The dataset is artificially generated to resemble student performance data. It comprises features such as study hours, quiz scores, forum participation, previous grades, and final grades. The synthetic data is created with a fixed random seed to ensure reproducibility.

## Development of the Model

1. **Data Division**: The dataset is divided into training and testing subsets in an 80:20 ratio. This partitioning enables training the model on a portion of the data while assessing its performance on unseen data.

2. **Model Selection**: Logistic regression is opted for as the predictive model due to its appropriateness for binary classification tasks. The model is specified using the `{parsnip}` package, with the engine set to a generalized linear model (glm) for logistic regression.

3. **Feature Engineering**: A recipe is formulated to preprocess the data before model training. This recipe outlines the target variable (`FinalGrades`) and predictor variables (`StudyHours`, `QuizScores`, `ForumPosts`, `PreviousGrades`).

4. **Model Training**: The model undergoes training on the training dataset using the specified workflow, encompassing both the model and recipe.

5. **Model Assessment**: The trained model is assessed on the testing dataset to gauge its predictive performance. Evaluation metrics like accuracy and prediction interval are calculated to gauge the model's efficacy in forecasting student grades.

## Instructions for Usage

To execute the code:

1. Clone this repository to your local machine.
2. Open the R script or R Markdown file in your preferred R development environment.
3. Ensure installation of the required packages listed in the script.
4. Sequentially run the code to generate simulated data, train the model, and evaluate its performance.

## Prerequisites

The following R packages are necessary to run the code:

- `{tidymodels}`: For data modeling and preprocessing.
- `{rsample}`: For data partitioning and resampling.
- `{parsnip}`: For specifying machine learning models.
- `{dplyr}`: For data manipulation.
- `{ggplot2}`: For data visualization.

If these packages are not already installed, utilize the `install.packages()` function to install them.
