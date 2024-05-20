describe("Plot incubation categories", {
  it("Test plot properties", {
    assp_individual_per_category <- tibble::tibble(
      Month = c(rep("Apr", 2), rep("May", 2)),
      number_of_individuals = c(3, 7, 15, 2),
      incubation_category = c("1", "5", "3", "5"),
    )
    year <- 2021
    obtained <- barchart_incubation_categories(assp_individual_per_category, year)
    expected_x <- "Month"
    expect_equal(obtained$plot$labels$x[[1]], expected_x)
    expected_y <- "Proportion of individuals"
    expect_equal(obtained$plot$labels$y[[1]], expected_y)
    expected_title <- 2021
    expect_equal(obtained$plot$labels$title[[1]], expected_title)
    expected_background <- "transparent"
    expect_equal(obtained$plot$theme$panel.background[[1]], expected_background)
    expect_equal(obtained$plot$theme$plot.title$face, "bold")
  })
})


describe("Plot incubation categories", {
  netting_data_with_category <- tibble::tibble(
    Fecha = c("2020-04-12", "2021-04-01", "2020-05-08", "2020-05-13", "2020-05-21", "2020-04-07"),
    incubation_category = c("1", "1", "5", "4", "3", "2"),
  )
  it("Test plot properties", {
    obtained <- summarize_by_category_and_month(netting_data_with_category)

    expect_true("Month" %in% names(obtained))
    obtained_month <- obtained[[1, "Month"]]
    expect_equal(obtained_month, "Apr")

    expect_true("number_of_individuals" %in% names(obtained))

    expected_nrows <- 5
    expect_equal(nrow(obtained), expected_nrows)
  })
  it("filter by year", {
    year <- 2020
    obtained <- filter_by_year(netting_data_with_category, year)
    expected_rows <- 5
    expect_equal(nrow(obtained), expected_rows)
  })
})

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
    expected_categories <- c("1", "2", "2", "3", "3", "4", "4", "1")
    expect_equal(obtained[["incubation_category"]], expected_categories)
  })
  it("Categorizes rows", {
    netting_dirty_data <- tibble::tibble(Puntuacion_parche_incubacion = c(5, 3, NA, 2, 3, NA, 4.5, 5))
    obtained <- get_incubation_category(netting_dirty_data)
    expect_equal(nrow(obtained), nrow(netting_dirty_data) - 2)
  })
})
