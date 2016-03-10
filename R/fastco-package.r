#' fastco
#'
#' @description
#' Fast, optimized methods for computing covariance,
#' correlation, and cosine similarity. Separate implementations
#' are available for a dense matrix, two dense vectors, or a
#' sparse matrix. The use of these methods is transparent to the
#' user and handled automatically based on the input data, 
#' handled by R's S3 methods.  Full description of the algorithms
#' and benchmarks are available in the package vignettes.
#' 
#' Covariance and correlation should largely need no introduction.
#' Cosine similarity is commonly needed in, for example, natural
#' language processing, where the cosine similarity coefficients
#' of all columns of a term-document or document-term matrix is
#' needed.
#' 
#' @section Implementation Details:
#' Multiple storage schemes for the input data are accepted.  
#' For dense matrices, an ordinary R matrix input is accepted.  
#' For sparse matrices, a matrix in COO format, namely 
#' \code{simple_triplet_matrix} from the slam package, is accepted.
#' 
#' The implementation for dense matrix inputs is dominated
#' by a symmetric rank-k update via the BLAS subroutine \code{dsyrk};
#' see the package vignette for a discussion of the algorithm
#' implementation and complexity.
#' 
#' The implementation for two dense vector inputs is dominated by the
#' product \code{t(x) \%*\% y} performed by the BLAS subroutine 
#' \code{dgemm} and the normalizing products \code{t(y) \%*\% y},
#' each computed via the BLAS function \code{dsyrk}.
#' 
#' @useDynLib fastco, R_co_mat, R_co_vecvec,
#'   R_co_sparse, R_sparsity_int, R_sparsity_dbl
#' 
#' @docType package
#' @name fastco
#' @author Drew Schmidt
#' @keywords package
NULL
