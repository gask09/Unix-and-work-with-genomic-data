# Proof that I know unix, GitHub and R
This repository contains a final excercise for a *Unix and work with genomic data*, or to be more accurate, an attempt to solve problem 6 *Proportion of transitions and transversions in total and by type of nucleotide*

## Shell script
For this no additional software is required. Only thing needed is terminal. 
### (Optional) Prepare a data directory
``` bash
cd ~/Desktop
mkdir NameOfFile 
```
To this directory, the shell script, a R script and data file should be moved manually or via **mv**:
``` bash
mv RScript.R ShellScript.sh luscinia_vars.vcf NameOfFile/
```
### Running Bash Script
To make shell script executable script, one needs to add **+x** permission via:
```bash
chmod +x ShellScript.sh
```
To run the script, type:
```bash
./ShellScript.sh
```
Or simply double click the icon.
Output of this script is **vystup.csv**, which is .csv file.

## R Script
No additional package is required, all packages should be already installed along with RStudio. 
To run script, just double click it and run in RStudio by pressing **CTRL+A** followed by hitting **CTRL+ENTER**, plot is saved to file, where the script is located. 
Alternatively from terminal, type (while still working in same directory): 
```bash
Rscript RPlotScript.r
```
Plot is saved to current directory (type **cd** to show).

### The Plot
![Rplot](https://user-images.githubusercontent.com/87470058/148463340-d113f7b8-dc7a-4eae-8c43-8b50122aa1f2.png)
