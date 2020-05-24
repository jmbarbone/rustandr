#define R_NO_REMAP
#define STRICT_R_HEADERS
#include <R.h>
#include <Rinternals.h>

// Import C headers for rust API
#include "mylib/api.h"


// Actual Wrappers
SEXP impl_foo_hello(){
  return Rf_ScalarString(Rf_mkCharCE(foo_hello(), CE_UTF8));
}

SEXP impl_foo_int(){
  return Rf_ScalarInteger(foo_int());
}

SEXP impl_foo_int_sq(){
  return Rf_ScalarInteger(foo_int_sq());
}

SEXP impl_foo_intx(SEXP x){
  return Rf_ScalarInteger(foo_intx(Rf_asInteger(x)));
}

SEXP impl_foo_intxy(SEXP x, SEXP y){
  return Rf_ScalarInteger(foo_intxy(Rf_asInteger(x), Rf_asInteger(y)));
}

SEXP impl_foo_intn(SEXP x){
  int n = Rf_length(x);
  SEXP out = PROTECT(Rf_allocVector(INTSXP, n));
  int* result = foo_intn(INTEGER(x));

  for(int i = 0; i < n; i++) {
    INTEGER(out)[i] = result[i];
  }

  UNPROTECT(1);
  return out;
}

SEXP impl_foo_mk_seq(SEXP x){
  int n = Rf_asInteger(x);
  SEXP out = PROTECT(Rf_allocVector(INTSXP, n));
  int * result = foo_mk_seq(n);

  for(int i = 0; i < n; i++) {
    INTEGER(out)[i] = result[i];
  }

  UNPROTECT(1);
  return out;
}

SEXP impl_foo_dbl(){
  return Rf_ScalarReal(foo_dbl());
}

SEXP impl_foo_dbl_sq(){
  return Rf_ScalarReal(foo_dbl_sq());
}

SEXP impl_foo_dblx(SEXP x){
  return Rf_ScalarReal(foo_dblx(Rf_asReal(x)));
}

SEXP impl_foo_dblxy(SEXP x, SEXP y){
  return Rf_ScalarReal(foo_dblxy(Rf_asReal(x), Rf_asReal(y)));
}

SEXP impl_foo_mk_dbl(SEXP x){
  int n = Rf_asInteger(x);
  double * result = foo_mk_dbl(n);
  SEXP out = PROTECT(Rf_allocVector(REALSXP, n));
  for(int i = 0; i < n; i++) {
    REAL(out)[i] = result[i];
  }
  UNPROTECT(1);
  return out;
}

// Standard R package stuff
static const R_CallMethodDef CallEntries[] = {
  {"impl_foo_hello", (DL_FUNC) &impl_foo_hello, 0},
  {"impl_foo_int", (DL_FUNC) &impl_foo_int, 0},
  {"impl_foo_int_sq", (DL_FUNC) &impl_foo_int_sq, 0},
  {"impl_foo_intx", (DL_FUNC) &impl_foo_intx, 1},
  {"impl_foo_intxy", (DL_FUNC) &impl_foo_intxy, 2},
  {"impl_foo_intn", (DL_FUNC) &impl_foo_intn, 1},
  {"impl_foo_mk_seq", (DL_FUNC) &impl_foo_mk_seq, 1},
  {"impl_foo_dbl", (DL_FUNC) &impl_foo_dbl, 0},
  {"impl_foo_dbl_sq", (DL_FUNC) &impl_foo_dbl_sq, 0},
  {"impl_foo_dblx", (DL_FUNC) &impl_foo_dblx, 1},
  {"impl_foo_dblxy", (DL_FUNC) &impl_foo_dblxy, 2},
  {"impl_foo_mk_dbl", (DL_FUNC) &impl_foo_mk_dbl, 1},
  {NULL, NULL, 0}
};

void R_init_bootstrapRRust(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
