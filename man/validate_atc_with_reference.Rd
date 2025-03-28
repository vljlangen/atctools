% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate_atc_with_reference.R
\name{validate_atc_with_reference}
\alias{validate_atc_with_reference}
\title{Validate ATC Codes Against a Reference List}
\usage{
validate_atc_with_reference(input_data, atc_column, reference_atc_codes)
}
\arguments{
\item{input_data}{A data frame containing ATC codes.}

\item{atc_column}{The name of the column in \code{input_data} containing ATC codes.}

\item{reference_atc_codes}{A character vector of valid ATC codes.}
}
\value{
A data frame with an additional column indicating invalid ATC codes:
\describe{
\item{*_invalid}{1 if the ATC code is not in the reference list, 0 if it is.}
}
}
\description{
This function checks whether ATC codes in a given column exist in a reference list of valid ATC codes.
}
\examples{
data(example_atc_data_for_validation)
data(example_reference_data)

valid_codes <- example_reference_data$ATC_code
validate_atc_with_reference(example_atc_data_for_validation, "atc_1", valid_codes)
validate_atc_with_reference(example_atc_data_for_validation, "atc_2", valid_codes)
}
