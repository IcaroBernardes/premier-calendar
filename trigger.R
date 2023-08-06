# 0. Initial setup  ##########
## Loads the packages
library(dplyr)
library(purrr)
library(quarto)

## Gets the teams names and their pages names
teams <- readRDS("data/quartoList.RDS")

## Adds a line for the tutorial page
teams <- teams |> 
  dplyr::add_row(filename = "team1", team = "team1")

# 1. HTML production ##########
## Generates an HTML for each team
purrr::pwalk(teams, function(filename, team) {
  quarto::quarto_render(
    input = "generator.qmd",
    execute_params = list(team = team),
    output_file = glue::glue("{filename}.html")
  )
})
