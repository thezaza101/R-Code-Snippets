formatDate <- function(x) {
  output <- x
  if (grepl('-', x, fixed = TRUE)) {
    xx <- strsplit(x,'-',TRUE)
    output <- paste(xx[[1]][3],xx[[1]][2],xx[[1]][1],sep="/")
  }
  return(output)
}