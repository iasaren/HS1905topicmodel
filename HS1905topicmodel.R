library(topicmodels)
library(tm)
library(LDAvis)

# Load corpus and preprocess
corpus <- VCorpus(DirSource("/srv/data/fnewspapers/nlf_rawtext_fin/",pattern="fin_0355-2047_1905.*lemmatized"))
corpus <- tm_map(corpus,content_transformer(tolower))
corpus <- tm_map(corpus,removeNumbers)
corpus <- tm_map(corpus,removePunctuation)
corpus <- tm_map(corpus,removeWords,c(stopwords("fi"),"omorfiversiongnugplv", "klo", "pnä", "tel", "trl"))
corpus <- tm_map(corpus,stripWhitespace)
doc_term <- DocumentTermMatrix(corpus)
                 
#had to do this to remove error that had something to do with empty lines/documents in the document term matrix
doc_term <- removeSparseTerms(doc_term, 0.99)
rowTotals <- apply(doc_term , 1, sum) #Find the sum of words in each Document
doc_term   <- doc_term[rowTotals> 0, ] #Remove all docs without words
                 
# Do LDA
set.seed(43523) # for reproducibility
numtopics <- 20
lda <- LDA(doc_term, numtopics)
                 
# Write out LDA results
write.csv(posterior(lda)$topics,"lda-documents-topics.csv")
write.csv(topics(lda),"document-main-topic.csv")
write.csv(posterior(lda)$terms,"lda-terms-topics.csv")
write.csv(terms(lda,50),"topic-50-main-terms.csv")
                 
json <- createJSON(phi = exp(lda@beta), theta = lda@gamma,
                                    doc.length = rowSums(as.matrix(doc_term)), vocab = lda@terms,
                                    term.frequency = colSums(as.matrix(doc_term)))
serVis(json)
                 