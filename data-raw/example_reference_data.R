## code to prepare `example_reference_data` dataset goes here

# Example reference data with ATC codes for drugs as a data.frame
example_reference_data <- data.frame(
  drug_name = c(
    "aspirin",
    "paracetamol",
    "ibuprofen",
    "cetirizine",
    "lisinopril",
    "metformin",
    "atorvastatin",
    "omeprazole",
    "salbutamol",
    "amoxicillin"
  ),
  ATC_code = c(
    "B01AC06",  # Aspirin
    "N02BE01",  # Paracetamol
    "M01AE01",  # Ibuprofen
    "R06AE07",  # Cetirizine
    "C09AA03",  # Lisinopril
    "A10BA02",  # Metformin
    "C10AA05",  # Atorvastatin
    "A02BC01",  # Omeprazole
    "R03AC02",  # Salbutamol
    "J01CA04"   # Amoxicillin
  )
)

usethis::use_data(example_reference_data, overwrite = TRUE)
