% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/term_structures.R
\name{treasury_df}
\alias{treasury_df}
\title{Get a US Treasury curve discount factor function}
\usage{
treasury_df(..., envir = parent.frame())
}
\arguments{
\item{...}{Arguments passed to \code{\link{treasury_df_raw}}}

\item{envir}{Environment passed to \code{\link{treasury_df_raw}}}
}
\value{
A function taking two time arguments, which returns the discount factor from the second to the first (see \code{spot_to_df_fcn})
}
\description{
This is a caching wrapper for \code{\link{treasury_df_raw}}
}
