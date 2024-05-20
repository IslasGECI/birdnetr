describe("Cli for module", {
  it("plot incubation categories proportion", {
    arguments <- list(input_data = "/workdir/tests/data/raw_redeo_iso8601.csv", year = 2022, output_path = "/workdir/tests/data/histograma_incubacion.png")
    testtools::delete_output_file(arguments["output_path"])
    plot_incubation_categories_proportion(arguments)
    testtools::exist_output_file(arguments["output_path"])
  })
})
