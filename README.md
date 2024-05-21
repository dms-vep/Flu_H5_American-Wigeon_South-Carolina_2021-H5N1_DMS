# Deep mutational scanning of H5N1 influenza haemagglutinin using a barcoded lentiviral platform (strain A/American Wigeon/South Carolina/USDA-000345-001/2021)
Study by Bernadeta Dadonaite, Jesse Bloom, et al.

This repository has the code and data.
For rendering of key results and an easy-to-interpret summary, see the documentation of the analysis at [https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS](https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS)

A JSON file with the results for visualization with [dms-viz](https://dms-viz.github.io/) is created by the pipeline, and can be viewed at [this link](https://dms-viz.github.io/v0/?data=https%3A%2F%2Fraw.githubusercontent.com%2Fdms-vep%2FFlu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS%2Fmain%2Fresults%2Fdms-viz%2Fdms-viz.json).

## Organization of this repo

### `dms-vep-pipeline-3` submodule

Most of the analysis is done by the [dms-vep-pipeline-3](https://github.com/dms-vep-3/dms-vep-pipeline-3), which was added as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to this pipeline via:

    git submodule add https://github.com/dms-vep/dms-vep-pipeline-3

This added the file [.gitmodules](.gitmodules) and the submodule [dms-vep-pipeline-3](dms-vep-pipeline-3), which was then committed to the repo.
Note that if you want a specific commit or tag of [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3) or to update to a new commit, follow the [steps here](https://stackoverflow.com/a/10916398), basically:

    cd dms-vep-pipeline-3
    git checkout <commit>

and then `cd ../` back to the top-level directory, and add and commit the updated `dms-vep-pipeline-3` submodule.
You can also make changes to the [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3) that you commit back to that repo.

### Configuration and runing the pipeline
The configuration for the pipeline is in [config.yaml](config.yaml) and the files in [./data/](data) referenced therein.
To run the pipeline, do:

    snakemake -j 8 --software-deployment-method conda -s dms-vep-pipeline-3/Snakefile

To run on the Hutch cluster via [slurm](https://slurm.schedmd.com/), you can run the file [run_Hutch_cluster.bash](run_Hutch_cluster.bash):

    sbatch -c 8 run_Hutch_cluster.bash

### Input data
Input data for the pipeline are in [./data/](data).

### Results and documentation
The results of running the pipeline are placed in [./results/](results).
Only some of these results are tracked to save space (see [.gitignore](.gitignore)).

The pipeline builds HTML documentation for the pipeline in [./docs/](docs), which can be rendered via GitHub Pages.
For this repo, nice VitePress documentation was then built to render on GitHub Pages by following the instructions in [homepage](homepage).

### Library design
The description of the mutant library design is contained in [./library_design/](library_design).
