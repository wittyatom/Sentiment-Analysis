
source('util.R')

kPosText <- GetPositiveText()
kNegText <- GetNegativeText()

kPosTerms <- GetPositiveWords()
kNegTerms <- GetNegativeWords()



ComputeSentimentScores <- function(sentences){

  
  scores <- laply(sentences, ComputeSentimentScore)
  
  return(scores)
}

ComputeSentimentScore <- function(sentence, neg.terms=kNegTerms,
                                  pos.terms=kPosTerms) {
 
  orig.sentence <- sentence

  sentence <- tolower(gsub('\\d+', '', 
                           gsub('[[:cntrl:]]', '', 
                                gsub('[[:punct:]]', '', sentence))))

  words <- unlist(strsplit(sentence, '\\s+'))
 
  neg.matches <- sum(!is.na(match(words, neg.terms)))
  pos.matches <- sum(!is.na(match(words, pos.terms)))
  
  score <- c(orig.sentence, neg.matches, pos.matches)
  
  return(score)
}

pos.results <- cbind(as.data.frame(ComputeSentimentScores(kPosText)), 'positive')
neg.results <- cbind(as.data.frame(ComputeSentimentScores(kNegText)), 'negative')

colnames(pos.results) <- c('sentence', 'neg', 'pos', 'sentiment')
colnames(neg.results) <- c('sentence', 'neg', 'pos', 'sentiment')

total.results <- rbind(pos.results, neg.results)

total.results[,4] <- as.factor(total.results[,4])

NaiveBayesClassifier <- naiveBayes(total.results[,2:3], total.results[,4])

