
cat("Interactive Graph")

if (file.exists("./Output/7-InteractiveGraph/") == FALSE){
  dir.create(file.path("./Output/7-InteractiveGraph/"))
}

ip1 <- plotly_arules(BasketRules, measure = c("support", "confidence"), shading = "lift")
saveWidget(ip1, file = paste0(Path, "/Output/7-InteractiveGraph/", "InteractiveGraph-1.html"), selfcontained = FALSE)

ip2 <- plotly_arules(BasketRules, measure = c("support", "lift"), shading = "confidence")
saveWidget(ip2, file = paste0(Path, "/Output/7-InteractiveGraph/", "InteractiveGraph-2.html"), selfcontained = FALSE)

ip3 <- plotly_arules(BasketRules, method = "two-key plot", measure = c("support", "confidence"))
saveWidget(ip3, file = paste0(Path, "/Output/7-InteractiveGraph/", "InteractiveGraph-3.html"), selfcontained = FALSE)

ip4 <- plotly_arules(BasketRules, method = "two-key plot", measure = c("support", "lift"))
saveWidget(ip4, file = paste0(Path, "/Output/7-InteractiveGraph/", "InteractiveGraph-4.html"), selfcontained = FALSE)

ip5 <- plotly_arules(BasketRules, method = "matrix", measure = c("support", "lift"), shading = "confidence")
saveWidget(ip5, file = paste0(Path, "/Output/7-InteractiveGraph/", "InteractiveGraph-5.html"), selfcontained = FALSE)

ip6 <- plotly_arules(BasketRules, method = "matrix", measure = c("support", "confidence"), shading = "lift")
saveWidget(ip6, file = paste0(Path, "/Output/7-InteractiveGraph/", "InteractiveGraph-6.html"), selfcontained = FALSE)