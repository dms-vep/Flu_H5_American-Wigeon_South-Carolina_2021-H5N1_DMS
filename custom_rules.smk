"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""


rule nt_changes_to_codon:
    """Annotate how nucleotide changes to codon required for each amino-acid mutation."""
    input:
        natural_geneseq="data/American_Wigeon_H5N1_HA_EPI2709137.fa",
        site_numbering_map=config["site_numbering_map"],
        pacbio_amplicon=config["pacbio_amplicon"],
    output:
        annotations=config["mutation_annotations"],
    log:
        notebook="results/logs/nt_changes_to_codon.ipynb"
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    notebook:
        "analysis_notebooks/nt_changes_to_codon.py.ipynb"


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

rule phenotypes_summary:
    """make summary CSV with all phenotypes"""
    input:
        nb="analysis_notebooks/phenotype_summary.ipynb",
        summary_file="results/summaries/summary.csv",
        diffs="results/func_effect_diffs/SA26_vs_SA23_entry_diffs.csv"
    output:
        nb="results/notebooks/phenotype_summary.ipynb",
        phenotypes_summary="results/summaries/phenotypes_summary.csv",
    params:
        yaml=lambda _, input, output: yaml.round_trip_dump(
            {
                "summary_file": input.summary_file,
                "diffs":  input.diffs,
                "phenotypes_summary": output.phenotypes_summary,
            }
        ),
    log:
        log="results/logs/phenotypes_summary.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        "papermill {input.nb} {output.nb} -y '{params.yaml}' &> {log}"

rule functional_effect_distribution:
    """Plot functional effect dristribution for structural elements of HA"""
    input:
        nb="analysis_notebooks/functional_effect_distribution.ipynb",
        effects_csv="results/func_effects/averages/293T_entry_func_effects.csv",
        structure_csv="data/structure_map.csv",
    output:
        nb="results/notebooks/functional_effect_distribution.ipynb",
    params:
        yaml=lambda _, input, output: yaml.round_trip_dump(
            {
                "effects_csv": input.effects_csv,
                "structure_csv": input.structure_csv
            }
        ),
    log:
        log="results/logs/functional_effect_distribution.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    shell:
        "papermill {input.nb} {output.nb} -y '{params.yaml}' &> {log}"

# Files (Jupyter notebooks, HTML plots, or CSVs) that you want included in
# the HTML docs should be added to the nested dict `docs`:
docs["Additional files"] = {
    "HA site numbering": {
        "CSV converting among different protein numbering schemes":
            config["site_numbering_map"],
    },
    "Cell entry effect comparison":{
        "Notebook comparing entry between 2,3 and 2,6 sialic acid expressing cells":
            rules.sialic_acid_entry.output.nb
    },
    "Phenotype summary file":{
        "Summary CSV for all phenotypes":
            rules.phenotypes_summary.output.phenotypes_summary,
    },
    "Functional effect distribution ":{
        "Notebook plotting functional effect distribution":
            rules.functional_effect_distribution.output.nb,
    },
}

