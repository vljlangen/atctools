## code to prepare `example_drug_data_with_mg` dataset goes here

# Example data with milligrams
example_drug_data_with_mg <- data.frame(
  drug_name = c(
    "Aspirin 100mg",
    "Paracetamol 500mg",
    "Ibuprofen 200mg",
    "Cetirizine 10mg",
    "Lisinopril 20mg",
    "Metformin 1000mg",
    "Atorvastatin 40mg",
    "Omeprazole 20mg",
    "Salbutamol 2mg",
    "Amoxicillin 500mg"
  )
)


usethis::use_data(example_drug_data_with_mg, overwrite = TRUE)
