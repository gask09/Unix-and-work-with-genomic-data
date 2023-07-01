# Final excercise 
This repository contains a final excercise for a *Unix and work with genomic data*, or to be more accurate, an attempt to solve problem 6 *Proportion of transitions and transversions in total and by type of nucleotide*

## Shell script
To run the shell script no additional software is needed. 

As code is written in a way that it requires all the files to be located in single directory, all required scripts and the data file (luscinia_vars.vcf) should be downloaded (or moved) into single directory. After that, switch to this directory via **cd** command.

### Running Shell Script
To make shell script executable, one needs to add **x** permission:
```bash
chmod +x ShellScript.sh
```
To run the script, type:
```bash
./ShellScript.sh
```
Or right-click the icon, and select **Run as a program**.

One of outputs of this script is **vystup.csv**, which is .csv file. This file is then fed to R script, which then returns a plot. 

### Output: Plot
![plot](https://user-images.githubusercontent.com/87470058/148593796-02e6115c-f345-497b-95af-d899283b71f2.png)

The plot is fairly simple, it contains three bars, each made of two boxes. Decimal number inside of blue box denotes relative frequency (i.e. number of transitions OR transversion divided by sum of transitions AND transversions) of transition/transversion, in total and by type of nucleotide - purine and pyridine. 
