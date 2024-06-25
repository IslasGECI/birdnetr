describe("Write CPUE time series", {
  cpue_data <- tibble::tibble(
    Temporada = c(rep(2010, 2), rep(2011, 2), rep(2013, 2)),
    CPUE_total = c(0, 1, 2, 3, 4, 5),
    Especie = c(rep("Hydrobates homochroa", 3), rep("Hydrobates", 2), "Hydrobates homochroa")
  )
  it("select maximum cpue by year", {
    obtained <- maximum_cpue_by_year(cpue_data)
    obtained_rows <- nrow(obtained)
    expected_rows <- 3
    expect_equal(obtained_rows, expected_rows)
  })
})
