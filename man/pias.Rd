\name{pias_from_classification}
\alias{pias_from_classification}

\title{
Make a price index aggregation structure
}

\description{
Construct a price index aggregation structure from a hierarchical classification.
}

\usage{
pias_from_classification(x, delim = "", start = 1)
}

\arguments{
  \item{x}{A character vector of classification codes at the lowest level in a hierarchy (e.g., NAICS level 6).}
  \item{delim}{A character that delimits hierarchy levels in \code{x}.}
  \item{start}{At what position in \code{x} does the hierarchy start (e.g., 2 for NAICS, 3 for NAPCS).}
}

\value{
A list with two components, \code{children} and \code{parents}, each of which contains named a list of the same length. The list in \code{children} gives the subsvector of \code{x} that is contained in every level of the hierarchy (i.e., the terminal nodes that are the children for each node in the graph). The list in \code{parents} gives the code for one level up for each level in the hierarchy (i.e., the immediate parent node for each node in the graph).
}

\seealso{
\code{\link[pias]{naics2017}} for the NAICS classification.

\code{\link[pias]{napcs2017}} for the NAPCS classification.
}

\examples{
# An aggregation structure for 6-digit NAICS
pias <- pias_from_classification(naics2017$code[naics2017$level == 5], start = 2)
}

