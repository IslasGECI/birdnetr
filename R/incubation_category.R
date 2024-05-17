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

barchart_incubation_categories <- function(assp_individual_per_category, year) {
  plt <- ggplot2::ggplot(assp_individual_per_category, ggplot2::aes(fill = incubation_category, y = number_of_individuals, x = Month)) +
    ggplot2::geom_bar(position = "fill", stat = "identity") +
    ggplot2::ylab("Proportion of individuals") +
    ggplot2::ggtitle(year) +
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
  ggplot2::ggsave("prueba.png", bg = "transparent")
  ggplot2::ggplot_build(plt)
}
