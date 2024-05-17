describe("filter rows of interest", {
  netting_data <- tibble::tibble(
    Especie = c("Hydrobates homochroa", "Pelecanus occidentalis", "Hydrobates melania", "Hydrobates homochroa"),
    Isla = c(rep("Todos Santos", 3), "Coronado")
  )
  it("Filter species of interest", {
    obtained <- filter_assp_species(netting_data)
    expected_len <- 2
    expect_equal(nrow(obtained), expected_len)
  })
  it("Filter by Island and species", {
    obtained <- filter_assp_species_in_todos_santos(netting_data)
    expected_len <- 1
    expect_equal(nrow(obtained), expected_len)
  })
})
describe("Obtain incubation categories", {
  it("Categorizes rows", {
    netting_data <- tibble::tibble(Puntuacion_parche_incubacion = c(0, 1, 1.5, 2, 3, 4, 4.5, 5))
    obtained <- get_incubation_category(netting_data)
    expected_categories <- c(1, 2, 2, 3, 3, 4, 4, 1)
    expect_equal(obtained[["incubation_category"]], expected_categories)
  })
  it("Categorizes rows", {
    netting_dirty_data <- tibble::tibble(Puntuacion_parche_incubacion = c(5, 3, NA, 2, 3, NA, 4.5, 5))
    obtained <- get_incubation_category(netting_dirty_data)
    expect_equal(nrow(obtained), nrow(netting_dirty_data) - 2)
  })
})
