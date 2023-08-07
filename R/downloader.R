# 0. Initial setup ###########
## Loads libraries
library(dplyr)
library(lubridate)
library(readr)

## Reads the results from 1993-94 to almost all of 2021-22 collected by Alvin
## Obtained from https://www.kaggle.com/datasets/irkaal/english-premier-league-results
oldest <- readr::read_csv("data/results_oldest.csv")

## Reads the results from 2021-22 collected by Evan Gower
## Obtained from https://www.kaggle.com/datasets/irkaal/english-premier-league-results
old <- readr::read_csv("data/results_old.csv")

# 1. Joins the datasets ###########
## Simplifies the date column [oldest]
oldest <- oldest |> 
  dplyr::mutate(DateTime = lubridate::floor_date(DateTime, unit = "day"))

## Adds season and converts date [old]
old <- old |> 
  dplyr::mutate(Date = lubridate::dmy(Date),
                season = "2021-22")

## Keeps only columns of interest and renames them [oldest]
oldest <- oldest |> 
  dplyr::rename("season" = "Season",
                "day" = "DateTime",
                "home" = "HomeTeam",
                "away" = "AwayTeam",
                "homeGoals" = "FTHG",
                "awayGoals" = "FTAG",
                "winner" = "FTR") |> 
  dplyr::select(season, day, home, away, homeGoals, awayGoals, winner)

## Keeps only columns of interest and renames them [old]
old <- old |> 
  dplyr::rename("day" = "Date",
                "home" = "HomeTeam",
                "away" = "AwayTeam",
                "homeGoals" = "FTHG",
                "awayGoals" = "FTAG",
                "winner" = "FTR") |> 
  dplyr::select(season, day, home, away, homeGoals, awayGoals, winner)

## Eliminates 1993-94, 1994-95 and 2021-22 results [oldest]
oldest <- oldest |> 
  dplyr::filter(!(season %in% c("1993-94", "1994-95", "2021-22")))

## Joins both datasets and saves them
allData <- dplyr::bind_rows(oldest, old) |> 
  dplyr::arrange(desc(day))
readr::write_csv(allData, "data/downloadedData.csv")
