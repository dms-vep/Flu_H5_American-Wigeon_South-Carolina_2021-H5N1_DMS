"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""
rule sialic_acid_entry:
    """Compare binding and escape at key sites."""
    input:
        nb="analysis_notebooks/SA_functional_scores.ipynb",
        SA23_csv="results/func_effects/averages/293_SA23_entry_func_effects.csv",
        SA26_csv="results/func_effects/averages/293_SA26_entry_func_effects.csv",
    output:
        nb="results/notebooks/SA_functional_scores.ipynb",
    params:
        yaml=lambda _, input, output: yaml.round_trip_dump(
            {
                "SA23_csv": input.SA23_csv,
                "SA26_csv": input.SA26_csv,
            }
        ),
    log:
        log="results/logs/SA_functional_scores.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        "papermill {input.nb} {output.nb} -y '{params.yaml}' &> {log}"

rule sialic_acid_entry_difference_summary:
    """Compare binding and escape at key sites."""
    input:
        nb="analysis_notebooks/SA_diff_summary.ipynb",
        diff_df="results/func_effect_diffs/SA26_vs_SA23_entry_diffs.csv",
    output:
        nb="results/notebooks/SA_diff_summary.ipynb",
        summary="results/func_effect_diffs/SA_diff_summary.csv"
    params:
        yaml=lambda _, input, output: yaml.round_trip_dump(
            {
                "diff_df": input.diff_df,
                "summary": output.summary,
            }
        ),
    log:
        log="results/logs/SA_diff_summary.txt",
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
        "Summary CSV for 2,3 vs 2,6 sialic acid entry": rules.sialic_acid_entry_difference_summary.output.summary,
    },
}

