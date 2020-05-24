context("Functions")

test_that("foo_hello()", {
  expect_equal(foo_hello(), "Hello, world.")
})

test_that("foo_int()", {
  expect_equal(foo_int(), 42L)
})

test_that("foo_dbl()", {
  expect_equal(foo_dbl(), 4.2)
})
