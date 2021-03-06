% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tables.R
\name{add_table}
\alias{add_table}
\title{Add a table to a chronicle report}
\usage{
add_table(
  report = "",
  table,
  table_title = NULL,
  title_level = 2,
  html_table_type = c("DT", "kable"),
  table_params = NULL,
  fig_width = NULL,
  fig_height = NULL
)
}
\arguments{
\item{report}{Character string containing all the R Markdown chunks previously added. Default is '', an empty report.}

\item{table}{data.frame to print on the report.}

\item{table_title}{title of the table. Default is no title.}

\item{title_level}{Level of the section title of this plot (ie, number of # on Rmarkdown syntax.)}

\item{html_table_type}{Either print a knitr::kable table or a DT htmlwidget.}

\item{table_params}{A named list of additional parameters to be passed to either knitr::kable() or DT::datatable(), depending on html_table_type}

\item{fig_width}{Width of the figures printed from this code.}

\item{fig_height}{Height of the figures printed from this code.}
}
\value{
An R Markdown file as a character string, now containing a chunk for the specified table.
}
\description{
Add a table to a chronicle report
}
\examples{
html_report <- add_table(table = iris,
                         table_title = 'Iris measures',
                         html_table_type = 'kable')
cat(html_report)
}
