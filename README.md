# Deep mutational scanning of H5N1 influenza haemagglutinin using a barcoded lentiviral platform (strain A/American Wigeon/South Carolina/USDA-000345-001/2021)
Study by [Dadonaite et al, bioRxiv (2024)](https://doi.org/10.1371/journal.pbio.3002916).

This repository has the code and data.
For rendering of key results and an easy-to-interpret summary, see the documentation of the analysis at [https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS](https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS)

A JSON file with the results for visualization with [dms-viz](https://dms-viz.github.io/) is created by the pipeline, and can be viewed at [this link](https://dms-viz.github.io/v0/?data=https%3A%2F%2Fraw.githubusercontent.com%2Fdms-vep%2FFlu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS%2Fmain%2Fresults%2Fdms-viz%2Fdms-viz.json).

## Organization of this repo

### `dms-vep-pipeline-3` submodule

Most of the analysis is done by the [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3), which was added as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to this pipeline via:

    git submodule add https://github.com/dms-vep/dms-vep-pipeline-3

This added the file [.gitmodules](.gitmodules) and the submodule [dms-vep-pipeline-3](dms-vep-pipeline-3), which was then committed to the repo.
Note that if you want a specific commit or tag of [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3) or to update to a new commit, follow the [steps here](https://stackoverflow.com/a/10916398), basically:

    cd dms-vep-pipeline-3
    git checkout <commit>

and then `cd ../` back to the top-level directory, and add and commit the updated `dms-vep-pipeline-3` submodule.
You can also make changes to the [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3) that you commit back to that repo.

### Configuration and running the pipeline
The configuration for the pipeline is in [config.yaml](config.yaml) and the files in [./data/](data) referenced therein.
To run the pipeline, do:

    snakemake -j 8 --software-deployment-method conda -s dms-vep-pipeline-3/Snakefile

To run on the Hutch cluster via [slurm](https://slurm.schedmd.com/), you can run the file [run_Hutch_cluster.bash](run_Hutch_cluster.bash):

    sbatch -c 8 run_Hutch_cluster.bash

### Running the pipeline without the FASTQ files
Running the full pipeline in this repo requires access to large FASTQ files with the deep sequencing data.
Those FASTQ files are far too large to store in this GitHub repo, so need to be stored elsewhere on your computing cluster.
The locations where they are stored on the Fred Hutch computing cluster are specified in [./data/PacBio_runs.csv](data/PacBio_runs.csv) and [./data/barcode_runs.csv](data/barcode_runs.csv); if you want to run the full pipeline on another cluster then you will need to obtain all these FASTQ files, download them to your cluster, and then update the paths in the two aforementioned files to point to the locations where you downloaded the files.

But alternatively, for most purposes it should be sufficient for you to re-run the pipeline not going all the way back to the FASTQ files, but rather just using the variants and barcode counts already extracted from these FASTQs by the original analysis on the Hutch cluster.
Those variants and barcode counts files are much smaller and so can be stored in this repo.
To re-run the pipeline using those so that the FASTQs are not required, follow the [instructions here](https://github.com/dms-vep/dms-vep-pipeline-3?tab=readme-ov-file#re-running-the-pipeline-without-the-fastq-files) which only require you to change teh values for `prebuilt_variants`, `prebuilt_geneseq`, and `use_precomputed_barcode_counts` in [config.yaml](config.yaml) to be as follows:

    prebuilt_variants: results/variants/codon_variants.csv  # use codon-variant table already in repo
    prebuilt_geneseq: results/gene_sequence/codon.fasta  # use gene sequence already in repo
    ...
    use_precomputed_barcode_counts: false  # use barcode counts already in repo

### Input data
Input data for the pipeline are in [./data/](data). Raw sequencing files for both PacBio and Illumina sequencing can be found under [PRJNA1123200 BioProject](https://www.ncbi.nlm.nih.gov/sra/PRJNA1123200) on SRA. Sequencing data was uploaded to SRA using scripts and instructions provided in [./sra_upload/](sra_upload).

### Results and documentation
The results of running the pipeline are placed in [./results/](results).
Only some of these results are tracked to save space (see [.gitignore](.gitignore)).

The pipeline builds HTML documentation for the pipeline in [./docs/](docs), which can be rendered via GitHub Pages.
For this repo, nice VitePress documentation was then built to render on GitHub Pages by following the instructions in [homepage](homepage).

### Library design
The description of the mutant library design is contained in [./library_design/](library_design).
