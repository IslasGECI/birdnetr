describe("Cli for module", {
  it("plot incubation categories proportion", {
    arguments <- list(
      input_data = "/workdir/tests/data/raw_redeo_iso8601.csv",
      output_path = "/workdir/tests/data/histograma_incubacion.png"
    )
    testtools::delete_output_file(arguments[["output_path"]])
    plot_incubation_categories_proportion(arguments)
    expect_true(testtools::exist_output_file(arguments[["output_path"]]))
  })
  it("Maximum cpue by year for assp", {
    arguments <- list(
      "cpue-per-day-path" = "/workdir/tests/data/cpue_per_day_todos_santos_tests.csv",
      "max-cpue-timeseries-path" = "/workdir/tests/data/max_cpue_timeseries.csv"
    )
    testtools::delete_output_file(arguments[["max-cpue-timeseries-path"]])
    maximum_cpue_timeseries_for_assp(arguments)
    expect_true(testtools::exist_output_file(arguments[["max-cpue-timeseries-path"]]))
  })
})
