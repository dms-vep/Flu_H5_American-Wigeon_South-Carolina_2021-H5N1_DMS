
# Design of mutagenesis primers for H5 deep mutational scanning libnrary

This subfolder comntains script required to create primers for saturating mutagenesis of H5 VEP.  

'3404_pH2rU3_ForInd_H5_H5N1_turkey_Indiana_twist_T7_CMV_ZsGT2APurR.gb' contains the plasmid map for H5 sequence in inducible lentiviral backbone used in deep mutational scanning.  

'H5_excessflank.txt' contains H5 sequence with flanking regions from the lentiviral backbone. Flanking regions are in lower case to indicate that these sequenced should not be mutated.  

'2021Jan_create_primers.py' is a python script that takes the H5 sequence in 'H5_excessflank.txt' and created tiled primers with 'NNG' or 'NNC' changes for each amino acid in the H5 sequence. It outputs 'H5_Primers_NNG.csv' and 'H5_Primers_NNC.csv' that can be used to order oPools from IDTDNA. 

To create primers run:  

```
python 2021Jan_create_primers.py H5_excessflank.txt H5 1 H5_Primers_NNG.csv --ambiguous_codon NNG --output opools --minprimertm 60.5 --maxprimertm 61.5

python 2021Jan_create_primers.py H5_excessflank.txt H5 1 H5_Primers_NNC.csv --ambiguous_codon NNC --output opools --minprimertm 60.5 --maxprimertm 61.5  
```
  
'oPool_primer_sheet.ipynb' notebook takes the primer sheets created by '2021Jan_create_primers.py' checks for distribution of primer annealing temperatures and creates 'oPool_df.csv' spreadsheet containing all primers that can be uploaded to the IDTDNA for ordering.

