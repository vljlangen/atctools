# Example test data for atc2drug

example_atc_data <- data.frame(
  ATC_code = c("B01AC06", "N02BE01", NA, "M01AE01", "R06AE07",
               "ABCDE12345", "abcde12345", NA),
  stringsAsFactors = FALSE
)

usethis::use_data(example_atc_data, overwrite = TRUE)
