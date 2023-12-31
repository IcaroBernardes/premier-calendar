# 0. Initial setup ###########
## Loads libraries
library(dplyr)
library(glue)
library(httr)
library(lubridate)
library(purrr)
library(readr)
library(stringr)

## Defines the base url (from Globo Esporte's API)
url_base <- "https://api.globoesporte.globo.com/tabela/c33769be-62ec-43c6-a633-8c826e14a696/fase/fase-unica-campeonato-ingles-2022-2023/rodada/"

# 1. Scrapping data ###########
## Defines a function for the extraction
scrapper <- function(week) {
  
  ### Waits 3s before starting
  Sys.sleep(3)
  
  ### Defines the url to which make the request
  url = glue::glue("{url_base}/{week}/jogos/")
  
  ### Makes the request
  resp = httr::GET(url)
  
  ### Gets the contents
  data = httr::content(resp)
  
  ### Mounts the tibble
  data = data |> 
    purrr::map(function(x) {
      
      dplyr::tibble(
        season = "2022-23",
        day = x$data_realizacao,
        home = x$equipes$mandante$nome_popular,
        away = x$equipes$visitante$nome_popular, 
        homeGoals = x$placar_oficial_mandante,
        awayGoals = x$placar_oficial_visitante,
        winner = case_when(homeGoals > awayGoals ~ "H",
                           awayGoals > homeGoals ~ "A",
                           homeGoals == awayGoals ~ "D",
                           TRUE ~ NA)
      )
      
    }) |> 
    purrr::list_rbind()
  
  ## Simplifies the day column
  data = data |> 
    dplyr::mutate(day = lubridate::ymd_hm(day),
                  day = lubridate::floor_date(day, unit = "day"))
  
}

## Applies the function for all weeks
scrapped2022Data <- 1:38 |> 
  purrr::map(scrapper) |> 
  purrr::list_rbind()

## Renames some teams
replacements <- c("Leeds United" = "Leeds",
                  "Manchester City" = "Man City",
                  "Manchester United" = "Man United",
                  "Nottingham Forest" = "Nott'm Forest",
                  "Wolverhampton" = "Wolves")
scrapped2022Data <- scrapped2022Data |> 
  dplyr::mutate(across(.cols = c("home", "away"),
                       .fns = ~stringr::str_replace_all(., replacements)))

## Saves the data
readr::write_csv(scrapped2022Data, "data/scrapped2022Data.csv")
