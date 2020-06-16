pias_from_classification <- function(x, delim = "", start = 1) {
  stopifnot("x must be a character vector" = 
              is.vector(x, "character"),
            "delim must be a length 1 character" = 
              length(delim) == 1L && is.vector(delim, "character"),
            "start must be a length 1 integer" = 
              length(start) == 1L && is.vector(start, "numeric"),
            "start must be greater than or equal to 1" = 
              start >= 1
            # TO DO: what happends when start is too large?
            )
  # find all seqeuences of x from start onwards
  xs <- lapply(strsplit(x, delim, fixed = TRUE),
               function(x)
                 vapply(seq(as.integer(start), length(x)),
                        function(i)
                          paste0(x[seq_len(i)], collapse = delim),
                        character(1),
                        USE.NAMES = FALSE)
  )
  # keep the unique sequences
  xs <- sort(unique(unlist(xs, use.names = FALSE)))
  names(xs) <- xs
  # break up x by position
  # TO DO: make more efficient when delim != ""
  mn <- max(nchar(x), 0, na.rm = TRUE)
  len <- lapply(seq_len(mn), function(i) substr(x, 1, i))
  # find all the children for each sequence
  children <- lapply(xs, function(i) x[len[[nchar(i)]] == i])
  # find the immediate parent for each sequence
  parents <- lapply(strsplit(xs, delim, fixed = TRUE),
                    function(i) if (length(i) > start) paste0(i[-length(i)], collapse = delim) else "") 
  # output
  list(children = children, parents = parents)
}
