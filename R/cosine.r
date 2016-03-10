#' Cosine Similarity
#' 
#' Compute the cosine similarity matrix efficiently.  The function
#' syntax and behavior is largely modeled after that of the
#' \code{cosine()} function from the \code{lsa} package, although
#' with a very different implementation.
#' 
#' @details
#' See \code{?fastco} for implementation details.
#' 
#' @param x
#' A numeric matrix or vector.
#' @param y
#' A vector (when \code{x} is a vector) or missing (blank) when 
#' \code{x} is a matrix.
#' 
#' @return
#' The \eqn{n\times n} matrix of all pair-wise vector cosine
#' similarities of the columns.
#' 
#' @examples
#' x <- matrix(rnorm(10*3), 10, 3)
#' 
#' fastco::cosine(x)
#' fastco::cosine(x[, 1], x[, 2])
#' 
#' @author Drew Schmidt
#' @seealso \code{\link{sparsity}}
#' @export
cosine <- function(x, y) UseMethod("cosine")



#' @export
cosine.matrix <- function(x, y)
{
  co_matrix(x, y, CO_SIM)
}



#' @export
cosine.default <- function(x, y)
{
  co_vecvec(x, y, CO_SIM)
}



#' @export
cosine.simple_triplet_matrix <- function(x, y)
{
  co_sparse(x, y, type=CO_SIM)
}
