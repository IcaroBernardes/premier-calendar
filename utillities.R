########## Creates objects and matrices to feed the page ########## 
# 0. Initial setup ##########
## Loads the packages
library(dplyr)
library(glue)
library(jsonlite)
library(purrr)
library(tidyr)

# 1. Data handling ##########
## Creates a tibble with team name, id and color
selectopts <- dplyr::tibble(
  value = list(
    c("arsenal", "lch(10 80 30.84 / 1)"),
    c("aston-villa", "lch(10 80 250.84 / 1)"),
    c("barnsley", "lch(10 80 27.47 / 1)"),
    c("birmingham", "lch(10 80 271.04 / 1)"),
    c("blackburn", "lch(10 80 150.11 / 1)"),
    c("blackpool", "lch(10 80 75.55 / 1)"),
    c("bolton", "lch(10 80 278.29 / 1)"),
    c("bournemouth", "lch(10 80 38.81 / 1)"),
    c("bradford", "lch(10 80 84.07 / 1)"),
    c("brentford", "lch(10 80 31.23 / 1)"),
    c("brighton", "lch(10 80 270 / 1)"),
    c("burnley", "lch(10 80 345.02 / 1)"),
    c("cardiff", "lch(10 80 268.88 / 1)"),
    c("charlton", "lch(10 80 34.27 / 1)"),
    c("chelsea", "lch(10 80 289.09 / 1)"),
    c("coventry", "lch(10 80 83.3 / 1)"),
    c("crystal-palace", "lch(10 80 255.25 / 1)"),
    c("derby", "lch(10 80 69.58 / 1)"),
    c("everton", "lch(10 80 265.6 / 1)"),
    c("fulham", "lch(10 80 30.41 / 1)"),
    c("huddersfield", "lch(10 80 272.39 / 1)"),
    c("hull", "lch(10 80 66.62 / 1)"),
    c("ipswich", "lch(10 80 297.55 / 1)"),
    c("leeds", "lch(10 80 92.85 / 1)"),
    c("leicester", "lch(10 80 267.5 / 1)"),
    c("liverpool", "lch(10 80 35.97 / 1)"),
    c("man-city", "lch(10 80 254.28 / 1)"),
    c("man-united", "lch(10 80 46.41 / 1)"),
    c("middlesbrough", "lch(10 80 24.6 / 1)"),
    c("newcastle", "lch(10 80 69.98 / 1)"),
    c("norwich", "lch(10 80 132.15 / 1)"),
    c("nottingham-forest", "lch(10 80 18.14 / 1)"),
    c("portsmouth", "lch(10 80 30.84 / 1)"),
    c("qpr", "lch(10 80 256.32 / 1)"),
    c("reading", "lch(10 80 27.99 / 1)"),
    c("sheffield-united", "lch(10 80 24.97 / 1)"),
    c("sheffield-weds", "lch(10 80 243.34 / 1)"),
    c("southampton", "lch(10 80 33.98 / 1)"),
    c("stoke", "lch(10 80 21.15 / 1)"),
    c("sunderland", "lch(10 80 38.12 / 1)"),
    c("swansea", "lch(10 80 356.63 / 1)"),
    c("tottenham", "lch(10 80 284.71 / 1)"),
    c("watford", "lch(10 80 44.62 / 1)"),
    c("west-brom", "lch(10 80 291.41 / 1)"),
    c("west-ham", "lch(10 80 18.89 / 1)"),
    c("wigan", "lch(10 80 261.98 / 1)"),
    c("wimbledon", "lch(10 80 88.5 / 1)"),
    c("wolves", "lch(10 80 79.86 / 1)")
  ),
  label = c(
    "Arsenal", "Aston Villa", "Barnsley", "Birmingham", "Blackburn",
    "Blackpool", "Bolton", "Bournemouth", "Bradford", "Brentford",
    "Brighton", "Burnley", "Cardiff", "Charlton", "Chelsea",
    "Coventry", "Crystal Palace", "Derby", "Everton", "Fulham",
    "Huddersfield", "Hull", "Ipswich", "Leeds", "Leicester",
    "Liverpool", "Man City", "Man United", "Middlesbrough", "Newcastle",
    "Norwich", "Nottingham Forest", "Portsmouth", "QPR", "Reading",
    "Sheffield United", "Sheffield Weds", "Southampton", "Stoke", "Sunderland",
    "Swansea", "Tottenham", "Watford", "West Brom", "West Ham",
    "Wigan", "Wimbledon", "Wolves"
  )
)

## Saves a tibble with teams names and their pages names
quartoList <- selectopts |> 
  dplyr::mutate(value = purrr::map_chr(value, ~.[1])) |> 
  dplyr::rename("team" = "label", "filename" = "value")
saveRDS(quartoList, "data/quartoList.RDS")

## Extracts the teams id's
buildlist <- selectopts$value |> purrr::map_chr(~.[1])

## Creates a matrix of JS objects
selectopts <- selectopts |> jsonlite::toJSON(pretty = TRUE)

## Adds a "var" declaration (global variable)
selectopts <- glue::glue("// Selection menu list
                         var selectopts = {selectopts}")

## Creates a matrix of JS objects
buildlist <- buildlist |> jsonlite::toJSON(pretty = TRUE)

## Adds a "var" declaration (global variable)
buildlist <- glue::glue("// List of elements for #container
                         var teams = {buildlist}")

## Joins all matrices into one JS string
alldata <- glue::glue_collapse(c(selectopts, buildlist),
                               sep = "\n\n")

## Writes the JS file
fileConn <- file("www/js/dataset.js")
writeLines(alldata, fileConn)
close(fileConn)
