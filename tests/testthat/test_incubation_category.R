describe("Obtain incubation categories", {
  it("Categorizes rows", {
    netting_data <- tibble::tibble(Puntuacion_parche_incubacion = c(0, 1, 1.5, 2, 3, 4, 4.5, 5))
    obtained <- get_incubation_category(netting_data)
    expected_first_category <- 1
    expect_equal(obtained[[1, "incubation_category"]], expected_first_category)
    expected_second_category <- 2
    expect_equal(obtained[[2, "incubation_category"]], expected_second_category)
  })
})
