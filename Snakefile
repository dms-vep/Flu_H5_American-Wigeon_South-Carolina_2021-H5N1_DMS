"""Top-level ``snakemake`` file that runs analysis."""


import os


configfile: "config.yaml"


# include `dms-vep-pipeline` pipeline Snakemake file
include: os.path.join(config["pipeline_path"], "pipeline.smk")


rule all:
    input:
        variant_count_files,
        rules.check_adequate_variant_counts.output.passed,
        antibody_escape_files,
        (
            [config["muteffects_observed"], config["muteffects_latent"]]
            if len(func_selections)
            else []
        ),
        config["docs"],


# Arbitrary other rules should be added here
rule site_numbering_map:
    """Map sequential numbering of protein in experiments to standard reference."""
    input:
        prot=config["gene_sequence_protein"],
        reference_site_regions=config["reference_site_regions"],
    output:
        reference="results/site_numbering/numbering_reference.fa",
        alignment="results/site_numbering/alignment.fa",
        to_align="results/site_numbering/to_align.fa",
        site_numbering_map=config["site_numbering_map"],
    params:
        numbering_reference_accession=config["numbering_reference_accession"],
    log:
        os.path.join(config["logdir"], "site_numbering_map.txt"),
    conda:
        "dms-vep-pipeline/environment.yml"
    script:
        "scripts/site_numbering_map.py"

compare_escape_maps_config = (
    config["compare_escape_maps"] if "compare_escape_maps" in config else {}
)

rule compare_escape_maps:
    """Compare escape maps for COV2-2130 and 2130-1-0114-112."""
    input:
        antibodies=lambda wc: [
            os.path.join(config["escape_dir"], f"{antibody}.pickle")
            for antibody in compare_escape_maps_config[wc.comparison]
        ],
        muteffects=config["muteffects_observed"],
        polyclonal_config=config["polyclonal_config"],
        nb_noshow="notebooks/compare_escape_maps.ipynb",
    params:
        antibodies_yaml=lambda wc: (
            "{'antibodies': " + str(compare_escape_maps_config[wc.comparison]) + "}"
        ),
    output:
        chart="results/compare_escape_maps/{comparison}.html",
        nb_noshow="results/notebooks/compare_escape_maps_{comparison}.ipynb",
    log:
        os.path.join(config["logdir"], "compare_escape_maps_{comparison}.txt"),
    conda:
        "dms-vep-pipeline/environment.yml"
    shell:
        """
        papermill \
            -p chart_html {output.chart} \
            -y "{params.antibodies_yaml}" \
            {input.nb_noshow} \
            {output.nb_noshow} \
            &> {log}
        """

# Add any extra data/results files for docs with name: file
extra_data_files = {
    "sequential to reference site numbering": config["site_numbering_map"],
}

# add extra HTML documents with name: file
extra_html_docs = {
    comparison: f"results/compare_escape_maps/{comparison}.html"
    for comparison in compare_escape_maps_config
}

# include `dms-vep-pipeline` docs building Snakemake file
include: os.path.join(config["pipeline_path"], "docs.smk")
