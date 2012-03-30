library(stringr)

set.seed(4)

n <- 1

header <- readChar("header.txt", 10000)
footer <- readChar("footer.txt", 10000)

chars <- read.csv("characters.csv", header = FALSE, as.is = TRUE)

for (i in 1:n){
  nc <- ncol(chars)
  id <- paste(sample(letters, 9, replace = TRUE), collapse="")
  taxa <- chars[, 1]
  block <- chars[, sample(2:nc, nc - 1)]
  
  mycon <- file(str_c("nex_files/", id, ".nex"), 
                open = "w", encoding = "UTF-8")
  writeChar(header, con = mycon, eos = NULL)
  write.table(cbind(taxa, " ", block), file = mycon, 
              row.names = FALSE, col.names = FALSE,
              sep = "", quote = FALSE)
  writeChar(footer, con = mycon,  eos = NULL)
  close(mycon) 
}

