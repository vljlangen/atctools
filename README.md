
# atctools

`atctools` is an R package designed for facilitating Anatomical Therapeutic Chemical (ATC) matching and ensuring the integrity of ATC data in pharmaceutical datasets.

## Features

- **ATC Matching**: Functions to match drug names to ATC codes using methods such as Levenshtein distance.
  
- **ATC Data Integrity Checks**: Tools to verify the consistency and correctness of ATC data.

# Example usage of ATC matching function

The `drug_match` function in `atctools` is useful for matching drug names to ATC codes.

```r
# Load the package
library(atctools)

# Example data with drug names
input_data <- data.frame(drug_name = c("Aspirin", "Paracetamol", "Ibuprofen"))

# Reference data containing ATC codes and corresponding drug names
reference_data <- list(ATC_codes = c("N02BA01", "N02BE01", "N02AA02"), 

# Perform drug matching
drug_names = c("aspirin", "paracetamol", "ibuprofen"))

# View the processed output
output_data <- drug_match(input_data, "drug_name", reference_data)

```

# Example usage of ATC matching function with trailing milligrams stripping

The `drug_match_strip` function in `atctools` is useful for matching drug names to ATC codes while stripping specific trailing characters, such as "milligrams". This can be particularly helpful when dealing with pharmaceutical data where drug names may include dosage information that needs to be normalized.

```r
# Load the package
library(atctools)

# Example data with drug names including dosage information
input_data <- data.frame(drug_name = c("Aspirin 100mg", "Paracetamol 500mg", "Ibuprofen 200mg"))

# Reference data containing ATC codes and corresponding drug names
reference_data <- list(ATC_codes = c("N02BA01", "N02BE01", "N02AA02"), drug_names = c("aspirin", "paracetamol", "ibuprofen"))

# Perform drug matching with trailing milligrams stripping
output_data_stripped <- drug_match_strip(input_data, "drug_name", reference_data)

# View the processed output
output_data_stripped
```


## Installation

You can install the development version of atctools from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("vljlangen/atctools")
```

