context("git helpers")


oldwd <- getwd()
setwd(testRepodir)

test_that("isValidRepo", {

})

test_that("isDataIgnored", {

})

test_that("getGitMeta", {
              g <- getGitMeta()
              expect_equal(g$branch,"master")
              expect_equal(g$remote,"https://example.org/testrepo/")

})

setwd(oldwd)
