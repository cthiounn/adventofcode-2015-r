library("tidyverse")
data_input <- base::readLines("./data/5.input")


# Function ----------------------------------------------------------------

is_free_of_forbidden_string <- function(var_string) {
  !base::grepl(x = var_string, pattern = "(ab|cd|pq|xy)", perl = T)
}

contains_three_vowels <- function(var_string) {
  base::grepl(x = var_string, pattern = ".*(a|e|i|o|u).*(a|e|i|o|u).*(a|e|i|o|u).*")
}

contains_double_consecutive_char <- function(var_string) {
  base::grepl(x = var_string, pattern = "([a-z])\\1", perl = T)
}


is_nice_string <- function(var_string) {
  is_free_of_forbidden_string(var_string) & contains_three_vowels(var_string) & contains_double_consecutive_char(var_string)
}


contains_double_char_with_char_inside <- function(var_string) {
  base::grepl(x = var_string, pattern = "([a-z]).\\1", perl = T)
}

contains_double_char_repeated_outside <- function(var_string) {
  base::grepl(x = var_string, pattern = "(.*[a-z][a-z]).*\\1.*", perl = T)
}

is_nice_string_new <- function(var_string) {
  contains_double_char_with_char_inside(var_string) & contains_double_char_repeated_outside(var_string)
}
# Part 1 ------------------------------------------------------------------

data_input |>
  is_nice_string() |>
  base::sum()

# Partie 2 ----------------------------------------------------------------

data_input |>
  is_nice_string_new() |>
  base::sum()
