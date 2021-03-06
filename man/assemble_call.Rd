% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enchunk.R
\name{assemble_call}
\alias{assemble_call}
\title{Assembles a formatted function call from a function and a list of parameters}
\usage{
assemble_call(fun_name, params, non_char = NULL)
}
\arguments{
\item{fun_name}{Name of the function to be called (must be a character or coercible to a character).}

\item{params}{Named list or vector containing the parameters for the fun call.}

\item{non_char}{Names of the parameters whose values should not be interpreted
as character values}
}
\value{
A character string with the formatted function call.
}
\description{
Assembles a formatted function call from a function and a list of parameters
}
\examples{
chronicle::assemble_call(fun_name = 'base::sapply',
                         params = list(X = 'iris',
                                       FUN= 'class'))
chronicle::assemble_call(fun_name = 'base::sapply',
                         params = list(X = 'iris',
                                       FUN= 'class'),
                         non_char = c('X', 'FUN'))
}
