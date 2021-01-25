{chronicle}
================

This is an R package for rendering attractive R Markdown html files,
with interactive html widgets like [plotly](https://plotly.com/r/)
charts, [dygraphs](https://rstudio.github.io/dygraphs/) and
[DataTables](https://rstudio.github.io/DT/). It is built using a layered
paradigm that will be familiar to any {ggplot2} or {tensorflow} R user.

A quick demo:

``` r
install_packages('chronicle')
library(chronicle)

new_report(title = '\{chronicle\} demo') %>%
    add_title('This is how a chronicle report looks', title_level = 1) %>%
    add_density(dt = iris, groups = 'Species', value = 'Sepal.Length', faceted = F) %>%
    add_table(table = iris, table_title = 'This is the iris dataset. Smells good!', html_table_type = 'DT') %>%
    add_boxplot(dt = iris, groups = 'Species', value = 'Sepal.Length') %>%
    add_barplot(dt = iris, bars = 'Species', value = 'Sepal.Length') %>%
    render_report(filename = 'index', keep_rmd = TRUE)
```

And you can see the ouput [here](https://pheymanss.github.io/)

#### How to use chronicle?

Similar to starting off with the ggplot() function to create an empty
plot, you start off with new\_report(), which creates an empty R
Markdown header with a few presets to make the html output useful and
appealing (mostly through
[prettydoc](https://github.com/yixuan/prettydoc).) You can print your
current formatted R Markdown structure in the R console using the cat()
function.

Additional to the empty header, new\_report() creates a first chunk in
which it loads the package, and suggests adding all the preprocessing in
that chunk to have reproducibility by rendering through direct knitting
instead of relying on chronicle’s rendering.

``` r
empty_header <- new_report()
cat(empty_header)
```

    ## ---
    ## title:  New chronicle Report
    ## date: "`r Sys.Date()`"
    ## author:  chronicle user
    ## output: 
    ##   prettydoc::html_pretty: 
    ##     theme: leonids
    ##     fig_width: 11
    ##     fig_height: 5
    ## ---
    ## 
    ## 
    ## ```{r, echo = FALSE, message = FALSE, warning = FALSE}
    ## library(chronicle)
    ## # If you want this report to be reproducible, add on this chunk all
    ## # the libraries, data loading and preprocessing done before executing
    ## # the chronicle report.
    ## 
    ## ```

After this, you can then just add new chunks with the add\_\* family of
functions. These include:

-   add\_barplot
-   add\_boxplot
-   add\_chunk
-   add\_code
-   add\_density
-   add\_dygraph
-   add\_histogram
-   add\_lineplot
-   add\_table
-   add\_text
-   add\_title
-   add\_violin

Each of these functions has its own set of parameters, and aim to take
the burden of sophistication from the user, to help you create
interactive data visualizations by just specifying the parameters of
each function. Be sure to go through ?add\_\* to see the full set of
options each function has.

These functions will create chunks that will be concatenated into your
report, similar to adding layers to a ggplot.

After having all your chunks, just call render\_report() to knit the
html file. A great upside of using chronicle is that **the report is
rendered in you global environment**, which means that you will not have
to repeat all the processing as you would have if you knitted
traditionally. You can also choose to keep the .Rmd file for later
reproducibility.

``` r
finished_report <- new_report()
render_report(report = finished_report, filename = "my_report", keep_rmd = TRUE)
```

#### What’s next for chronicle

-   Add other output types besides prettydoc: bookdown, pagedown,
    fexdashboard (!), blogdown.
-   Add new add\_\* functions and additional parameters to the existing
    ones.
-   Tryout other plotting engines besides plotly: ggiraph, e\_charts,
    highcharter\*, D3 (!).

``` r
make_lineplot(dt = iris, x = 'Sepal.Length', 'Sepal.Width', groups = 'Species')
```

<!--html_preserve-->

<div id="htmlwidget-55beac2b8aa0fb334bfe" class="plotly html-widget"
style="width:1056px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-55beac2b8aa0fb334bfe">{"x":{"data":[{"x":[4.3,4.4,4.4,4.4,4.5,4.6,4.6,4.6,4.6,4.7,4.7,4.8,4.8,4.8,4.8,4.8,4.9,4.9,4.9,4.9,5,5,5,5,5,5,5,5,5.1,5.1,5.1,5.1,5.1,5.1,5.1,5.1,5.2,5.2,5.2,5.3,5.4,5.4,5.4,5.4,5.4,5.5,5.5,5.7,5.7,5.8],"y":[3,2.9,3,3.2,2.3,3.1,3.4,3.6,3.2,3.2,3.2,3.4,3,3.4,3.1,3,3,3.1,3.1,3.6,3.6,3.4,3,3.4,3.2,3.5,3.5,3.3,3.5,3.5,3.8,3.7,3.3,3.4,3.8,3.8,3.5,3.4,4.1,3.7,3.9,3.7,3.9,3.4,3.4,4.2,3.5,4.4,3.8,4],"text":["Sepal.Length: 4.3<br />Sepal.Width: 3.0","Sepal.Length: 4.4<br />Sepal.Width: 2.9","Sepal.Length: 4.4<br />Sepal.Width: 3.0","Sepal.Length: 4.4<br />Sepal.Width: 3.2","Sepal.Length: 4.5<br />Sepal.Width: 2.3","Sepal.Length: 4.6<br />Sepal.Width: 3.1","Sepal.Length: 4.6<br />Sepal.Width: 3.4","Sepal.Length: 4.6<br />Sepal.Width: 3.6","Sepal.Length: 4.6<br />Sepal.Width: 3.2","Sepal.Length: 4.7<br />Sepal.Width: 3.2","Sepal.Length: 4.7<br />Sepal.Width: 3.2","Sepal.Length: 4.8<br />Sepal.Width: 3.4","Sepal.Length: 4.8<br />Sepal.Width: 3.0","Sepal.Length: 4.8<br />Sepal.Width: 3.4","Sepal.Length: 4.8<br />Sepal.Width: 3.1","Sepal.Length: 4.8<br />Sepal.Width: 3.0","Sepal.Length: 4.9<br />Sepal.Width: 3.0","Sepal.Length: 4.9<br />Sepal.Width: 3.1","Sepal.Length: 4.9<br />Sepal.Width: 3.1","Sepal.Length: 4.9<br />Sepal.Width: 3.6","Sepal.Length: 5.0<br />Sepal.Width: 3.6","Sepal.Length: 5.0<br />Sepal.Width: 3.4","Sepal.Length: 5.0<br />Sepal.Width: 3.0","Sepal.Length: 5.0<br />Sepal.Width: 3.4","Sepal.Length: 5.0<br />Sepal.Width: 3.2","Sepal.Length: 5.0<br />Sepal.Width: 3.5","Sepal.Length: 5.0<br />Sepal.Width: 3.5","Sepal.Length: 5.0<br />Sepal.Width: 3.3","Sepal.Length: 5.1<br />Sepal.Width: 3.5","Sepal.Length: 5.1<br />Sepal.Width: 3.5","Sepal.Length: 5.1<br />Sepal.Width: 3.8","Sepal.Length: 5.1<br />Sepal.Width: 3.7","Sepal.Length: 5.1<br />Sepal.Width: 3.3","Sepal.Length: 5.1<br />Sepal.Width: 3.4","Sepal.Length: 5.1<br />Sepal.Width: 3.8","Sepal.Length: 5.1<br />Sepal.Width: 3.8","Sepal.Length: 5.2<br />Sepal.Width: 3.5","Sepal.Length: 5.2<br />Sepal.Width: 3.4","Sepal.Length: 5.2<br />Sepal.Width: 4.1","Sepal.Length: 5.3<br />Sepal.Width: 3.7","Sepal.Length: 5.4<br />Sepal.Width: 3.9","Sepal.Length: 5.4<br />Sepal.Width: 3.7","Sepal.Length: 5.4<br />Sepal.Width: 3.9","Sepal.Length: 5.4<br />Sepal.Width: 3.4","Sepal.Length: 5.4<br />Sepal.Width: 3.4","Sepal.Length: 5.5<br />Sepal.Width: 4.2","Sepal.Length: 5.5<br />Sepal.Width: 3.5","Sepal.Length: 5.7<br />Sepal.Width: 4.4","Sepal.Length: 5.7<br />Sepal.Width: 3.8","Sepal.Length: 5.8<br />Sepal.Width: 4.0"],"type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(13,8,135,1)","dash":"solid"},"hoveron":"points","name":"setosa","legendgroup":"setosa","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.9,5,5,5.1,5.2,5.4,5.5,5.5,5.5,5.5,5.5,5.6,5.6,5.6,5.6,5.6,5.7,5.7,5.7,5.7,5.7,5.8,5.8,5.8,5.9,5.9,6,6,6,6,6.1,6.1,6.1,6.1,6.2,6.2,6.3,6.3,6.3,6.4,6.4,6.5,6.6,6.6,6.7,6.7,6.7,6.8,6.9,7],"y":[2.4,2,2.3,2.5,2.7,3,2.3,2.4,2.4,2.5,2.6,2.9,3,2.5,3,2.7,2.8,2.6,3,2.9,2.8,2.7,2.7,2.6,3,3.2,2.2,2.9,2.7,3.4,2.9,2.8,2.8,3,2.2,2.9,3.3,2.5,2.3,3.2,2.9,2.8,2.9,3,3.1,3,3.1,2.8,3.1,3.2],"text":["Sepal.Length: 4.9<br />Sepal.Width: 2.4","Sepal.Length: 5.0<br />Sepal.Width: 2.0","Sepal.Length: 5.0<br />Sepal.Width: 2.3","Sepal.Length: 5.1<br />Sepal.Width: 2.5","Sepal.Length: 5.2<br />Sepal.Width: 2.7","Sepal.Length: 5.4<br />Sepal.Width: 3.0","Sepal.Length: 5.5<br />Sepal.Width: 2.3","Sepal.Length: 5.5<br />Sepal.Width: 2.4","Sepal.Length: 5.5<br />Sepal.Width: 2.4","Sepal.Length: 5.5<br />Sepal.Width: 2.5","Sepal.Length: 5.5<br />Sepal.Width: 2.6","Sepal.Length: 5.6<br />Sepal.Width: 2.9","Sepal.Length: 5.6<br />Sepal.Width: 3.0","Sepal.Length: 5.6<br />Sepal.Width: 2.5","Sepal.Length: 5.6<br />Sepal.Width: 3.0","Sepal.Length: 5.6<br />Sepal.Width: 2.7","Sepal.Length: 5.7<br />Sepal.Width: 2.8","Sepal.Length: 5.7<br />Sepal.Width: 2.6","Sepal.Length: 5.7<br />Sepal.Width: 3.0","Sepal.Length: 5.7<br />Sepal.Width: 2.9","Sepal.Length: 5.7<br />Sepal.Width: 2.8","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 5.8<br />Sepal.Width: 2.6","Sepal.Length: 5.9<br />Sepal.Width: 3.0","Sepal.Length: 5.9<br />Sepal.Width: 3.2","Sepal.Length: 6.0<br />Sepal.Width: 2.2","Sepal.Length: 6.0<br />Sepal.Width: 2.9","Sepal.Length: 6.0<br />Sepal.Width: 2.7","Sepal.Length: 6.0<br />Sepal.Width: 3.4","Sepal.Length: 6.1<br />Sepal.Width: 2.9","Sepal.Length: 6.1<br />Sepal.Width: 2.8","Sepal.Length: 6.1<br />Sepal.Width: 2.8","Sepal.Length: 6.1<br />Sepal.Width: 3.0","Sepal.Length: 6.2<br />Sepal.Width: 2.2","Sepal.Length: 6.2<br />Sepal.Width: 2.9","Sepal.Length: 6.3<br />Sepal.Width: 3.3","Sepal.Length: 6.3<br />Sepal.Width: 2.5","Sepal.Length: 6.3<br />Sepal.Width: 2.3","Sepal.Length: 6.4<br />Sepal.Width: 3.2","Sepal.Length: 6.4<br />Sepal.Width: 2.9","Sepal.Length: 6.5<br />Sepal.Width: 2.8","Sepal.Length: 6.6<br />Sepal.Width: 2.9","Sepal.Length: 6.6<br />Sepal.Width: 3.0","Sepal.Length: 6.7<br />Sepal.Width: 3.1","Sepal.Length: 6.7<br />Sepal.Width: 3.0","Sepal.Length: 6.7<br />Sepal.Width: 3.1","Sepal.Length: 6.8<br />Sepal.Width: 2.8","Sepal.Length: 6.9<br />Sepal.Width: 3.1","Sepal.Length: 7.0<br />Sepal.Width: 3.2"],"type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(177,42,144,1)","dash":"solid"},"hoveron":"points","name":"versicolor","legendgroup":"versicolor","showlegend":true,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.9,5.6,5.7,5.8,5.8,5.8,5.9,6,6,6.1,6.1,6.2,6.2,6.3,6.3,6.3,6.3,6.3,6.3,6.4,6.4,6.4,6.4,6.4,6.5,6.5,6.5,6.5,6.7,6.7,6.7,6.7,6.7,6.8,6.8,6.9,6.9,6.9,7.1,7.2,7.2,7.2,7.3,7.4,7.6,7.7,7.7,7.7,7.7,7.9],"y":[2.5,2.8,2.5,2.7,2.8,2.7,3,2.2,3,3,2.6,2.8,3.4,3.3,2.9,2.7,2.8,3.4,2.5,2.7,3.2,2.8,2.8,3.1,3,3.2,3,3,2.5,3.3,3.1,3.3,3,3,3.2,3.2,3.1,3.1,3,3.6,3.2,3,2.9,2.8,3,3.8,2.6,2.8,3,3.8],"text":["Sepal.Length: 4.9<br />Sepal.Width: 2.5","Sepal.Length: 5.6<br />Sepal.Width: 2.8","Sepal.Length: 5.7<br />Sepal.Width: 2.5","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 5.8<br />Sepal.Width: 2.8","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 5.9<br />Sepal.Width: 3.0","Sepal.Length: 6.0<br />Sepal.Width: 2.2","Sepal.Length: 6.0<br />Sepal.Width: 3.0","Sepal.Length: 6.1<br />Sepal.Width: 3.0","Sepal.Length: 6.1<br />Sepal.Width: 2.6","Sepal.Length: 6.2<br />Sepal.Width: 2.8","Sepal.Length: 6.2<br />Sepal.Width: 3.4","Sepal.Length: 6.3<br />Sepal.Width: 3.3","Sepal.Length: 6.3<br />Sepal.Width: 2.9","Sepal.Length: 6.3<br />Sepal.Width: 2.7","Sepal.Length: 6.3<br />Sepal.Width: 2.8","Sepal.Length: 6.3<br />Sepal.Width: 3.4","Sepal.Length: 6.3<br />Sepal.Width: 2.5","Sepal.Length: 6.4<br />Sepal.Width: 2.7","Sepal.Length: 6.4<br />Sepal.Width: 3.2","Sepal.Length: 6.4<br />Sepal.Width: 2.8","Sepal.Length: 6.4<br />Sepal.Width: 2.8","Sepal.Length: 6.4<br />Sepal.Width: 3.1","Sepal.Length: 6.5<br />Sepal.Width: 3.0","Sepal.Length: 6.5<br />Sepal.Width: 3.2","Sepal.Length: 6.5<br />Sepal.Width: 3.0","Sepal.Length: 6.5<br />Sepal.Width: 3.0","Sepal.Length: 6.7<br />Sepal.Width: 2.5","Sepal.Length: 6.7<br />Sepal.Width: 3.3","Sepal.Length: 6.7<br />Sepal.Width: 3.1","Sepal.Length: 6.7<br />Sepal.Width: 3.3","Sepal.Length: 6.7<br />Sepal.Width: 3.0","Sepal.Length: 6.8<br />Sepal.Width: 3.0","Sepal.Length: 6.8<br />Sepal.Width: 3.2","Sepal.Length: 6.9<br />Sepal.Width: 3.2","Sepal.Length: 6.9<br />Sepal.Width: 3.1","Sepal.Length: 6.9<br />Sepal.Width: 3.1","Sepal.Length: 7.1<br />Sepal.Width: 3.0","Sepal.Length: 7.2<br />Sepal.Width: 3.6","Sepal.Length: 7.2<br />Sepal.Width: 3.2","Sepal.Length: 7.2<br />Sepal.Width: 3.0","Sepal.Length: 7.3<br />Sepal.Width: 2.9","Sepal.Length: 7.4<br />Sepal.Width: 2.8","Sepal.Length: 7.6<br />Sepal.Width: 3.0","Sepal.Length: 7.7<br />Sepal.Width: 3.8","Sepal.Length: 7.7<br />Sepal.Width: 2.6","Sepal.Length: 7.7<br />Sepal.Width: 2.8","Sepal.Length: 7.7<br />Sepal.Width: 3.0","Sepal.Length: 7.9<br />Sepal.Width: 3.8"],"type":"scatter","mode":"lines","line":{"width":1.88976377952756,"color":"rgba(252,166,54,1)","dash":"solid"},"hoveron":"points","name":"virginica","legendgroup":"virginica","showlegend":true,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null},{"x":[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5],"y":[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3],"text":["Sepal.Length: 5.1<br />Sepal.Width: 3.5","Sepal.Length: 4.9<br />Sepal.Width: 3.0","Sepal.Length: 4.7<br />Sepal.Width: 3.2","Sepal.Length: 4.6<br />Sepal.Width: 3.1","Sepal.Length: 5.0<br />Sepal.Width: 3.6","Sepal.Length: 5.4<br />Sepal.Width: 3.9","Sepal.Length: 4.6<br />Sepal.Width: 3.4","Sepal.Length: 5.0<br />Sepal.Width: 3.4","Sepal.Length: 4.4<br />Sepal.Width: 2.9","Sepal.Length: 4.9<br />Sepal.Width: 3.1","Sepal.Length: 5.4<br />Sepal.Width: 3.7","Sepal.Length: 4.8<br />Sepal.Width: 3.4","Sepal.Length: 4.8<br />Sepal.Width: 3.0","Sepal.Length: 4.3<br />Sepal.Width: 3.0","Sepal.Length: 5.8<br />Sepal.Width: 4.0","Sepal.Length: 5.7<br />Sepal.Width: 4.4","Sepal.Length: 5.4<br />Sepal.Width: 3.9","Sepal.Length: 5.1<br />Sepal.Width: 3.5","Sepal.Length: 5.7<br />Sepal.Width: 3.8","Sepal.Length: 5.1<br />Sepal.Width: 3.8","Sepal.Length: 5.4<br />Sepal.Width: 3.4","Sepal.Length: 5.1<br />Sepal.Width: 3.7","Sepal.Length: 4.6<br />Sepal.Width: 3.6","Sepal.Length: 5.1<br />Sepal.Width: 3.3","Sepal.Length: 4.8<br />Sepal.Width: 3.4","Sepal.Length: 5.0<br />Sepal.Width: 3.0","Sepal.Length: 5.0<br />Sepal.Width: 3.4","Sepal.Length: 5.2<br />Sepal.Width: 3.5","Sepal.Length: 5.2<br />Sepal.Width: 3.4","Sepal.Length: 4.7<br />Sepal.Width: 3.2","Sepal.Length: 4.8<br />Sepal.Width: 3.1","Sepal.Length: 5.4<br />Sepal.Width: 3.4","Sepal.Length: 5.2<br />Sepal.Width: 4.1","Sepal.Length: 5.5<br />Sepal.Width: 4.2","Sepal.Length: 4.9<br />Sepal.Width: 3.1","Sepal.Length: 5.0<br />Sepal.Width: 3.2","Sepal.Length: 5.5<br />Sepal.Width: 3.5","Sepal.Length: 4.9<br />Sepal.Width: 3.6","Sepal.Length: 4.4<br />Sepal.Width: 3.0","Sepal.Length: 5.1<br />Sepal.Width: 3.4","Sepal.Length: 5.0<br />Sepal.Width: 3.5","Sepal.Length: 4.5<br />Sepal.Width: 2.3","Sepal.Length: 4.4<br />Sepal.Width: 3.2","Sepal.Length: 5.0<br />Sepal.Width: 3.5","Sepal.Length: 5.1<br />Sepal.Width: 3.8","Sepal.Length: 4.8<br />Sepal.Width: 3.0","Sepal.Length: 5.1<br />Sepal.Width: 3.8","Sepal.Length: 4.6<br />Sepal.Width: 3.2","Sepal.Length: 5.3<br />Sepal.Width: 3.7","Sepal.Length: 5.0<br />Sepal.Width: 3.3"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(13,8,135,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(13,8,135,1)"}},"hoveron":"points","name":"setosa","legendgroup":"setosa","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7],"y":[3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8],"text":["Sepal.Length: 7.0<br />Sepal.Width: 3.2","Sepal.Length: 6.4<br />Sepal.Width: 3.2","Sepal.Length: 6.9<br />Sepal.Width: 3.1","Sepal.Length: 5.5<br />Sepal.Width: 2.3","Sepal.Length: 6.5<br />Sepal.Width: 2.8","Sepal.Length: 5.7<br />Sepal.Width: 2.8","Sepal.Length: 6.3<br />Sepal.Width: 3.3","Sepal.Length: 4.9<br />Sepal.Width: 2.4","Sepal.Length: 6.6<br />Sepal.Width: 2.9","Sepal.Length: 5.2<br />Sepal.Width: 2.7","Sepal.Length: 5.0<br />Sepal.Width: 2.0","Sepal.Length: 5.9<br />Sepal.Width: 3.0","Sepal.Length: 6.0<br />Sepal.Width: 2.2","Sepal.Length: 6.1<br />Sepal.Width: 2.9","Sepal.Length: 5.6<br />Sepal.Width: 2.9","Sepal.Length: 6.7<br />Sepal.Width: 3.1","Sepal.Length: 5.6<br />Sepal.Width: 3.0","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 6.2<br />Sepal.Width: 2.2","Sepal.Length: 5.6<br />Sepal.Width: 2.5","Sepal.Length: 5.9<br />Sepal.Width: 3.2","Sepal.Length: 6.1<br />Sepal.Width: 2.8","Sepal.Length: 6.3<br />Sepal.Width: 2.5","Sepal.Length: 6.1<br />Sepal.Width: 2.8","Sepal.Length: 6.4<br />Sepal.Width: 2.9","Sepal.Length: 6.6<br />Sepal.Width: 3.0","Sepal.Length: 6.8<br />Sepal.Width: 2.8","Sepal.Length: 6.7<br />Sepal.Width: 3.0","Sepal.Length: 6.0<br />Sepal.Width: 2.9","Sepal.Length: 5.7<br />Sepal.Width: 2.6","Sepal.Length: 5.5<br />Sepal.Width: 2.4","Sepal.Length: 5.5<br />Sepal.Width: 2.4","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 6.0<br />Sepal.Width: 2.7","Sepal.Length: 5.4<br />Sepal.Width: 3.0","Sepal.Length: 6.0<br />Sepal.Width: 3.4","Sepal.Length: 6.7<br />Sepal.Width: 3.1","Sepal.Length: 6.3<br />Sepal.Width: 2.3","Sepal.Length: 5.6<br />Sepal.Width: 3.0","Sepal.Length: 5.5<br />Sepal.Width: 2.5","Sepal.Length: 5.5<br />Sepal.Width: 2.6","Sepal.Length: 6.1<br />Sepal.Width: 3.0","Sepal.Length: 5.8<br />Sepal.Width: 2.6","Sepal.Length: 5.0<br />Sepal.Width: 2.3","Sepal.Length: 5.6<br />Sepal.Width: 2.7","Sepal.Length: 5.7<br />Sepal.Width: 3.0","Sepal.Length: 5.7<br />Sepal.Width: 2.9","Sepal.Length: 6.2<br />Sepal.Width: 2.9","Sepal.Length: 5.1<br />Sepal.Width: 2.5","Sepal.Length: 5.7<br />Sepal.Width: 2.8"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(177,42,144,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(177,42,144,1)"}},"hoveron":"points","name":"versicolor","legendgroup":"versicolor","showlegend":false,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],"y":[3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],"text":["Sepal.Length: 6.3<br />Sepal.Width: 3.3","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 7.1<br />Sepal.Width: 3.0","Sepal.Length: 6.3<br />Sepal.Width: 2.9","Sepal.Length: 6.5<br />Sepal.Width: 3.0","Sepal.Length: 7.6<br />Sepal.Width: 3.0","Sepal.Length: 4.9<br />Sepal.Width: 2.5","Sepal.Length: 7.3<br />Sepal.Width: 2.9","Sepal.Length: 6.7<br />Sepal.Width: 2.5","Sepal.Length: 7.2<br />Sepal.Width: 3.6","Sepal.Length: 6.5<br />Sepal.Width: 3.2","Sepal.Length: 6.4<br />Sepal.Width: 2.7","Sepal.Length: 6.8<br />Sepal.Width: 3.0","Sepal.Length: 5.7<br />Sepal.Width: 2.5","Sepal.Length: 5.8<br />Sepal.Width: 2.8","Sepal.Length: 6.4<br />Sepal.Width: 3.2","Sepal.Length: 6.5<br />Sepal.Width: 3.0","Sepal.Length: 7.7<br />Sepal.Width: 3.8","Sepal.Length: 7.7<br />Sepal.Width: 2.6","Sepal.Length: 6.0<br />Sepal.Width: 2.2","Sepal.Length: 6.9<br />Sepal.Width: 3.2","Sepal.Length: 5.6<br />Sepal.Width: 2.8","Sepal.Length: 7.7<br />Sepal.Width: 2.8","Sepal.Length: 6.3<br />Sepal.Width: 2.7","Sepal.Length: 6.7<br />Sepal.Width: 3.3","Sepal.Length: 7.2<br />Sepal.Width: 3.2","Sepal.Length: 6.2<br />Sepal.Width: 2.8","Sepal.Length: 6.1<br />Sepal.Width: 3.0","Sepal.Length: 6.4<br />Sepal.Width: 2.8","Sepal.Length: 7.2<br />Sepal.Width: 3.0","Sepal.Length: 7.4<br />Sepal.Width: 2.8","Sepal.Length: 7.9<br />Sepal.Width: 3.8","Sepal.Length: 6.4<br />Sepal.Width: 2.8","Sepal.Length: 6.3<br />Sepal.Width: 2.8","Sepal.Length: 6.1<br />Sepal.Width: 2.6","Sepal.Length: 7.7<br />Sepal.Width: 3.0","Sepal.Length: 6.3<br />Sepal.Width: 3.4","Sepal.Length: 6.4<br />Sepal.Width: 3.1","Sepal.Length: 6.0<br />Sepal.Width: 3.0","Sepal.Length: 6.9<br />Sepal.Width: 3.1","Sepal.Length: 6.7<br />Sepal.Width: 3.1","Sepal.Length: 6.9<br />Sepal.Width: 3.1","Sepal.Length: 5.8<br />Sepal.Width: 2.7","Sepal.Length: 6.8<br />Sepal.Width: 3.2","Sepal.Length: 6.7<br />Sepal.Width: 3.3","Sepal.Length: 6.7<br />Sepal.Width: 3.0","Sepal.Length: 6.3<br />Sepal.Width: 2.5","Sepal.Length: 6.5<br />Sepal.Width: 3.0","Sepal.Length: 6.2<br />Sepal.Width: 3.4","Sepal.Length: 5.9<br />Sepal.Width: 3.0"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(252,166,54,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(252,166,54,1)"}},"hoveron":"points","name":"virginica","legendgroup":"virginica","showlegend":false,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":43.7625570776256,"r":7.30593607305936,"b":46.027397260274,"l":48.9497716894977},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,0.328144458281445],"automargin":true,"type":"linear","autorange":false,"range":[4.12,8.08],"tickmode":"array","ticktext":["5.00","6.00","7.00","8.00"],"tickvals":[5,6,7,8],"categoryorder":"array","categoryarray":["5.00","6.00","7.00","8.00"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":"","hoverformat":".2f"},"annotations":[{"text":"Sepal.Length","x":0.5,"y":-0.0353881278538813,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"top","annotationType":"axis"},{"text":"Sepal.Width","x":-0.0243877127438771,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-90,"xanchor":"right","yanchor":"center","annotationType":"axis"},{"text":"setosa","x":0.164072229140722,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"versicolor","x":0.5,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"virginica","x":0.835927770859278,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.689497716895},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"}],"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[1.88,4.52],"tickmode":"array","ticktext":["2.00","2.50","3.00","3.50","4.00","4.50"],"tickvals":[2,2.5,3,3.5,4,4.5],"categoryorder":"array","categoryarray":["2.00","2.50","3.00","3.50","4.00","4.50"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"","hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.328144458281445,"y0":0,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.328144458281445,"y0":0,"y1":23.37899543379,"yanchor":1,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.338522208385222,"x1":0.661477791614778,"y0":0,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.338522208385222,"x1":0.661477791614778,"y0":0,"y1":23.37899543379,"yanchor":1,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.671855541718555,"x1":1,"y0":0,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.671855541718555,"x1":1,"y0":0,"y1":23.37899543379,"yanchor":1,"ysizemode":"pixel"}],"xaxis2":{"type":"linear","autorange":false,"range":[4.12,8.08],"tickmode":"array","ticktext":["5.00","6.00","7.00","8.00"],"tickvals":[5,6,7,8],"categoryorder":"array","categoryarray":["5.00","6.00","7.00","8.00"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.338522208385222,0.661477791614778],"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":"","hoverformat":".2f"},"xaxis3":{"type":"linear","autorange":false,"range":[4.12,8.08],"tickmode":"array","ticktext":["5.00","6.00","7.00","8.00"],"tickvals":[5,6,7,8],"categoryorder":"array","categoryarray":["5.00","6.00","7.00","8.00"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.671855541718555,1],"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":"","hoverformat":".2f"},"showlegend":false,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"268c2ed92bb5":{"x":{},"y":{},"colour":{},"type":"scatter"},"268c65ea6945":{"x":{},"y":{},"colour":{}}},"cur_data":"268c2ed92bb5","visdat":{"268c2ed92bb5":["function (y) ","x"],"268c65ea6945":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
