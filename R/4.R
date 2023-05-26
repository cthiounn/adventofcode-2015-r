library(openssl)

puzzle_input <- "ckczppom"

# Partie 1 ----------------------------------------------------------------

c(1:1e+06) |>
  base::as.character() |>
  (\(x) base::paste0(puzzle_input, x))() |>
  openssl::md5() |>
  base::grepl(pattern = "^00000") |>
  base::which()


# Partie 2 ----------------------------------------------------------------


c(1:1e+07) |>
  base::as.character() |>
  (\(x) base::paste0(puzzle_input, x))() |>
  openssl::md5() |>
  base::grepl(pattern = "^000000") |>
  base::which() |>
  base::min()
