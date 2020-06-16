x <- c("111", "112", "121")
y <- c("1.1.1", "1.1.2", "1.2.1")

pias_x <- list(
  children = list("1" = c("111", "112", "121"),
                  "11" = c("111", "112"),
                  "111" = c("111"),
                  "112" = c("112"),
                  "12" = c("121"),
                  "121" = c("121")),
  parents = list("1" = c(""),
                 "11" = c("1"),
                 "111" = c("11"),
                 "112" = c("11"),
                 "12" = c("1"),
                 "121" = c("12"))
)

pias_y <- list(
  children = list("1" = c("1.1.1", "1.1.2", "1.2.1"),
                  "1.1" = c("1.1.1", "1.1.2"),
                  "1.1.1" = c("1.1.1"),
                  "1.1.2" = c("1.1.2"),
                  "1.2" = c("1.2.1"),
                  "1.2.1" = c("1.2.1")),
  parents = list("1" = c(""),
                 "1.1" = c("1"),
                 "1.1.1" = c("1.1"),
                 "1.1.2" = c("1.1"),
                 "1.2" = c("1"),
                 "1.2.1" = c("1.2"))
)

stopifnot(
  exprs = {
    all.equal(pias_from_classification(x), pias_x)
    all.equal(pias_from_classification(y, delim = "."), pias_y)
    all.equal(
      pias_from_classification(x, start = 3), 
      list(children = list("111" = "111", "112" = "112", "121" = "121"),
           parents = list("111" = "", "112" = "", "121" = ""))
      )
  },
  local = getNamespace("pias")
)
