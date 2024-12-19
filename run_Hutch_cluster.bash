#!/bin/bash
#
#SBATCH -c 8

snakemake -j 8 --software-deployment-method conda -s dms-vep-pipeline-3/Snakefile
