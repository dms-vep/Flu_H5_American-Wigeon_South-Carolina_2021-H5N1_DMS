"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""
rule sialic_acid_entry:
    """Compare binding and escape at key sites."""
    input:
        nb="analysis_notebooks/SA_functional_scores.ipynb",
        SA23_csv="results/func_effects/averages/293_SA23_entry_func_effects.csv",
        SA26_csv="results/func_effects/averages/293_SA26_entry_func_effects.csv",
        c293T_csv="results/func_effects/averages/293T_entry_func_effects.csv",
    output:
        nb="results/notebooks/SA_functional_scores.ipynb",
    params:
        yaml=lambda _, input, output: yaml.round_trip_dump(
            {
                "SA23_csv": input.SA23_csv,
                "SA26_csv": input.SA26_csv,
                "c293T_csv": input.c293T_csv
            }
        ),
    log:
        log="results/logs/SA_functional_scores.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        "papermill {input.nb} {output.nb} -y '{params.yaml}' &> {log}"

rule summary_with_difference:
    """CMake summary CSV with all phenotypes"""
    input:
        nb="analysis_notebooks/phenotype_summary_file.ipynb",
        summary_file="results/summaries/summary.csv",
        diffs="results/func_effect_diffs/SA26_vs_SA23_entry_diffs.csv"
    output:
        nb="results/notebooks/phenotype_summary_file.ipynb",
        summary_with_diffs="results/summaries/summary_with_diffs.csv",
    params:
        yaml=lambda _, input, output: yaml.round_trip_dump(
            {
                "summary_file": input.summary_file,
                "diffs":  input.diffs,
                "summary_with_diffs": output.summary_with_diffs,
            }
        ),
    log:
        log="results/logs/diff_summary.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        "papermill {input.nb} {output.nb} -y '{params.yaml}' &> {log}"


# Files (Jupyter notebooks, HTML plots, or CSVs) that you want included in
# the HTML docs should be added to the nested dict `docs`:
docs["Additional data files"] = {
    "HA site numbering": {
        "CSV converting among different protein numbering schemes":
            config["site_numbering_map"],
        "Notebook comparing entry between 2,3 and 2,6 sialic acid expressing cells": rules.sialic_acid_entry.output.nb,
        "Summary CSV for all phenotypes": rules.summary_with_difference.output.summary_with_diffs,
    },
}

