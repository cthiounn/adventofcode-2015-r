library("tidyverse")
library("gtools")
data_input <- base::readLines("./data/2.input")

sum_add_min <- function(v) {
  2 * base::sum(v) + base::min(v)
}
calculate_permutation_sum <- function(v) {
  sum_add_min((\(x) x[, 1] * x[, 2])(gtools::combinations(3, 2, v, set = FALSE, repeats.allowed = FALSE)))
}

data_input |>
  stringr::str_split(pattern = "x") |>
  base::lapply(FUN = base::as.integer) |>
  base::sapply(FUN = calculate_permutation_sum) |>
  base::sum()

prod_add_two_min_2min <- function(v) {
  base::prod(v) + 2 * (dplyr::nth(v, 1) + dplyr::nth(v, 2))
}

data_input |>
  stringr::str_split(pattern = "x") |>
  base::lapply(FUN = base::as.integer) |>
  base::lapply(FUN = base::sort) |>
  base::sapply(FUN = prod_add_two_min_2min) |>
  base::sum()
