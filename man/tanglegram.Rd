% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tanglegram.R
\name{tanglegram}
\alias{tanglegram}
\alias{tanglegram.default}
\alias{tanglegram.hclust}
\alias{tanglegram.phylo}
\alias{tanglegram.dendlist}
\alias{tanglegram.dendrogram}
\alias{dendbackback}
\title{Tanglegram plot}
\source{
The function is based on code from Johan Renaudie (plannapus), after major revisions. See:
\url{http://stackoverflow.com/questions/12456768/duelling-dendrograms-in-r-placing-dendrograms-back-to-back-in-r}

As far as I could tell, this code was originally inspired by Dylan Beaudette
function \code{dueling.dendrograms} from the sharpshootR package:
\url{http://cran.at.r-project.org/web/packages/sharpshootR/}
tanglegram
}
\usage{
tanglegram(dend1, ...)

\method{tanglegram}{default}(dend1, ...)

\method{tanglegram}{hclust}(dend1, ...)

\method{tanglegram}{phylo}(dend1, ...)

\method{tanglegram}{dendlist}(dend1, which = c(1L, 2L), main_left, main_right,
  just_one = TRUE, ...)

\method{tanglegram}{dendrogram}(dend1, dend2, sort = FALSE, color_lines,
  lwd = 3.5, edge.lwd = NULL, columns_width = c(5, 3, 5),
  margin_top = 3, margin_bottom = 2.5, margin_inner = 3,
  margin_outer = 0.5, left_dendo_mar = c(margin_bottom, margin_outer,
  margin_top, margin_inner), right_dendo_mar = c(margin_bottom, margin_inner,
  margin_top, margin_outer), intersecting = TRUE, dLeaf = NULL,
  dLeaf_left = dLeaf, dLeaf_right = dLeaf, axes = TRUE, type = "r",
  lab.cex = NULL, remove_nodePar = FALSE, main = "", main_left = "",
  main_right = "", sub = "", k_labels = NULL, k_branches = NULL,
  rank_branches = FALSE, hang = FALSE, match_order_by_labels = TRUE,
  cex_main = 2, cex_main_left = cex_main, cex_main_right = cex_main,
  cex_sub = cex_main, highlight_distinct_edges = TRUE,
  common_subtrees_color_lines = TRUE,
  common_subtrees_color_branches = FALSE, highlight_branches_col = FALSE,
  highlight_branches_lwd = TRUE, faster = FALSE, just_one = TRUE, ...)

dendbackback(dend1, dend2, sort = FALSE, color_lines, lwd = 3.5,
  edge.lwd = NULL, columns_width = c(5, 3, 5), margin_top = 3,
  margin_bottom = 2.5, margin_inner = 3, margin_outer = 0.5,
  left_dendo_mar = c(margin_bottom, margin_outer, margin_top, margin_inner),
  right_dendo_mar = c(margin_bottom, margin_inner, margin_top, margin_outer),
  intersecting = TRUE, dLeaf = NULL, dLeaf_left = dLeaf,
  dLeaf_right = dLeaf, axes = TRUE, type = "r", lab.cex = NULL,
  remove_nodePar = FALSE, main = "", main_left = "", main_right = "",
  sub = "", k_labels = NULL, k_branches = NULL, rank_branches = FALSE,
  hang = FALSE, match_order_by_labels = TRUE, cex_main = 2,
  cex_main_left = cex_main, cex_main_right = cex_main, cex_sub = cex_main,
  highlight_distinct_edges = TRUE, common_subtrees_color_lines = TRUE,
  common_subtrees_color_branches = FALSE, highlight_branches_col = FALSE,
  highlight_branches_lwd = TRUE, faster = FALSE, just_one = TRUE, ...)
}
\arguments{
\item{dend1}{tree object (dendrogram/dendlist/hclust/phylo), plotted on the left}

\item{...}{not used.}

\item{which}{an integer vector of length 2, indicating
which of the trees in the dendlist object should be plotted}

\item{main_left}{Character. Title of the left dendrogram.}

\item{main_right}{Character. Title of the right dendrogram.}

\item{just_one}{logical (TRUE). If FALSE, it means at least two tanglegrams
will be plotted on the same page and so \link{layout} is not passed.
See: \url{http://stackoverflow.com/q/39784746/4137985}}

\item{dend2}{tree object (dendrogram/hclust/phylo), plotted on the right}

\item{sort}{logical (FALSE). Should the dendrogram's labels be "sorted"?
(might give a better tree in some cases).}

\item{color_lines}{a vector of colors for the lines connected the labels.
If the colors are shorter than the number of labels, they are recycled 
(and a warning is issued).
The colors in the vector are applied on the lines from the bottom up.}

\item{lwd}{width of the lines connecting the labels. (default is 3.5)}

\item{edge.lwd}{width of the dendrograms lines. Default is NULL.
If set, then it switches `highlight_branches_lwd` to FALSE. If you want thicker
lines which reflect the height, please use \link{highlight_branches_lwd} on the 
dendrograms/dendlist.}

\item{columns_width}{a vector with three elements, giving the relative
sizes of the the three plots (left dendrogram, connecting lines, 
right dendrogram). This is passed to \link{layout} if parameter just_one is TRUE. 
The default is: c(5,3,5)}

\item{margin_top}{the number of lines of margin to be specified on the top
of the plots.}

\item{margin_bottom}{the number of lines of margin to be specified on the 
bottom of the plots.}

\item{margin_inner}{margin_bottom the number of lines of margin 
to be specified on the inner distence between the dendrograms
and the connecting lines.}

\item{margin_outer}{margin_bottom the number of lines of margin 
to be specified on the outer distence between the dendrograms
and the connecting lines.}

\item{left_dendo_mar}{mar parameters of the left dendrgoram.}

\item{right_dendo_mar}{mar parameters of the right dendrgoram.}

\item{intersecting}{logical (TRUE). Should the leaves of the two dendrograms
be pruned so that the two trees will have the same labels?}

\item{dLeaf}{a number specifying the distance in user coordinates between 
the tip of a leaf and its label. If NULL, as per default, 
3/4 of a letter width or height is used.

Notice that if we are comparing two dendrograms with different
heights, manually changing dLeaf will affect both trees differently.
In such a case, it is recommanded to manually change dLeaf_left
and dLeaf_right.
This can be especially important when changing the lab.cex of the 
dendrogram's labels.
Alternatively, one could manually set the xlim parameter for both
trees, which will force the proportion of distances of the 
labels from the trees to remain the same.}

\item{dLeaf_left}{dLeaf of the left dendrogram, by default it is equal to dLeaf (often negative).}

\item{dLeaf_right}{dLeaf of the right dendrogram, by default it is equal to minus dLeaf (often positive).}

\item{axes}{logical (TRUE). Should plot axes be plotted?}

\item{type}{type of plot ("t"/"r" = triangle or rectangle)}

\item{lab.cex}{numeric scalar, influanicing the cex size of the labels.}

\item{remove_nodePar}{logical (FALSE). Should the nodePar of the leaves be 
removed? (useful when the trees' leaves has too many parameters on them)}

\item{main}{Character. Title above the connecting lines.}

\item{sub}{Character. Title below the connecting lines.}

\item{k_labels}{integer. Number of groups by which to color the leaves.}

\item{k_branches}{integer. Number of groups by which to color the branches.}

\item{rank_branches}{logical (FALSE). Should the branches heights be adjusted?
(setting this to TRUE - can make it easier for 
comparing topological differences)}

\item{hang}{logical (FALSE). Should we hang the leaves of the trees?}

\item{match_order_by_labels}{logical (TRUE). Should the leaves value order
be matched between the two trees based on labels? This is a MUST in order
to have the lines connect the correct labels. Set this to FALSE if you 
want to make the plotting a bit faster, and only after you are sure
the labels and orders are correctly aligned.}

\item{cex_main}{A numerical value giving the amount by which plotting title 
should be magnified relative to the default.}

\item{cex_main_left}{see cex_main.}

\item{cex_main_right}{see cex_main.}

\item{cex_sub}{see cex_main.}

\item{highlight_distinct_edges}{logical (default is TRUE). If to highlight distinct edges in each tree (by changing their line types to 2).
(notice that this can be slow on large trees)

This parameter will automatically be turned off if the tree already comes with a "lty" edgePar 
(this is checked using \link{has_edgePar}). A "lty" can be removed by using set("clear_branches"), by
removing all of the edgePar parameters of the dendrogram.}

\item{common_subtrees_color_lines}{logical (default is TRUE). color the connecting line based on the common subtrees of both dends.
This only works if 
(notice that this can be slow on large trees)}

\item{common_subtrees_color_branches}{logical (default is FALSE). 
Color the branches of both dends based on the common subtrees.
(notice that this can be slow on large trees)
This is FALSE by default since it will override the colors of the existing tree.}

\item{highlight_branches_col}{logical (default is FALSE). Should \link{highlight_branches_col} be used on the dendrograms.

This parameter will automatically be turned off if the tree already comes with a "col" edgePar 
(this is checked using \link{has_edgePar}). A "lty" can be removed by using set("clear_branches"), by
removing all of the edgePar parameters of the dendrogram.}

\item{highlight_branches_lwd}{logical (default is TRUE). Should \link{highlight_branches_lwd} be used on the dendrograms.

This parameter will automatically be turned off if the tree already comes with a "lwd" edgePar 
(this is checked using \link{has_edgePar}). A "lty" can be removed by using set("clear_branches"), by
removing all of the edgePar parameters of the dendrogram.}

\item{faster}{logical (FALSE). If TRUE, it overrides some other parameters to 
have them turned off so that the plotting will go a tiny bit faster.}
}
\value{
An invisible \link{dendlist}, with two trees after being
modified during the creation of the tanglegram.
}
\description{
Plots a tanglegram plot of a side by side trees.
}
\details{
Notice that tanglegram does not "resize" well. In case you are resizing your
window you would need to re-run the function.
}
\examples{
\dontrun{
set.seed(23235)
ss <- sample(1:150, 10 )
dend1 <- iris[ss,-5] \%>\% dist \%>\% hclust("com") \%>\% as.dendrogram
dend2 <- iris[ss,-5] \%>\% dist \%>\% hclust("sin") \%>\% as.dendrogram
dend12 <- dendlist(dend1, dend2)

dend12 \%>\% tanglegram

tanglegram(dend1 , dend2)
tanglegram(dend1 , dend2, sort = TRUE)
tanglegram(dend1 , dend2, remove_nodePar = TRUE)
tanglegram(dend1 , dend2, k_labels = 6, k_branches = 4)

tanglegram(dend1 , dend2, lab.cex = 2, edge.lwd = 3,
margin_inner= 5, type = "t", center = TRUE)


## works nicely:
tanglegram(dend1 , dend2, lab.cex = 2, edge.lwd = 3,  
margin_inner= 3.5, type = "t", center = TRUE,
dLeaf = -0.1, xlim = c(7,0),
k_branches=3)


# using rank_branches can make the comparison even easier
tanglegram(rank_branches(dend1) , rank_branches(dend2), lab.cex = 2, edge.lwd = 3,  
 margin_inner= 3.5, type = "t", center = TRUE,
  dLeaf = -0.1, xlim = c(5.1,0), columns_width= c(5,1,5),
   k_branches=3)



########
## Nice example of some colored trees

# see the coloring of common sub trees:
set.seed(23235)
ss <- sample(1:150, 10 )
dend1 <- iris[ss,-5] \%>\% dist \%>\% hclust("com") \%>\% as.dendrogram
dend2 <- iris[ss,-5] \%>\% dist \%>\% hclust("sin") \%>\% as.dendrogram
dend12 <- dendlist(dend1, dend2)
# dend12 \%>\% untangle \%>\% tanglegram
dend12 \%>\% tanglegram(common_subtrees_color_branches = TRUE)


set.seed(22133513)
ss <- sample(1:150, 10 )
dend1 <- iris[ss,-5] \%>\% dist \%>\% hclust("com") \%>\% as.dendrogram
dend2 <- iris[ss,-5] \%>\% dist \%>\% hclust("sin") \%>\% as.dendrogram
dend12 <- dendlist(dend1, dend2)
# dend12 \%>\% untangle \%>\% tanglegram
dend12 \%>\% tanglegram(common_subtrees_color_branches = TRUE)
dend12 \%>\% tanglegram

}
}
\seealso{
\link{remove_leaves_nodePar}, \link{plot_horiz.dendrogram}, \link{rank_branches},
\link{hang.dendrogram}
}
\author{
Tal Galili, Johan Renaudie
}
