# analysis.R
# Minimal demonstration of R workflow

# Create a numeric vector
# c is used to combine values into a vector, it is short for "combine"
scores <- c(88, 92, 60, 85, 90)

# Calculate mean
# mean is a function that is provided by R to calculate the average of a numeric vector
avg_score <- mean(scores)
print(paste("Average score is:", avg_score))

# Create and save a plot
# png is a function that creates a PNG file for the plot
png("scores_plot.png")
# barplot is a function that creates a bar plot from the provided data
barplot(scores,
        names.arg = c("A", "B", "C", "D", "E"),
        col = "skyblue",
        main = "Scores of Students",
        ylab = "Score",
        ylim = c(0, 100))
        
# dev.off is used to close the device and save the file
invisible(dev.off())

# To run this script, you can use the command line:
# Rscript analysis.R