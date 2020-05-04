---
title: "README.md"
author: "Vesa Kauppinen"
date: "4 toukokuuta 2020"
output: html_document
---

# Getting and Cleaning Data Project

## Contents

This repo contains following files:
- run_analysis.R script to merge and transfrom data into one tidy data set
- CodeBook.md to describe the data and variables

## run_analysis.R script

The script will download the data set from the source to your working directory and unzip it.

If not already installed, the script will install R packages "data.table" and "reshape2".

The script will merge and transform the data into one tidy data set containing mean and standard deviation of each variable for each activity and each subject.
