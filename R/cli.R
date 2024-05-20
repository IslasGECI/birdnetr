plot_incubation_categories_proportion <- function(arguments) {
  netting_data_path <- arguments[["input_data"]]
  year <- as.character(arguments[["year"]])
  output_path <- arguments[["output_path"]]
  netting_data <- readr::read_csv(netting_data_path, show_col_types = FALSE)
  data_for_plot <- netting_data |>
    filter_by_year(year) |>
    filter_assp_species_in_todos_santos() |>
    get_incubation_category() |>
    summarize_by_category_and_month()
  barchart_incubation_categories(data_for_plot, year)
  ggplot2::ggsave(output_path, bg = "transparent")
}
