
# Example data without milligrams
example_drug_data <- data.frame(
  drug_name = c(
    "Aspirin",
    "Paracetamol",
    "Ibuprofen",
    "Cetirizine",
    "Lisinopril",
    "Metformin",
    "Atorvastatin",
    "Omeprazole",
    "Salbutamol",
    "Amoxicillin"
  )
)


usethis::use_data(example_drug_data, overwrite = TRUE)
