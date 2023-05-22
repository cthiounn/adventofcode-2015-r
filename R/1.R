library("tidyverse")

data_input <- base::readLines("./data/1.input")

# Partie 1 -------------------------------------

data_input |>
  (\(.) {
    stringr::str_count(string = ., "\\(") - stringr::str_count(string = ., "\\)")
  })()

## Alternative magrittr
data_input %>%
  {
    stringr::str_count(string = ., "\\(") - stringr::str_count(string = ., "\\)")
  }

## Alternative vectorielle
data_input |>
  base::strsplit(x = , split = "") |>
  (\(x) x[[1]])() |>
  (\(x) dplyr::case_when(x == ")" ~ -1, x == "(" ~ 1, .default = 0))() |>
  base::sum()


# Partie 2 -------------------------------------

data_input |>
  base::strsplit(x = , split = "") |>
  (\(x) x[[1]])() |>
  (\(x) dplyr::case_when(x == ")" ~ -1, x == "(" ~ 1, .default = 0))() |>
  base::cumsum() |>
  (\(x) x == -1)() |>
  base::which.max()
