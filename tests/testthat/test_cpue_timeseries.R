describe("Write CPUE time series", {
  cpue_data <- tibble::tibble(
    Temporada = c(rep(2010, 2), rep(2011, 2), rep(2013, 2)),
    CPUE_total = c(0, 1, 2, 3, 4, 5),
    Especie = c(rep("Hydrobates", 3), rep("Melania", 2), "Hydrobates")
  )
  it("select maximum cpue by year", {
    maximum_cpue_by_year(cpue_data)
  })
})
