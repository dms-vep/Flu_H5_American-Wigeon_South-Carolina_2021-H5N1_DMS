"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""


rule escape_summary:
    """Summarize escape across all sera alongside functional effects."""
    input:
        escape_csvs=expand(
            "results/antibody_escape/averages/{serum}_mut_escape.csv",
            serum=avg_antibody_escape_config,
        ),
        site_numbering_map_csv=config["site_numbering_map"],
        func_effects_csv="results/func_effects/averages/293T_entry_func_effects.csv",
        nb="notebooks_escape_summary.ipynb",
    output:
        chart="results/summaries/escape_summary.html",
        nb="results/notebooks/escape_summary.ipynb",
    params:
        sera_yaml=lambda _, input: yaml.dump(
            {"sera": dict(zip(list(avg_antibody_escape_config), input.escape_csvs))}
        ),
    conda:
        "dms-vep-pipeline-3/environment.yml"
    log:
        "results/logs/escape_summary.txt",
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p site_numbering_map_csv {input.site_numbering_map_csv} \
            -p func_effects_csv {input.func_effects_csv} \
            -p chart {input.chart} \
            -y "{params.sera_yaml}" \
            &> {log}
        """

docs["Escape and functional effects summary"] = {
    "Notebook summarizing escape and functional effects": rules.escape_summary.output.nb,
    "Chart summarizing escape and functional effects": rules.escape_summary.output.chart,
}

docs["Site numbering"] = {
    "Reference to sequential site-numbering map": config["site_numbering_map"],
}

