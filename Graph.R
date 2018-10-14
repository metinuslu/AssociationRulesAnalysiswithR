
cat("Export Graph for BasketRules")

jpeg(filename = "./Output/3-BasketRules_ScatterPlot.jpg", width=1024, height=768, units="px")
plot(BasketRules, main="Scatter Plot for Association TelcoRules")
dev.off()

jpeg(filename = "./Output/4-BasketRules_GroupedPlot.jpg", width=1024, height=768, units="px")
plot(BasketRules, method="grouped", main="Grouped Matrix for Groceries")
dev.off()

jpeg(filename = "./Output/5-BasketRules_GraphPlot.jpg", width=1024, height=768, units="px")
plot(BasketRules[1:25], method="graph", control=list(alpha="1"), main="Graph Method for Groceries")
dev.off()

jpeg(filename = "./Output/6-BasketRules_Paracoord.jpg", width=1024, height=768, units="px")
plot(BasketRules, method ="paracoord", control = list(reorder = TRUE), main="GraphName6")
dev.off()