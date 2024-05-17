get_incubation_category <- function(netting_data) {
  netting_data |>
    dplyr::mutate("incubation_category" = 1)
}
