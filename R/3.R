library("tidyverse")
data_input <- base::readLines("./data/3.input")


# Function ----------------------------------------------------------------


calculate_position <- function(string_data) {
  x <- (stringr::str_count(string = string_data, pattern = "\\^") - stringr::str_count(string = string_data, pattern = "v")) |>
    base::as.character()
  y <- (stringr::str_count(string = string_data, pattern = ">") - stringr::str_count(string = string_data, pattern = "<")) |>
    base::as.character()
  return(base::paste(x, "!", y))
}


# Part 1 ------------------------------------------------------------------



vectorize_data_input <- data_input |>
  (\(x) stringr::str_split_1(string = x, pattern = ""))()
c(1:base::length(vectorize_data_input)) |>
  base::sapply(FUN = (\(x) vectorize_data_input[1:x])) |>
  base::paste() |>
  calculate_position() |>
  base::unique() |>
  base::length()



# Partie 2 ----------------------------------------------------------------
vectorize_data_input_first <- vectorize_data_input[base::seq(1, base::length(vectorize_data_input), by = 2)]
vectorize_data_input_second <- vectorize_data_input[base::seq(2, base::length(vectorize_data_input), by = 2)]

first_set <- c(seq(1, base::length(vectorize_data_input_first))) |>
  base::sapply(FUN = (\(x) vectorize_data_input_first[1:x])) |>
  base::paste() |>
  calculate_position() |>
  base::unique()
c(seq(1, base::length(vectorize_data_input_second))) |>
  base::sapply(FUN = (\(x) vectorize_data_input_second[1:x])) |>
  base::paste() |>
  calculate_position() |>
  base::unique() |>
  base::union(x = , y = first_set) |>
  base::unique() |>
  base::length()
