
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rustandr

<!-- badges: start -->

<!-- badges: end -->

The goal of `rustandr` is to provide a template to run Rust code through
and R package. It’s practice and note keeping for myself.

## Installation

You can install development version from
[GitHub](https://github.com/jmbarbone/rustandr) with:

``` r
# install.packages("devtools")
devtools::install_github("jmbarbone/rustandr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rustandr)
## basic example code
foo_hello()
#> [1] "Hello, world."

foo_int()
#> [1] 42

foo_intn(1:100)
#>   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
#>  [19]  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36
#>  [37]  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54
#>  [55]  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
#>  [73]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
#>  [91]  91  92  93  94  95  96  97  98  99 100

foo_intn(seq(-12L, 17L, 1L))
#>  [1] -12 -11 -10  -9  -8  -7  -6  -5  -4  -3  -2  -1   0   1   2   3   4   5   6
#> [20]   7   8   9  10  11  12  13  14  15  16  17

# multiplies x by y
foo_intxy(3L, 8L)
#> [1] 24

# divides x by y
foo_dblxy(61, 7)
#> [1] 8.714286

foo_int_cumsum(rpois(10, 5))
#>  [1]  7 11 19 22 29 37 39 45 49 57
```
