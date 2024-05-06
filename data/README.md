# Input data
This subdirectory contains input data used by the pipeline.

## PacBio full-length variant sequencing to link barcodes

[PacBio_amplicon.gb](PacBio_amplicon.gb): Genbank file having features to parse with [alignparse](https://jbloomlab.github.io/alignparse/). Has H5 HA marked as *gene* (the gene of interest) and *barcode* site annotated.

[PacBio_feature_parse_specs.yaml](PacBio_feature_parse_specs.yaml): How to parse the PacBio amplicon using [alignparse](https://jbloomlab.github.io/alignparse/).

[PacBio_runs.csv](PacBio_runs.csv): List of PacBio CCS FASTQs used to link barcodes to variants.
It must have the following columns:

 - `library`: name of the library
 - `run`: name of the sequencing run, must be unique
 - `fastq`: FASTQ file from running CCS

## Site numbering
[site_numbering_map.csv](site_numbering_map.csv): Maps several different numbering shcemes for HA. Columns in the spreadsheet include: *sequential_site* (sequential numbering of H5 HA 1,2,3...), *reference_site* (H3 reference numbering applied to H5 HA), *reference_H1_site* (H1 numbering applied to H5 HA), *mature_H5_site* (H5 HA sequential numbering starting after signal peptide), *HA1_HA2_H5_site* (Sequential H5 HA HA1 and HA2 ), *region* (assigns each site to a region of the protein).

## Mutation-type classification
[data/mutation_design_classification.csv](data/mutation_design_classification.csv) classifies mutations into the different categories of designed mutations.
Has columns *sequential_site*, *amino_acid*, and *mutation_type*.

## Neutralization standard barcodes
[neutralization_standard_barcodes.csv](neutralization_standard_barcodes.csv) barcodes for the neutralization standards.
Has columns *barcode* and *name*, giving the barcode and name of this neutralization standard set.

## Barcode runs
[barcode_runs.csv](barcode_runs.csv) contains all samples and paths to sequencing files. It has the following format:

 - `sample`: sample name
 - `library`: name of library
 - `date`: date of sequencing
 - `fastq_R1`: path to one more FASTQ R1 sequencing files, multiple files should be semicolon-delimited

## Configuration for analyzing functional effects of mutations
[func_effects_config.yml](func_effects_config.yml) has the configuration for analyzing functional effects of mutations.
The format is explained within the file.

## Configuration for analyzing escape
[antibody_escape_config.yml](antibody_escape_config.yml) has the configuration for analyzing escape from antibodies, stability treatment, etc.

## Configuration for summaries across assays
[summary_config.yml](summary_config.yml) has the configuration for making summaries across assays.
