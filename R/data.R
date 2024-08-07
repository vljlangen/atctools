#' Example Drug Data without Milligrams
#'
#' This dataset provides an example of drug names without milligrams.
#'
#' @format A data frame with 5 rows and 1 variable:
#' \describe{
#'   \item{drug_name}{A character vector representing drug names.}
#' }
#' @examples
#' example_drug_data
"example_drug_data"

#' Example Drug Data with Milligrams
#'
#' This dataset provides an example of drug names including milligrams.
#'
#' @format A data frame with 5 rows and 1 variable:
#' \describe{
#'   \item{drug_name}{A character vector representing drug names with milligrams.}
#' }
#' @examples
#' example_drug_data_with_mg
"example_drug_data_with_mg"

#' Example Reference Data for Drug Matching
#'
#' This dataset provides an example reference data for drug matching.
#'
#' @format A list with 2 elements:
#' \describe{
#'   \item{ATC_codes}{A character vector representing ATC codes.}
#'   \item{drug_names}{A character vector representing corresponding drug names.}
#' }
#' @examples
#' example_reference_data
"example_reference_data"

#' Example ATC Data for Testing
#'
#' This dataset provides an example of ATC codes for testing the \code{atc2drug} function.
#' It includes valid ATC codes, non-valid ATC codes, and NA values.
#'
#' @format A data frame with 8 rows and 1 variable:
#' \describe{
#'   \item{ATC_code}{A character vector representing ATC codes, including valid codes, non-valid codes, and NA.}
#' }
#' @examples
#' example_atc_data
"example_atc_data"

