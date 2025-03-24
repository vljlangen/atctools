## Example test data: `example_atc_data_for_validation` dataset

example_atc_data_for_validation <- data.frame(
  ID = 1:5,
  atc_1 = c("B01AC06", "N02BE01", "FAKETC", "WRONG01", "Z99ZZ99"),  # 2 valid, 3 fake
  atc_2 = c("C10AA05", "M01AE01", "NOPE123", "XXXXX01", "J01CA04")  # 3 valid, 2 fake
)

usethis::use_data(example_atc_data_for_validation, overwrite = TRUE)
