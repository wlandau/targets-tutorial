test_that("choices()", {
  expect_equal(choices("b", a = 1L, b = 2L), 2L)
})

test_that("yes()", {
  expect_message(yes("abc"))
})

test_that("no()", {
  expect_message(yes("abc"))
})

test_that("issue()", {
  expect_message(issue())
})

test_that("invalid()", {
  expect_message(invalid())
})
