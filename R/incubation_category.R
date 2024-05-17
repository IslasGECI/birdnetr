get_incubation_category <- function(netting_data) {
  raw_categories <- c(0, 1, 1.5, 2, 3, 4, 4.5, 5)
  new_categories <- c(1, 2, 2, 3, 3, 4, 4, 1)
  cleaned_netting_data <- netting_data |>
    dplyr::filter(!is.na(Puntuacion_parche_incubacion))
  maped <- plyr::mapvalues(cleaned_netting_data[["Puntuacion_parche_incubacion"]], from = raw_categories, to = new_categories)
  cleaned_netting_data |>
    dplyr::mutate("incubation_category" = maped)
}

filter_assp_species <- function(netting_data) {
  assp_name <- "Hydrobates homochroa"
  netting_data |> dplyr::filter(Especie == assp_name)
}

filter_assp_species_in_todos_santos <- function(netting_data) {
  island_name <- "Todos Santos"
  netting_data |>
    filter_assp_species() |>
    dplyr::filter(Isla == island_name)
}
