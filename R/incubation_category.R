setup_data_for_incubation_categories_barchart <- function(netting_data, year) {
  data_for_plot <- netting_data |>
    filter_by_year(year) |>
    filter_assp_species_in_todos_santos() |>
    get_incubation_category() |>
    summarize_by_category_and_month()
}

summarize_by_category_and_month <- function(netting_data_with_category) {
  months <- lubridate::month(netting_data_with_category$Fecha, label = TRUE)
  netting_data_with_category |>
    dplyr::mutate("Month" = months) |>
    dplyr::group_by(Month, incubation_category) |>
    dplyr::summarise(number_of_individuals = dplyr::n())
}

filter_by_year <- function(netting_data_with_category, year) {
  netting_data_with_category |>
    dplyr::filter(stringr::str_sub(Fecha, end = 4) %in% year)
}

get_incubation_category <- function(netting_data) {
  raw_categories <- c(0, 1, 1.5, 2, 3, 4, 4.5, 5)
  new_categories <- c("1", "2", "2", "3", "3", "4", "4", "1")
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

barchart_incubation_categories <- function(assp_individual_per_category) {
  summarized_data <- assp_individual_per_category |>
    dplyr::summarise(N = sum(number_of_individuals))
  labels_individual_per_month <- glue::glue("n = {summarized_data$N}")
  plt <- ggplot2::ggplot(assp_individual_per_category, ggplot2::aes(fill = incubation_category, y = number_of_individuals, x = Month)) +
    ggplot2::geom_bar(position = "fill", stat = "identity") +
    ggplot2::annotate("text", x = 1:(length(labels_individual_per_month)), y = -0.05, label = labels_individual_per_month) +
    ggplot2::ylab("Proportion of individuals") +
    ggplot2::labs(fill = "Patch") +
    ggplot2::theme_classic() +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5)) +
    ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(fill = "transparent"),
      plot.background = ggplot2::element_rect(fill = "transparent", colour = NA)
    ) +
    ggplot2::scale_fill_manual(values = c(
      "#99ccff",
      "#66cc99",
      "#339966",
      "#003399",
      "#6666cc"
    ))
  ggplot2::ggplot_build(plt)
}
