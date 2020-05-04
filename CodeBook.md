---
title: "Getting and Cleaning Data Project"
output: html_document
---


## Description

This Code Book describes the variables, the data and transformations and work performed to clean up the data.


## Overview

The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone while 30 volunteers were performing 6 different activities.

The full data and description of the data can be found [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data processing and transformation

Data was read into dataframes and train and test data were merged into one dataset. Descriptive names were added for variables. Values in activity column were conververted from integers to factors using activity names provided in the data set. For each measurement only the measuremnts on the mean and standard deviation were extracted. Resulting tidy data set was output to CSV file.
