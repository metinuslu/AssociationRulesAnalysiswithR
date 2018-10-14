
cat("Export Other Format: edgelist, graphml, gml, dot")

if (file.exists("./Output/8-OtherGraphFormat") == FALSE){
  dir.create(file.path("./Output/8-OtherGraphFormat"))
}

Tip <- c("items", "itemsets")
Format <- c("edgelist", "graphml", "dimacs", "gml", "dot")

for (t in Tip){
  for (f in Format){
    if (f == "dimacs"){
      next
    }
    saveAsGraph(BasketRules, paste0("./Output/8-OtherGraphFormat/BasketRules_", t, ".", f), type=t, format=f)
  }
}