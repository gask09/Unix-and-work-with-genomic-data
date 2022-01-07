# Final excercise 
This repository contains a final excercise for a *Unix and work with genomic data*, or to be more accurate, an attempt to solve problem 6 *Proportion of transitions and transversions in total and by type of nucleotide*

## Shell script
For this no additional software is required. Only thing needed is terminal. 

As code is written in such way that it requires all the data to be located in single file, all required scripts and the data file (luscinia_vars.vcf) should be downloaded (or moved) into single file.

### Running Shell Script
To make shell script executable script, one needs to add **x** permission via:
```bash
chmod +x ShellScript.sh
```
To run the script, type:
```bash
./ShellScript.sh
```
Or simply double click the icon.
One of outputs of this script is **vystup.csv**, which is .csv file. This file is then indirectly fed to R script, which then returns a plot. 

### The Plot
![plot](https://user-images.githubusercontent.com/87470058/148593796-02e6115c-f345-497b-95af-d899283b71f2.png)

The plot is fairly simple, it contains three bars, each made of two parts. Number denotes relative frequency (i.e. number of transitions OR transversion divided by sum of transitions AND transversions) of transition/transversion, in total and by type of nucleotide - purine and pyridine. 
