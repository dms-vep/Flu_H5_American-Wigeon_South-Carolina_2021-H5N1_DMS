
# Plasmid mutagenesis analysis

This sub-folder contains script required to analyse mutation frequencies in the four H5 plasmid DMS libraries produced for this project. The four libraries are as follows:  

`Lib1_10` Library 1 produced with one round of mutagenesis using 10 PCR cycles.   
`Lib1_10-8` Library 1 produced with two rounds of mutagenesis using 10 and 8 PCR cycles, respectively.   

`Lib2_10` Library 2 produced with one round of mutagenesis using 10 PCR cycles.   
`Lib2_10-8` Library 2 produced with two rounds of mutagenesis using 10 and 8 PCR cycles, respectively. 

Analysis was performed with code described [here](https://github.com/jbloomlab/SangerMutantLibraryAnalysis).

To run the analysis go to each library folder and run:  

```
python analyze_library.py --seqfile H5_twist.fa [--mfile MUTATION_FILE.txt] --mutstart 1  [--outputprefix LIBRARY_NAME] 
```
