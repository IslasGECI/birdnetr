#' @export
get_domain_specific_options <- function() {
  data_path <- geci.optparse::character_option(c("-i", "--input_data"), default = "/workdir/", help = "File input")
  output_path <- geci.optparse::character_option(c("-o", "--output_path"), default = "/workdir/", help = "File output")
  option_names <- c(data_path, output_path)
  geci.optparse::get_options_from_vec(option_names)
}
