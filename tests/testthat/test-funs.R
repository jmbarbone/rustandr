context("Functions")

test_that("foo_hello()", {
  expect_equal(foo_hello(), "Hello, world.")
})

test_that("foo_int()", {
  expect_equal(foo_int(), 42L)
  expect_equal(foo_int_sq(), 42L^2)
  expect_equal(foo_intx(), 42L)
  expect_equal(foo_intx(17L), 17L)
  expect_error(foo_intx(4.2))
})

test_that("foo_dbl()", {
  expect_equal(foo_dbl(), 4.2)
  expect_equal(foo_dbl_sq(), 4.2^2)
  expect_equal(foo_dblx(), 4.2)
  expect_equal(foo_dblx(1.7), 1.7)
  expect_error(foo_dblx(42L), NA)
  expect_equal(foo_dblx(42L), 42)
})
