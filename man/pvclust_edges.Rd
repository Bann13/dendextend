% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pvclust.R
\name{pvclust_edges}
\alias{pvclust_edges}
\title{Get Pvclust Edges Information}
\usage{
pvclust_edges(pvclust_obj)
}
\arguments{
\item{pvclust_obj}{pvclust object}
}
\value{
data.frame with leaves on column 1 and 2, followed by the rest of the information from edge
}
\description{
Get pvclust edges information such as au and bp and return dataframe with proper sample labels. This function is useful when there is a lot of samples involved.
}
\examples{
\dontrun{

library(pvclust)
data(lung) # 916 genes for 73 subjects
set.seed(13134)
result <- pvclust(lung[, 1:20], method.dist="cor", method.hclust="average", nboot=100)
pvclust_edges(result)

}
}
\references{
hclust object descriptions \url{https://stat.ethz.ch/R-manual/R-patched/library/stats/html/hclust.html}
}
