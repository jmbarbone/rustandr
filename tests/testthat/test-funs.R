context("Functions")

test_that("characters", {
  expect_equal(foo_hello(), "Hello, world.")
})

test_that("integers", {
  xpois <- rpois(1e4, 5)
  xx <- seq(2, 1e4, 2)
  xpois[xx] <- xpois[xx] * -1L


  expect_equal(foo_int(), 42L)

  expect_equal(foo_int_sq(), 42L^2)

  expect_equal(foo_intx(), 42L)
  expect_equal(foo_intx(17L), 17L)
  expect_error(foo_intx(4.2))

  expect_equal(foo_intxy(), 42L * 17L)
  expect_equal(foo_intxy(21L, 13L), 21L * 13L)
  expect_error(foo_intxy(4.2))

  expect_equal(foo_intn(), 1:2)
  expect_equal(foo_intn(5L), 5L)
  expect_equal(foo_intn(0:100), c(0:100))
  expect_equal(foo_intn(100:0), c(100:0))
  expect_equal(foo_intn(seq(-33L, 3L, 3L)), seq(-33L, 3L, 3L))
  expect_error(foo_intn(1))
  expect_error(foo_intn(1L, 2))
  expect_error(foo_intn(1L, 2L))

  expect_equal(foo_mk_seq(), 1:10)
  expect_length(foo_mk_seq(100L), 100)
  expect_error(foo_mk_seq(3))
  expect_error(foo_mk_seq(0))
  expect_error(foo_mk_seq(-1))

  expect_equal(foo_int_cumsum(), cumsum(1:10))
  expect_equal(foo_int_cumsum(xpois), cumsum(xpois))
  expect_error(foo_int_cumsum(1.1))
  # Does not account for NA values
  expect_error(foo_int_cumsum(c(1:3, NA_integer_, 5L)))
})

test_that("doubles", {
  xunif <- runif(1e4)


  expect_equal(foo_dbl(), 4.2)

  expect_equal(foo_dbl_sq(), 4.2^2)

  expect_equal(foo_dblx(), 4.2)
  expect_equal(foo_dblx(1.7), 1.7)
  expect_error(foo_dblx(42L), NA)
  expect_equal(foo_dblx(42L), 42)

  expect_equal(foo_dblxy(), 4.2 / 1.7)
  expect_equal(foo_dblxy(21, 13), 21 / 13)
  expect_error(foo_dblxy(x = 42L), NA)

  expect_equal(foo_mk_dbl(), double(10))
  expect_length(foo_mk_dbl(100L), 100)
  expect_error(foo_mk_dbl(10))

  expect_equal(foo_dbl_sum(), 1.5)
  expect_equal(foo_dbl_sum(1:10), 55)
  expect_equal(foo_dbl_sum(xunif), sum(xunif))
  # Does not account for NA values
  expect_equal(foo_dbl_sum(c(xunif, NA_real_)), NA_real_)
})

