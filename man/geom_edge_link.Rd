% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_edge_link.R
\name{geom_edge_link}
\alias{geom_edge_link}
\alias{geom_edge_link0}
\alias{geom_edge_link2}
\title{Draw edges as straight lines between nodes}
\usage{
geom_edge_link(mapping = NULL, data = gEdges("short"),
  position = "identity", arrow = NULL, lineend = "butt",
  show.legend = NA, n = 100, ...)

geom_edge_link2(mapping = NULL, data = gEdges("long"),
  position = "identity", arrow = NULL, lineend = "butt",
  show.legend = NA, n = 100, ...)

geom_edge_link0(mapping = NULL, data = gEdges(), position = "identity",
  arrow = NULL, lineend = "butt", show.legend = NA, ...)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2]{aes}}
or \code{\link[ggplot2]{aes_}}. By default x, y, xend, yend, group and
circular are mapped to x, y, xend, yend, edge.id and circular in the edge
data.}

\item{data}{The return of a call to \code{gEdges()} or a data.frame
giving edges in corrent format (see details for for guidance on the format).
See \code{\link{gEdges}} for more details on edge extraction.}

\item{position}{Position adjustment, either as a string, or the result of a
call to a position adjustment function. Currently no meaningful position
adjustment exists for edges.}

\item{arrow}{Arrow specification, as created by \code{\link[grid]{arrow}}}

\item{lineend}{Line end style (round, butt, square)}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped. \code{FALSE}
never includes, and \code{TRUE} always includes.}

\item{n}{The number of points to create along the path.}

\item{...}{other arguments passed on to \code{\link[ggplot2]{layer}}. There
are three types of arguments you can use here:
\itemize{
 \item{Aesthetics: to set an aesthetic to a fixed value, like
 \code{color = "red"} or \code{size = 3.}}
 \item{Other arguments to the layer, for example you override the default
 \code{stat} associated with the layer.}
 \item{Other arguments passed on to the stat.}
}}
}
\description{
This geom draws edges in the simplest way - as straight lines between the
start and end nodes. Not much more to say about that...
}
\details{
Many geom_edge_* layers comes in 3 flavors depending on the level of control
needed over the drawing. The default (no numeric postfix) generate a number
of points (\code{n}) along the edge and draws it as a path. Each point along
the line has a numeric value associated with it giving the position along the
path, and it is therefore possible to show the direction of the edge by
mapping to this e.g. \code{colour = ..index..}. The version postfixed with a
"2" uses the "long" edge format (see \code{\link{gEdges}}) and makes it
possible to interpolate node parameter between the start and end node along
the edge. It is considerable less performant so should only be used if this
is needed. The version postfixed with a "0" draws the edge in the most
performant way, often directly using an appropriate grob from the grid
package, but does not allow for gradients along the edge.
}
\note{
In order to avoid excessive typing edge aesthetic names are
automatically expanded. Because of this it is not necessary to write
\code{edge_colour} within the \code{aes()} call as \code{colour} will
automatically be renamed appropriately.
}
\section{Aesthetics}{

geom_edge_link and geom_edge_link0 understand the following
aesthetics. Bold aesthetics are automatically set, but can be overridden.
\itemize{
 \item{\strong{x}}
 \item{\strong{y}}
 \item{\strong{xend}}
 \item{\strong{yend}}
 \item{edge_colour}
 \item{edge_width}
 \item{edge_linetype}
 \item{edge_alpha}
 \item{filter}
}
geom_edge_link2 understand the following aesthetics. Bold aesthetics are
automatically set, but can be overridden.
\itemize{
 \item{\strong{x}}
 \item{\strong{y}}
 \item{\strong{group}}
 \item{edge_colour}
 \item{edge_width}
 \item{edge_linetype}
 \item{edge_alpha}
 \item{filter}
}
}

\section{Computed variables}{


\describe{
 \item{index}{The position along the path (not computed for the *0 version)}
}
}
\examples{
require(igraph)
gr <- make_graph('bull')
E(gr)$class <- sample(letters[1:3], gsize(gr), replace = TRUE)
V(gr)$class <- sample(letters[1:3], gorder(gr), replace = TRUE)

ggraph(gr, 'igraph', algorithm = 'nicely') +
  geom_edge_link(aes(alpha = ..index..))

ggraph(gr, 'igraph', algorithm = 'nicely') +
  geom_edge_link2(aes(colour = node.class),
                 gEdges('long', nodePar = 'class'))

ggraph(gr, 'igraph', algorithm = 'nicely') +
  geom_edge_link0(aes(colour = class))

}
\author{
Thomas Lin Pedersen
}
\seealso{
Other geom_edge_*: \code{\link{geom_edge_arc}},
  \code{\link{geom_edge_density}},
  \code{\link{geom_edge_diagonal}},
  \code{\link{geom_edge_elbow}},
  \code{\link{geom_edge_fan}}, \code{\link{geom_edge_loop}}
}

