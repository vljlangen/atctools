# atctools

`atctools` is an R package designed for facilitating Anatomical Therapeutic Chemical (ATC) matching and ensuring the integrity of ATC data in pharmaceutical datasets.

## Features

- **ATC Matching**: Functions to match drug names to ATC codes using methods such as Levenshtein distance.
- **ATC Code Matching**: Functions to match ATC codes to drug names directly.
- **ATC Data Integrity Checks**: Tools to verify the **structure** and **validity** of ATC codes using a reference list.

## Example Usage of ATC Matching Functions

### 1. `drug_match()`

Matches drug names to ATC codes **without** stripping trailing characters like "mg", "g", etc.

```r
library(atctools)

output_data <- drug_match(example_drug_data, "drug_name", example_reference_data)
output_data
```

### 2. `drug_match_strip()`

Matches drug names to ATC codes **with** trailing characters stripped.

```r
output_data_stripped <- drug_match_strip(example_drug_data_with_mg, "drug_name", example_reference_data)
output_data_stripped
```

### 3. `atc2drug()`

Matches ATC codes back to drug names directly (no fuzzy matching).

```r
output_data_atc2drug <- atc2drug(example_atc_data, "ATC_code", example_reference_data)
output_data_atc2drug
```

## 🔍 ATC Validation Functions

### 4. `validate_atc()`

Checks if ATC codes follow the correct structural format (length, character pattern).

```r
validate_output <- validate_atc(example_atc_data_for_validation, "atc_1")
validate_output
```

### 5. `validate_atc_by_reference()`

Checks if ATC codes exist in a given reference list (e.g., WHO ATC index or your validated dataset).

```r
validate_by_ref_output <- validate_atc_by_reference(example_atc_data_for_validation, "atc_2", example_reference_data)
validate_by_ref_output
```

### Combining Format and Reference Validation

```r
output_combined <- example_atc_data_for_validation %>%
  validate_atc("atc_1") %>%
  validate_atc_by_reference("atc_2", example_reference_data)

output_combined
```

- `atc_1_invalid`: Flag for invalid format (1 = invalid, 0 = valid)
- `atc_2_invalid`: Flag for "not found in reference list" (1 = not found, 0 = found)

## Example Datasets

### `example_drug_data`

Drug names **without** milligrams.

```r
example_drug_data
```

### `example_drug_data_with_mg`

Drug names **with** trailing milligrams (e.g., `"paracetamol 500mg"`).

```r
example_drug_data_with_mg
```

### `example_atc_data`

ATC codes for testing `atc2drug()` – includes valid, invalid, and `NA`.

```r
example_atc_data
```

### `example_reference_data`

Reference dataset for drug name ↔ ATC code matching.

```r
example_reference_data
```

### `example_atc_data_for_validation`

New! Contains ATC codes across two columns for testing both **structural** and **reference-based** validation.

```r
example_atc_data_for_validation
```

## Explanation of `drug_name_flag` Column

The `drug_name_flag` column appears in outputs from `drug_match()` and `drug_match_strip()`.

- **0**: First 3 characters of drug name match the first 3 of matched ATC code.
- **1**: Mismatch detected between drug name and ATC prefix.

## Installation

Install the development version from GitHub:

```r
# install.packages("devtools")
devtools::install_github("vljlangen/atctools")
```

## Key Updates

- ✅ **New validation functions**:
  - `validate_atc()` checks format validity.
  - `validate_atc_by_reference()` checks presence in reference data.

- 🧪 **New dataset**: `example_atc_data_for_validation` to support validation testing.

- 🔁 Updated function examples and documentation to include validation workflow.

- 🧹 Minor improvements to `atc2drug()` for better column detection.
