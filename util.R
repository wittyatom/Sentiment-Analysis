GetAfinnWordlist <- function() {

  afinn_list <- read.delim(file='data/AFINN-111.txt', header=FALSE,
                           stringsAsFactors=FALSE)
  
  names(afinn_list) <- c('word', 'score')
  
  afinn_list$word <- tolower(afinn_list$word)
  
  return(afinn_list)
}

GetPositiveWords <- function() {
 
  positive.words <- readLines("data/positive-words.txt", encoding="latin1")
  
  return(positive.words)
}

GetNegativeWords <- function() {
 
  negative.words <- readLines("data/negative-words.txt", encoding="latin1")
  
  return(negative.words)
}

GetPositiveText <- function() {
 
  pos.tweets <- readLines("data/positive-tweets.txt", encoding="UTF-8")
  pos.reviews <- readLines("data/rt-polarity-pos.txt", encoding="latin1")
  
  return(append(pos.tweets, pos.reviews))
}

GetNegativeText <- function() {
  
  neg.tweets <- readLines("data/negative-tweets.txt", encoding="UTF-8")
  neg.reviews <- readLines("data/rt-polarity-neg.txt", encoding="latin1")
  
  return(append(neg.tweets, neg.reviews))
}

GetNeutralText <- function() {
 
  neutral.tweets <- readLines("data/neutral-tweets.txt", encoding="UTF-8")
  
  return(neutral.tweets)
}