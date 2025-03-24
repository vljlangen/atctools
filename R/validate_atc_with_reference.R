#' Validate ATC Codes Against a Reference List
#'
#' This function checks whether ATC codes in a given column exist in a reference list of valid ATC codes.
#'
#' @param input_data A data frame containing ATC codes.
#' @param atc_column The name of the column in \code{input_data} containing ATC codes.
#' @param reference_atc_codes A character vector of valid ATC codes.
#'
#' @return A data frame with an additional column indicating invalid ATC codes:
#'   \describe{
#'     \item{*_invalid}{1 if the ATC code is not in the reference list, 0 if it is.}
#'   }
#'
#' @export
#'
#' @examples
#' data(example_atc_data_for_validation)
#' data(example_reference_data)
#'
#' valid_codes <- example_reference_data$ATC_code
#' validate_atc_with_reference(example_atc_data_for_validation, "atc_1", valid_codes)
#' validate_atc_with_reference(example_atc_data_for_validation, "atc_2", valid_codes)
validate_atc_with_reference <- function(input_data, atc_column, reference_atc_codes) {
  atc_sym <- rlang::sym(atc_column)
  flag_column <- paste0(atc_column, "_invalid")

  input_data[[flag_column]] <- ifelse(
    is.na(input_data[[atc_column]]) |
      !(input_data[[atc_column]] %in% reference_atc_codes),
    1, 0
  )

  input_data <- dplyr::relocate(input_data, !!flag_column, .after = !!atc_sym)

  return(input_data)
}
