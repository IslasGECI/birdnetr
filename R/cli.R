#' @export
plot_incubation_categories_proportion <- function(arguments) {
  netting_data_path <- arguments[["input_data"]]
  year <- as.character(arguments[["year"]])
  output_path <- arguments[["output_path"]]
  netting_data <- readr::read_csv(netting_data_path, show_col_types = FALSE)
  data_for_plot <- setup_data_for_incubation_categories_barchart(netting_data, year)
  barchart_incubation_categories(data_for_plot, year)
  ggplot2::ggsave(output_path, bg = "transparent")
}
