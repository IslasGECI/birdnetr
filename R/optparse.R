#' @export
get_domain_specific_options <- function() {
  data_path <- geci.optparse::character_option(c("-i", "--input_data"), default = "/workdir/", help = "File input")
  output_path <- geci.optparse::character_option(c("-o", "--output_path"), default = "/workdir/", help = "File output")
  cpue_per_day_path <- geci.optparse::character_option(c("-c", "--cpue-per-day-path"), default = "/workdir/", help = "CPUE by day for all seasons path")
  max_cpue_timeseries_path <- geci.optparse::character_option(c("-m", "--max-cpue-timeseries-path"), default = "/workdir/", help = "Max CPUE timeseries path")
  option_names <- c(data_path, output_path, cpue_per_day_path, max_cpue_timeseries_path)
  geci.optparse::get_options_from_vec(option_names)
}
