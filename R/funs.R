#' Functions
#'
#' Functions that call to Rust
#'
#' @details
#' \itemize{
#'  \item{foo_hello}{no input; returns "Hello, world"}
#' }
#'
#' @export
#' @useDynLib rustandr impl_foo_hello
#' @name funs
foo_hello <- function() {
  .Call(impl_foo_hello)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_int
foo_int <- function() {
  .Call(impl_foo_int)
}

