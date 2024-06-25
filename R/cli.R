#' @export
plot_incubation_categories_proportion <- function(arguments) {
  netting_data_path <- arguments[["input_data"]]
  years_of_interest <- c(2021, 2022)
  year <- as.character(years_of_interest)
  output_path <- arguments[["output_path"]]
  netting_data <- readr::read_csv(netting_data_path, show_col_types = FALSE)
  data_for_plot <- setup_data_for_incubation_categories_barchart(netting_data, year)
  barchart_incubation_categories(data_for_plot)
  ggplot2::ggsave(output_path, bg = "transparent")
}

#' @export
maximum_cpue_timeseries_for_assp <- function(arguments) {
  cpue_data <- readr::read_csv(arguments[["cpue-per-day-path"]], show_col_types = FALSE)
  cpue_timeseries <- maximum_cpue_by_year_for_assp(cpue_data)
  readr::write_csv(cpue_timeseries, arguments[["max-cpue-timeseries-path"]])
}
