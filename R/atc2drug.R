#' Match ATC Codes to Drug Names
#'
#' This function matches ATC codes in the input data frame to corresponding drug
#' names using a reference data frame.
#' \cr
#' \cr
#' The reference data frame must have drug names in the first column and ATC codes in the second column.
#'
#' @param input_data A data frame containing a column of ATC codes to be matched.
#' @param atc_column The name of the column in \code{input_data} containing ATC codes.
#' @param reference_data A data frame with drug names in the first column and corresponding ATC codes in the second column.
#'
#' @return A modified data frame with an additional column:
#'   \describe{
#'     \item{atc_code_drug}{Drug name matched to each ATC code.}
#'   }
#' @export
#'
#' @import dplyr
#'
#' @examples
#' # Example usage:
#' data(example_atc_data)
#' data(example_reference_data)
#' atc2drug(example_atc_data, "ATC_code", example_reference_data)
atc2drug <- function(input_data, atc_column, reference_data) {

  # Load dplyr
  library(dplyr)

  # Initialize new column for drug names
  input_data[[paste0(atc_column, "_drug")]] <- NA

  # Match ATC codes directly
  for (i in 1:nrow(input_data)) {
    original_value <- input_data[[atc_column]][i]

    # Skip processing if original_value is NA
    if (!is.na(original_value)) {
      match_index <- match(original_value, reference_data[[2]])
      if (!is.na(match_index)) {
        input_data[[paste0(atc_column, "_drug")]][i] <- reference_data[[1]][match_index]
      }
    }
  }

  # Relocate the columns after creating them
  input_data <- input_data %>%
    relocate(
      !!paste0(atc_column, "_drug"),
      .after = !!sym(atc_column)
    )

  return(input_data)
}
