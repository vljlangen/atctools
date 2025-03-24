#' ATC Code Validation for a Single Column
#'
#' This function validates the ATC code in a specified column of a data frame.
#' It checks the structure and length of the ATC code, ensuring it follows
#' the standard format (5 or 7 characters long) and returns an additional
#' column indicating whether the code is valid (0) or invalid (1).
#'
#' @param input_data A data frame containing the ATC code column to be validated.
#' @param atc_column The name of the column in \code{input_data} containing ATC codes.
#'
#' @return A modified data frame with an additional column:
#'   \describe{
#'     \item{atc_column_invalid}{Flag indicating whether the ATC code is valid (0) or invalid (1).}
#'   }
#'
#' @export
#'
#' @import dplyr
#'
#' @examples
#' # Example usage:
#' data(example_atc_data_for_validation)
#' validate_atc(example_atc_data_for_validation, "atc_1")

validate_atc <- function(input_data, atc_column) {

  # Define ATC structural pattern (accept both 5 and 7 character codes)
  atc_pattern <- "^[A-Z]{1}[0-9]{2}[A-Z]{2}$|^[A-Z]{1}[0-9]{2}[A-Z]{2}[0-9]{2}$"

  # Validate both structure and length (5 or 7 characters long)
  input_data[[paste0(atc_column, "_invalid")]] <- ifelse(
    is.na(input_data[[atc_column]]) |
      !grepl(atc_pattern, toupper(input_data[[atc_column]])) |
      !(nchar(input_data[[atc_column]]) %in% c(5, 7)),
    1, # Invalid if the code is not valid or its length is not 5 or 7
    0  # Valid if it's structurally correct and the length is 5 or 7
  )

  # Relocate the invalid_atc flag next to the original ATC column
  input_data <- dplyr::relocate(
    input_data,
    !!paste0(atc_column, "_invalid"),
    .after = !!sym(atc_column)
  )

  return(input_data)
}
