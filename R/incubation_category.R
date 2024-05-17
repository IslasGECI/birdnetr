get_incubation_category <- function(netting_data) {
  raw_categories <- c(0, 1, 1.5, 2, 3, 4, 4.5, 5)
  new_categories <- c(1, 2, 2, 3, 3, 4, 4, 1)
  maped <- plyr::mapvalues(netting_data[["Puntuacion_parche_incubacion"]], from = raw_categories, to = new_categories)
  netting_data |>
    dplyr::mutate("incubation_category" = maped)
}
