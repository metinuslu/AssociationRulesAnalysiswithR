
# Association Rules Analysis with R Project ----------------------------

# Clean the System & Console Variable --------------------
rm(list = ls())
cat("\014")
options(warn = -1)

# Sys_Date <- format(Sys.Date(), "%Y%m%d")
# Sys_Time <- format(Sys.time(), "%H:%M:%S")

# Install & Use Library ---------------------------------------------------
if (require('arules') == FALSE){
  install.packages('arules')
  library(arules)
}

if (require('arulesViz') == FALSE){
  install.packages('arulesViz')
  library(arulesViz)
}

if (require('htmlwidgets') == FALSE){
  install.packages('htmlwidgets')
  library(htmlwidgets)
}

# Set the System Path & Variable
if (require('here') == FALSE){
  install.packages('here')
  library(here)
}

Path <- here()

setwd(Path)

# Load Dataset

Groceries = read.transactions(file = "./Input/groceries.csv",
                              format = c("basket"),
                              sep= ",",
                              cols = NULL,
                              rm.duplicates = TRUE,
                              encoding = "UTF-8")

# Second Way Data Load 
# data(Groceries)

# Show Type and Class of Dataset
typeof(Groceries)
class(Groceries)

# Dimension of Dataset
dim(Groceries)
length(Groceries)

# Structure of Dataset
str(Groceries)

# Show The Dataset
# inspect(Groceries)
inspect(Groceries[1:10])

# Show the Items
ItemSetList <- Groceries@itemInfo
ItemSetList

# First 5 items of DataSet 
head(ItemSetList, n=10)
head(Groceries@itemInfo, n=10)

# End 5 items of DataSet 
tail(ItemSetList, n=10)
tail(Groceries@itemInfo, n=10)

# Summary of Dataset
summary(Groceries)
s <- summary(Groceries)

# Most Frequent Items
s@itemSummary

# Length Distribution Size
s@lengths

# frequency/support
itemFrequency(Groceries, type = "relative")

# frequency/support (Items Count)
itemFrequency(Groceries, type = "absolute")

# Item Frequency Plot

jpeg(filename = "./Output/1-Absolute_ItemFrequencyPlot.jpg", width=1024, height=768, units="px")
itemFrequencyPlot(Groceries, topN=25, type="absolute",
                  main='Absolute Item Frequency Plot (Top 25)', 
                  xlab="Items", 
                  ylab="Item Frequency (Absolute)")
dev.off()

jpeg(filename = "./Output/2-Relative_ItemFrequencyPlot.jpg", width=1024, height=768, units="px")
itemFrequencyPlot(Groceries, topN=25, type="relative",
                  main='Relative Item Frequency Plot (Top 25)', 
                  xlab="Items", 
                  ylab="Item Frequency (relative)")
dev.off()


# Both Association Rules
options(digits = 2)
min_supp <- 0.01
min_conf <- 0.25
min_lenght <- 2
BasketRules <- apriori(Groceries, parameter = list(supp = min_supp, conf = min_conf,
                                                   minlen = min_lenght, target = "rules"))

summary(BasketRules)

# inspect(BasketRules)
inspect(BasketRules[1:25])

inspect(head(BasketRules, n=5))
inspect(tail(BasketRules, n=5))

cat(paste0("\n","Association Rules  Analysis", "\n",
           "= = = = = = = = = = = = = =", "\n",
           "Min. Supp. & Conf. Values:", "\t", min_supp, " & ", min_conf, "\n",
           "X ==> Y Rules Count:", "\t\t", length(BasketRules)))


BasketRules_Conf <- sort(BasketRules, by="confidence", decreasing=TRUE)
BasketRules_Supp <- sort(BasketRules, by="support", decreasing=TRUE)
BasketRules_Lift <- sort(BasketRules, by="lift", decreasing=TRUE)

inspect(head(BasketRules_Conf, n=5))
inspect(tail(BasketRules_Conf, n=5))

inspect(head(BasketRules_Supp, n=5))
inspect(tail(BasketRules_Supp, n=5))

inspect(head(BasketRules_Lift, n=5))
inspect(tail(BasketRules_Lift, n=5))

# Export Graph
source('Graph.R')

# Export Interactive Graph
source('InteractiveGraph.R')

# Export Other Graph Format: edgelist, graphml, gml, dot
source('OtherGraph.R')

# Export The Rules
BasketRules_DF <- as(BasketRules, "data.frame")
write.csv2(BasketRules_DF, file = "./Output/BasketRules.csv", row.names = FALSE)

# Export Interactive HTML The Rules
html_page <- inspectDT(BasketRules)
saveWidget(html_page, file = paste0(Path, "/Output/", "BasketRules.html"), selfcontained = FALSE)
# inspectDT(BasketRules)
# browseURL(paste0(Path, "/Output/", "BasketRules.html"), browser = getOption("browser"), encodeIfNeeded = FALSE)

save.image(file = "./Output/BasketRules.RData")
