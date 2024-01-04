# Examples

# For a complete list of Base R datasets, use
library(help = "datasets")

install.packages("IMIFA")
require(IMIFA)
data("olive", package = "IMIFA")
str(olive)

# plasma ferritin concentration level values for female athletes in the ais data set in MoEClust package
install.packages("MoEClust")
library(MoEClust)
data(ais)
femFe <- subset(ais, sex == "female")$FE

par(mfrow = c(1,2))
hist( , main = "")
