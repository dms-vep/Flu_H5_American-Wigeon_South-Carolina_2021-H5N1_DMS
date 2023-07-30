"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""


rule all_sera_escape:
    """Summarize escape across all sera."""
    input:
        escape_csvs=expand(
            "results/antibody_escape/averages/{serum}_mut_escape.csv",
            serum=avg_antibody_escape_config,
        ),
        site_numbering_map_csv=config["site_numbering_map"],
        func_effects_csv="results/func_effects/averages/293T_entry_func_effects.csv",
        nb="notebooks/all_sera_escape.ipynb",
    output:
        nb="results/notebooks/all_sera_escape.ipynb",
    params:
        sera_yaml=lambda _, input: yaml.dump(
            {"sera": dict(zip(list(avg_antibody_escape_config), input.escape_csvs))}
        ),
    conda:
        "dms-vep-pipeline-3/environment.yml"
    log:
        "results/logs/all_sera_escape.txt",
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p site_numbering_map_csv {input.site_numbering_map_csv} \
            -p func_effects_csv {input.func_effects_csv} \
            -y "{params.sera_yaml}" \
            &> {log}
        """

docs["Escape summarized across all sera"] = {
    "Notebook combining escape for all sera": rules.all_sera_escape.output.nb,
}

docs["Site numbering"] = {
    "Reference to sequential site-numbering map": config["site_numbering_map"],
}

