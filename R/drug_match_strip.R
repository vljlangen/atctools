#' Perform Drug Matching with Stripping Trailing Characters
#'
#' This function matches drug names in the input data frame to corresponding ATC
#' codes using a reference data frame, with stripping trailing characters such as "mg", "g", etc.
#'
#' @param input_data A data frame containing a column of drug names to be matched.
#' @param drug_column The name of the column in \code{input_data} containing drug names.
#' @param reference_data A data frame or list with two elements:
#'                       - \code{ATC_codes}: A character vector of ATC codes.
#'                       - \code{drug_names}: A character vector of corresponding drug names.
#'
#' @return A modified data frame with additional columns:
#'   \describe{
#'     \item{drug_name_ATC}{ATC code matched to each drug name.}
#'     \item{drug_name_matched}{Closest matching drug name from reference data.}
#'     \item{drug_name_flag}{Flag indicating mismatch (1) or match (0) between drug name and ATC code prefix.}
#'   }
#' @export
#'
#' @import dplyr
#' @importFrom stringdist stringdistmatrix
#'
#' @examples
#' # Example usage:
#' data(example_drug_data_with_mg)
#' data(example_reference_data)
#' output_data <- drug_match_strip(example_drug_data_with_mg, "drug_name", example_reference_data)
drug_match_strip <- function(input_data, drug_column, reference_data) {

  # Load dplyr
  library(dplyr)

  # Function to find the closest match using Levenshtein distance
  find_closest_match <- function(target, candidates) {
    distances <- stringdist::stringdistmatrix(target, candidates, method = "lv")
    closest_index <- which.min(distances)
    closest_value <- candidates[closest_index]
    return(closest_value)
  }

  # Create new variable with stripped drug names
  stripped_column <- paste0(drug_column, "_stripped")

  # Remove exactly specified trailing characters
  input_data[[stripped_column]] <- gsub("mg$", "", input_data[[drug_column]])        # "mg"
  input_data[[stripped_column]] <- gsub("\\s+$", "", input_data[[stripped_column]])  # spaces
  input_data[[stripped_column]] <- gsub("\\d+$", "", input_data[[stripped_column]])  # numbers
  input_data[[stripped_column]] <- gsub("\\s+$", "", input_data[[stripped_column]])  # spaces
  input_data[[stripped_column]] <- gsub("g$", "", input_data[[stripped_column]])     # g (grams)
  input_data[[stripped_column]] <- gsub("\\s+$", "", input_data[[stripped_column]])  # spaces
  input_data[[stripped_column]] <- gsub(",$", "", input_data[[stripped_column]])     # commas (,)
  input_data[[stripped_column]] <- gsub("\\d+$", "", input_data[[stripped_column]])  # numbers
  input_data[[stripped_column]] <- gsub("mikro$", "", input_data[[stripped_column]]) # mikro
  input_data[[stripped_column]] <- gsub("\\d+$", "", input_data[[stripped_column]])  # numbers
  input_data[[stripped_column]] <- gsub("\\s+$", "", input_data[[stripped_column]])  # spaces
  input_data[[stripped_column]] <- gsub("\\d+$", "", input_data[[stripped_column]])  # numbers
  input_data[[stripped_column]] <- gsub("/$", "", input_data[[stripped_column]])     # /
  input_data[[stripped_column]] <- gsub("\\s+$", "", input_data[[stripped_column]])  # spaces
  input_data[[stripped_column]] <- gsub("\\d+$", "", input_data[[stripped_column]])  # numbers
  input_data[[stripped_column]] <- gsub("silmätippa$", "", input_data[[stripped_column]])
  input_data[[stripped_column]] <- gsub("\\s+$", "", input_data[[stripped_column]])

  # Erase any residual numbers from any position of the character
  input_data[[stripped_column]] <- gsub("\\d", "", input_data[[stripped_column]])

  # Convert to lower case
  input_data[[stripped_column]] <- tolower(input_data[[stripped_column]])

  # If missing data is coded with "." convert it to NA
  input_data[[stripped_column]] <- ifelse(input_data[[stripped_column]] == ".", NA, input_data[[stripped_column]])

  # Create new variables using Levenshtein distances for stripped drug names
  for (i in 1:nrow(input_data)) {
    stripped_value <- input_data[[stripped_column]][i]
    closest_match <- find_closest_match(stripped_value, reference_data[[1]])

    # Check if stripped_value is NA, if yes, assign NA to _ATC and _matched columns
    if (is.na(stripped_value)) {
      input_data[[paste0(drug_column, "_ATC")]][i] <- NA
      input_data[[paste0(drug_column, "_matched")]][i] <- NA
    } else {
      input_data[[paste0(drug_column, "_ATC")]][i] <-
        reference_data[[2]][which.max(reference_data[[1]] == closest_match)]

      input_data[[paste0(drug_column, "_matched")]][i] <- closest_match
    }

    # Create flag variable
    flag <- ifelse(substr(stripped_value, 1, 3) != substr(input_data[[paste0(drug_column, "_matched")]][i], 1, 3), 1, 0)
    input_data[[paste0(drug_column, "_flag")]][i] <- flag
  }

  # Relocate the columns after creating them
  input_data <- input_data %>%
    relocate(
      !!stripped_column,
      !!paste0(drug_column, "_matched"),
      !!paste0(drug_column, "_flag"),
      !!paste0(drug_column, "_ATC"),
      .after = !!sym(drug_column)
    )

  return(input_data)
}
