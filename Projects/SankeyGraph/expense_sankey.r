library(networkD3)
library(htmlwidgets)

# 1️⃣ Define nodes
nodes <- data.frame(name = c("Income",
                             "Operations", "Marketing", "Payroll",
                             "Rent", "Utilities", "Ads", "Sponsorships", "Salaries", "Benefits"))

# 2️⃣ Define links (flows)
# Note: index is 0-based, so "Income" = 0, "Operations" = 1, etc.
links <- data.frame(
  source = c(0, 0, 0,   # Income to Operations, Marketing, Payroll
             1, 1,      # Operations to Rent, Utilities
             2, 2,      # Marketing to Ads, Sponsorships
             3, 3),     # Payroll to Salaries, Benefits
  target = c(1, 2, 3,
             4, 5,
             6, 7,
             8, 9),
  value =  c(4000, 2000, 6000,   # Income splits
             2500, 1500,         # Operations split
             1200, 800,          # Marketing split
             5000, 1000)         # Payroll split
)

# 3️⃣ Create the Sankey diagram
sankey <- sankeyNetwork(Links = links, Nodes = nodes,
                        Source = "source", Target = "target",
                        Value = "value", NodeID = "name",
                        fontSize = 12, nodeWidth = 30)

# 4️⃣ Save as HTML to view interactively
saveWidget(sankey, "expense_sankey.html", selfcontained = TRUE)

print("Sankey diagram created: expense_sankey.html")