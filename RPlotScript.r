#install.packages("dplyr")
library(dplyr)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("devtools")
library(devtools)

#Loads output file from bash
OutputFile <- read.csv("vystup.csv")

#Creates a vector containing information of SNP type
Trans <- c()
for (a in 1:length(OutputFile$Q)) {
  if (OutputFile$X1NuType[a] == OutputFile$X2NuType[a]) {
    Trans <- append(Trans, "Transition")
  }
  else {
    Trans <- append(Trans, "Transversion")
  }
}

#Merges data
SNPbyPOS <- tibble(OutputFile$POS, OutputFile$X1NuType, OutputFile$X2NuType, Trans)
#Changes names to something shoreter
names(SNPbyPOS) <- c("POS", "MutFromType", "MutToType", "Trans")

#Trims data
Pyrs <- filter(SNPbyPOS, MutFromType == "Pyr")
Purs <- filter(SNPbyPOS, MutFromType == "Pur")

#Counts transversion and transitions
NumberOfSNPsInTotal <- table(SNPbyPOS$Trans)
NumberOfPyrs <- table(Pyrs$Trans)
NumberOfPurs <- table(Purs$Trans)

#Creates dataframe for ggplot, relative occurrence of each type of SNP is calculated
dataNames <- c("Total", "Purines", "Pyridines", "Total", "Purines", "Pyridines")
Types <- c("Transition", "Transition", "Transition", "Transversion", "Transversion", "Transversion")
data <- c(NumberOfSNPsInTotal[1]/length(SNPbyPOS$POS), NumberOfPurs[1]/length(Purs$POS), NumberOfPyrs[1]/length(Pyrs$POS), NumberOfSNPsInTotal[2]/length(SNPbyPOS$POS), NumberOfPurs[2]/length(Purs$POS), NumberOfPyrs[2]/length(Pyrs$POS))
data <- round(data, digits = 3)
LabelHeight <- c(data[4], data[5], data[6], 1, 1, 1)
df = tibble(dataNames, Types, data, LabelHeight)

#Finally, a plot
ggplot(data=df, aes(x=dataNames, y=data, fill=Types)) +
  geom_bar(stat="identity") + 
  labs(x = element_blank(), y = "Ratio of each type of SNP") +
  geom_text(aes(y=LabelHeight, label=data), vjust=1.6, color="white", size=3.5)

ggsave("plot.png")
