#!/bin/bash

## To a variable FILE assigns a path to data file
FILE=~/Desktop/luscinia_vars/luscinia_vars.vcf


## Removes everything but useful data - removes "random"
grep -v "^#" $FILE | grep -e 'chr[1-20]\s' -e 'chrZ\s' |
## Removes all INDELs from file and removes all useless (for further anaylsis) data 
awk '{if($0 !~ /INDEL/) {print $0}}' | cut -f1-6 | cut -f3 --complement | 
## Splits "multiple" SNPs, eg. A -> C,G to a A -> C, A-> G
awk '{
	
	if (length($4)>1) {
		split($4, nucl, ",");
		
		print($1 "\t" $2" \t" $3 "\t" nucl[1] "\t" $5);
		print($1 "\t" $2 "\t" $3 "\t" nucl[2] "\t" $5);
		
		if (length($4)==5) {
			print($1 "\t" $2 "\t" $3 "\t" nucl[3] "\t" $5);
		}	
	} else {
		print($0)	
	}

}' ##Creates two new columns and saves type of nucleotide (Pyridine x Purine)  
| awk '{
	if ($3 ~ /[AG]/) {
		print ($0 "\t" "Pur")
		}
	else if ($3 ~ /[CT]/){
		print ($0 "\t" "Pyr")
		}

}' | awk '
	BEGIN {print("CHROM" "\t" "POS" "\t" "MutFrom" "\t" "MutTo" "\t" "Q" "\t" "1NuType" "\t" "2NuType")}
	{
	if ($4 ~ /[AG]/) {
		print ($0 "\t" "Pur")
		}
	else if ($4 ~ /[CT]/){
		print ($0 "\t" "Pyr")
		}
}' 
##Replaces all tabs with commas and saves all the data to vystup.csv file
| tr "\t" "," > vystup.csv

echo "Done, output saved to vystup.csv"
