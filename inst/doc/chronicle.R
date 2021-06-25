## ---- echo = FALSE, message = FALSE, warning = FALSE--------------------------
library(chronicle)
set_static <- TRUE
figure_width <- 9
figure_height <- 5
# If you want this report to be reproducible, add on this chunk all
# the libraries, data loading and preprocessing done before executing
# the chronicle report.

## ---- eval=FALSE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----
#  install.packages('chronicle')

## ---- eval=TRUE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----

library(chronicle)

demo_report <-
  add_text(text_title = "This is the output of a chronicle call",
           text = "Each element has been added through an add_* function.",
           title_level = 1) %>%
  add_table(table = head(iris),
            table_title = "A glimpse at the iris dataset",
            html_table_type = "kable",
            title_level = 1) %>%
  add_raincloud(dt = iris,
                value = "Sepal.Length",
                groups = "Species",
                raincloud_title = "Distribution of sepal length by species",
                title_level = 2) %>%
  add_scatterplot(dt = iris,
                  x = "Petal.Width",
                  y = "Petal.Length",
                  groups = "Species",
                  scatterplot_title = "Comparison of petal width and length",
                  title_level = 2)

render_report(report = demo_report,
              output_format = "rmdformats",
              filename = "quick_demo",
              title = "A quick chronicle demo",
              author = "You did this!",
              keep_rmd = TRUE)

## ---- eval=TRUE, echo=FALSE, fig.width=figure_width, fig.height=figure_height----
file.remove('quick_demo.Rmd'); file.remove('quick_demo.html')

## ---- eval=TRUE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----
demo_report

## ---- eval=FALSE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----
#  make_barplot(dt = ggplot2::mpg,
#               value = 'cty',
#               bars = 'manufacturer',
#               break_bars_by = 'drv',
#               horizontal = TRUE,
#               sort_by_value = TRUE,
#               static = TRUE)

## ---- eval=FALSE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----
#  make_raincloud(dt = iris,
#               value = 'Sepal.Length',
#               groups = 'Species')

## ---- eval=FALSE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----
#  
#  render_report(report = demo_report,
#                output_format = c("ioslides", "tufte_html", "rmdformats"),
#                filename = "quick_demo",
#                title = "A quick chronicle demo",
#                author = "You did this!",
#                keep_rmd = TRUE)

## ---- eval=FALSE, echo=TRUE, fig.width=figure_width, fig.height=figure_height----
#  report_columns(dt = palmerpenguins::penguins,
#                 by_column = 'species')

