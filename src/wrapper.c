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

SEXP impl_foo_dbl(){
  return Rf_ScalarReal(foo_dbl());
}

// Standard R package stuff
static const R_CallMethodDef CallEntries[] = {
  {"impl_foo_hello", (DL_FUNC) &impl_foo_hello, 0},
  {"impl_foo_int", (DL_FUNC) &impl_foo_int, 0},
  {"impl_foo_dbl", (DL_FUNC) &impl_foo_dbl, 0},
  {NULL, NULL, 0}
};

void R_init_bootstrapRRust(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
