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

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_int_sq
foo_int_sq <- function() {
  .Call(impl_foo_int_sq)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_intx
foo_intx <- function(x = 42L) {
  stopifnot(is.integer(x))
  .Call(impl_foo_intx, x)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_intxy
foo_intxy <- function(x = 42L, y = 17L) {
  stopifnot(is.integer(x) & is.integer(y))
  .Call(impl_foo_intxy, x, y)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_intn
foo_intn <- function(x = 1:2) {
  stopifnot(is.integer(x))
  .Call(impl_foo_intn, x)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_mk_seq
foo_mk_seq <- function(x = 10L) {
  stopifnot(is.integer(x) & x > 0L)
  .Call(impl_foo_mk_seq, x)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_dbl
foo_dbl <- function() {
  .Call(impl_foo_dbl)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_dbl_sq
foo_dbl_sq <- function() {
  .Call(impl_foo_dbl_sq)
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_dblx
foo_dblx <- function(x = 4.2) {
  .Call(impl_foo_dblx, as.double(x))
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_dblxy
foo_dblxy <- function(x = 4.2, y = 1.7) {
  .Call(impl_foo_dblxy, as.double(x), as.double(y))
}

#' @rdname funs
#' @export
#' @useDynLib rustandr impl_foo_mk_dbl
foo_mk_dbl <- function(x = 10L) {
  stopifnot(is.integer(x))
  .Call(impl_foo_mk_dbl, x)
}
