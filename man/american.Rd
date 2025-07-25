% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/american_options.R
\name{american}
\alias{american}
\title{Price one or more american-exercise options}
\usage{
american(
  callput,
  S0,
  K,
  time,
  const_short_rate = 0,
  const_default_intensity = 0,
  discount_factor_fcn = function(T, t, ...) {
     exp(-const_short_rate * (T - t))
 },
  survival_probability_fcn = function(T, t, ...) {
     exp(-const_default_intensity * (T
    - t))
 },
  default_intensity_fcn = function(t, S, ...) {
     const_default_intensity + 0 * S
 },
  ...,
  num_time_steps = 100,
  structure_constant = 2,
  std_devs_width = 5
)
}
\arguments{
\item{callput}{\code{1} for calls, \code{-1} for puts (may be a vector of the same)}

\item{S0}{initial underlying price}

\item{K}{strike (may be a vector)}

\item{time}{Time from \code{0} until expiration (may be a vector)}

\item{const_short_rate}{A constant to use for the instantaneous interest rate in case \code{discount_factor_fcn}
is not given}

\item{const_default_intensity}{A constant to use for the instantaneous default intensity in case \code{default_intensity_fcn}
is not given}

\item{discount_factor_fcn}{A function for computing present values to
time \code{t} of various cashflows occurring during this timestep, with
arguments \code{T}, \code{t}}

\item{survival_probability_fcn}{(Implied argument) A function for probability of survival, with
arguments \code{T}, \code{t} and \code{T>t}.  E.g. with
a constant volatility \eqn{s} this takes the form \eqn{(T-t)s^2}. Should be matched to \code{default_intensity_fcn}}

\item{default_intensity_fcn}{A function for computing default intensity
occurring at a given time, dependent on time and stock price, with
arguments \code{t}, \code{S}.  Should be matched to \code{survival_probability_fcn}}

\item{...}{Further arguments passed on to \code{\link{find_present_value}}}

\item{num_time_steps}{Number of steps to use in the grid solver.  Can usually be
set quite low due to the control variate scheme.}

\item{structure_constant}{The maximum ratio between time intervals \code{dt}
and the square of space intervals \code{dz^2}}

\item{std_devs_width}{The number of standard deviations, in \code{sigma * sqrt(T)}
units, to incorporate into the grid}
}
\value{
A vector of estimated option present values
}
\description{
Use a control-variate scheme to simultaneously estimate the present
 values of a collection of one or more American-exercise options under
 a default model with survival probabilities not linked to equity prices.
}
\details{
The scheme
 uses find_present_value() to price the options and their European-exercise
 equivalents.  It then compares the latter to black-scholes formula output
 and uses the results as an error correction on the prices of the
 American-exercise options.
}
\examples{
american(PUT, S0=100, K=110, time=0.77, const_short_rate = 0.06,
         const_volatility=0.20, num_time_steps=200)
american(callput=-1, S0=100, K=90, time=1, const_short_rate=0.025,
         variance_cumulation_fcn = function(T, t) {  # Term structure of vola
             0.45 ^ 2 * (T - t) + 0.15^2 * max(0, T-0.25)
         })
}
\seealso{
Other Equity Independent Default Intensity: 
\code{\link{american_implied_volatility}()},
\code{\link{black_scholes_on_term_structures}()},
\code{\link{blackscholes}()},
\code{\link{equivalent_bs_vola_to_jump}()},
\code{\link{equivalent_jump_vola_to_bs}()},
\code{\link{implied_volatilities}()},
\code{\link{implied_volatilities_with_rates_struct}()},
\code{\link{implied_volatility}()},
\code{\link{implied_volatility_with_term_struct}()}

Other American Exercise Equity Options: 
\code{\link{american_implied_volatility}()},
\code{\link{control_variate_pairs}()}
}
\concept{American Exercise Equity Options}
\concept{Equity Independent Default Intensity}
