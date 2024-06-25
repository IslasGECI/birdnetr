maximum_cpue_by_year_for_assp <- function(cpue_data) {
  cpue_data |>
    dplyr::group_by(Temporada) |>
    dplyr::filter(Especie == "Hydrobates homochroa") |>
    dplyr::summarize(max_cpue = max(CPUE_total))
}
