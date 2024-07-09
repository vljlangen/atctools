
# atctools

`atctools` is an R package designed for facilitating Anatomical Therapeutic Chemical (ATC) matching and ensuring the integrity of ATC data in pharmaceutical datasets.

## Features

- **ATC Matching**: Functions to match drug names to ATC codes using methods such as Levenshtein distance.
  
- **ATC Code Matching**: Functions to match ATC codes to drug names directly.

- **ATC Data Integrity Checks**: Tools to verify the consistency and correctness of ATC data.


## Example Usage of ATC Matching Functions

### 1. `drug_match`

The `drug_match` function in `atctools` is useful for matching drug names to ATC codes without stripping trailing characters.

```r
# Load the package
library(atctools)

# Perform drug matching
output_data <- drug_match(example_drug_data, "drug_name", reference_data)

# View the processed output
output_data

```

### 2. `drug_match_strip`

The `drug_match_strip` function in `atctools` is useful for matching drug names to ATC codes while stripping specific trailing characters, such as "milligrams". This can be particularly helpful when dealing with pharmaceutical data where drug names may include dosage information that needs to be normalized.

```r
# Load the package
library(atctools)

# Perform drug matching with trailing milligrams stripping
output_data_stripped <- drug_match_strip(example_drug_data_with_mg, "drug_name", reference_data)

# View the processed output
output_data_stripped

```


### 3. `atc2drug`

The `atc2drug` function matches ATC codes to drug names directly without using Levenshtein distance.

```
# Load the package
library(atctools)

# Perform ATC code to drug name matching
output_data_atc2drug <- atc2drug(example_atc_data, "ATC_code", reference_data)

# View the processed output
output_data_atc2drug

```

## Example Datasets


### `example_drug_data`

This dataset contains example drug names without milligrams.

```
example_drug_data
```

### `example_drug_data_with_mg`

This dataset contains example drug names including milligrams.

```
example_drug_data_with_mg
```

### `example_reference_data`

This dataset is a reference dataset containing example drug names and corresponding ATC codes for drug matching. Please ensure that:

- The first column (in this example: `drug_name`) contains drug names.
- The second column (in this example: `ATC_code`) contains ATC codes.

```
example_reference_data
```

### `example_atc_data`

This dataset contains ATC codes for testing the `atc2drug` function, including both valid and non-valid ATC codes, as well as NA values.

```
example_atc_data
```



# Explanation of `drug_name_flag` Column

In the output data frame produced by the `drug_match` and `drug_match_strip` functions, the `drug_name_flag` column indicates whether there is a discrepancy between the stripped drug name used for matching and the closest matching drug name from the reference data. Specifically:

1. **Purpose**: The drug_name_flag column flags instances where the first three characters of the stripped drug name do not match the corresponding ATC code's initial characters. This helps identify potential mismatches or inconsistencies in drug naming conventions.

2. **Flag Values**:
   - **1**: Indicates a mismatch where the first three characters of the stripped drug name differ from the corresponding ATC code.
   - **0**: Indicates no mismatch; the first three characters of the stripped drug name match the corresponding ATC code.

## Installation

You can install the development version of atctools from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("vljlangen/atctools")
```

### Key Updates

1. **Added `atc2drug` Function**: This function matches ATC codes to drug names directly.

2. **Added `example_atc_data` Dataset**: This dataset includes ATC codes for testing the `atc2drug` function, with valid and non-valid entries along with `NA` values.

3. **Updated Examples**: Added example usage for the `atc2drug` function.

