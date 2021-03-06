# Copyright (C) Tal Galili
#
# This file is part of dendextend.
#
# dendextend is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# dendextend is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  http://www.r-project.org/Licenses/
#



#' @importFrom fpc pamk
NULL



#' @title Find the (estimated) number of clusters for a dendrogram using average silhouette width
#' @rdname find_k
#' @export
#' @description
#' This function estimates the number of clusters based on the maximal average \link[cluster]{silhouette} width 
#' derived from running \link[cluster]{pam} on the \link[stats]{cophenetic} distance matrix of 
#' the \link[stats]{dendrogram}. The output is based on the \link[fpc]{pamk} output.
#' @param dend A dendrogram (or hclust) tree object
#' @param krange integer vector. Numbers of clusters which are to be compared 
#' by the average silhouette width criterion. 
#' Note: average silhouette width and Calinski-Harabasz can't estimate number 
#' of clusters nc=1. If 1 is included, a Duda-Hart test is applied and 1 is 
#' estimated if this is not significant.
#' @param x An object of class "find_k" (has its own S3 plot method).
#' @param xlab,ylab,main parameters passed to plot.
#' @param ... passed to \link[fpc]{pamk} (the current defaults criterion="asw" and usepam=TRUE can not be changes).
#' @seealso
#' \link[fpc]{pamk}, \link[cluster]{pam}, \link[cluster]{silhouette}.
#' @return 
#' A \link[fpc]{pamk} output. This is a list with the following components: 
#' 1) pamobject - The output of the optimal run of the pam-function.
#' 2) nc	- the optimal number of clusters.
#' 3) crit - vector of criterion values for numbers of clusters. crit[1] is the p-value of the Duda-Hart test if 1 is in krange and diss=FALSE.
#' 4) k - a copy of nc (just to make it easier to extract - since k is often used in other functions)
#' @examples
#' 
#' dend <- iris[,-5] %>% dist %>% hclust %>% as.dendrogram
#' dend_k <- find_k(dend)
#' plot(dend_k)
#' plot(color_branches(dend, k = dend_k$nc))
#' 
#' library(cluster)
#' sil <- silhouette(dend_k$pamobject)
#' plot(sil)
#' 
#' dend <- USArrests %>% dist %>% hclust(method = "ave") %>% as.dendrogram
#' dend_k <- find_k(dend)
#' plot(dend_k)
#' plot(color_branches(dend, k = dend_k$nc))
#' 
find_k <- function(dend, krange= 2:min(10, (nleaves(dend)-1)), ...)
{
   # library(fpc)
   # krange = 2:10
   # criterion = "asw"
   d <- cophenetic(dend) # this will work for both a dendrogram and an hclust object.
   out <- pamk(d, krange = krange, criterion="asw", usepam=TRUE, ...)
   out$k <- out$nc # just to make it easier to find.
   class(out) <- "find_k"
   out
}


#' @export
#' @rdname find_k
plot.find_k <- function(x , 
                        xlab = "Number of clusters (k)", 
                        ylab = "Average silhouette width", 
                        main = "Estimating the number of clusters using\n average silhouette width", 
                        ...) {
   asw <- x$crit
   k <- seq_along(x$crit)
   
   col <- rep("black", length(k))
   col[which.max(asw)] <- "red"
   
   plot(asw ~ k, 
        xlab = xlab,
        ylab = ylab,
        main = main,
        type = "b", 
        las = 1,
        col = col,
        ...)
}



