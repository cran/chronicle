% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text.R
\name{add_code}
\alias{add_code}
\title{Add formatted code chunks to a chronicle R Markdown report}
\usage{
add_code(
  report = "",
  code,
  code_title = NULL,
  title_level = 2,
  eval = TRUE,
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  fig_width = NULL,
  fig_height = NULL
)
}
\arguments{
\item{report}{Character string containing all the R Markdown chunks previously added. Default is '', an empty report.}

\item{code}{The code that will be added to the report. Mind the indentation on the call, since spaces between quotations will be preserved.}

\item{code_title}{The title of the text section. Default is NULL.}

\item{title_level}{Level of the section title of this text (ie, number of # on Rmarkdown syntax.)}

\item{eval}{Run the code instead of just display it. Default is TRUE.}

\item{echo}{Whether to display the source code in the output document. Default is FALSE.}

\item{message}{Whether to preserve messages on rendering. Default is FALSE.}

\item{warning}{Whether to preserve warnings on rendering. Default is FALSE.}

\item{fig_width}{Width of the figures printed from this code.}

\item{fig_height}{Height of the figures printed from this code.}
}
\value{
The text of the Rmarkdown report plus an additional section with the code chunk.
}
\description{
Beware that code indentation of the chronicle call will affect the indentation of the chunk, so make sure not to leave unintended indentation in the 'code' parameter on this function call.
}
\examples{
html_report <- add_code(report = '',
                        code_title = 'Code comes after this title',
                        code = 'f <- function(x, y){paste(x,y)},
f("a", "b")',
                        eval = FALSE,
                        echo = TRUE,
                        fig_width = 12,
                        fig_height = 8)
cat(html_report)
}
