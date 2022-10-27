## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_twitterads_data.RData")

## ----setup--------------------------------------------------------------------
library(twitteradsR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_twitterads_data <-
#    fetch_twitterads(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_twitterads_data)

## -----------------------------------------------------------------------------
ggplot(my_twitterads_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_twitterads_data, family = "poisson")
summary(lmod)

