drug_match <- function(input_data, drug_column, reference_data) {

  # Load dplyr
  library(dplyr)

  # Function to find the closest match using Levenshtein distance
  find_closest_match <- function(target, candidates) {
    distances <- stringdist::stringdistmatrix(target, candidates, method = "lv")
    closest_index <- which.min(distances)
    closest_value <- candidates[closest_index]
    return(closest_value)
  }

  # Create new variable without stripping drug names
  original_column <- paste0(drug_column, "_original")

  # Convert drug names to lower case
  input_data[[original_column]] <- tolower(input_data[[drug_column]])

  # Convert "." or "" to NA
  input_data[[original_column]] <- ifelse(input_data[[original_column]] %in% c(".", ""), NA, input_data[[original_column]])

  # Initialize new columns for ATC and matched
  input_data[[paste0(drug_column, "_ATC")]] <- NA
  input_data[[paste0(drug_column, "_matched")]] <- NA

  # Create new variables using Levenshtein distances for original drug names
  for (i in 1:nrow(input_data)) {
    original_value <- input_data[[original_column]][i]

    # Skip processing if original_value is NA
    if (is.na(original_value)) {
      input_data[[paste0(drug_column, "_ATC")]][i] <- NA
      input_data[[paste0(drug_column, "_matched")]][i] <- NA
    } else {
      closest_match <- find_closest_match(original_value, reference_data[[1]])

      input_data[[paste0(drug_column, "_ATC")]][i] <-
        reference_data[[2]][which.max(reference_data[[1]] == closest_match)]

      input_data[[paste0(drug_column, "_matched")]][i] <- closest_match
    }

    # Create flag variable
    flag <- ifelse(substr(original_value, 1, 3) != substr(input_data[[paste0(drug_column, "_matched")]][i], 1, 3), 1, 0)
    input_data[[paste0(drug_column, "_flag")]][i] <- flag
  }

  # Relocate the columns after creating them
  input_data <- input_data %>%
    relocate(
      !!original_column,
      !!paste0(drug_column, "_matched"),
      !!paste0(drug_column, "_flag"),
      !!paste0(drug_column, "_ATC"),
      .after = !!sym(drug_column)
    )

  return(input_data)
}
