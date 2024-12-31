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
    """Compare cell entry into differenct cells."""
    input:
        nb="analysis_notebooks/SA_functional_scores.ipynb",
        SA23_csv="results/func_effects/averages/293_SA23_entry_func_effects.csv",
        SA26_csv="results/func_effects/averages/293_SA26_entry_func_effects.csv",
        c293T_csv="results/func_effects/averages/293T_entry_func_effects.csv",
    output:
        nb="results/notebooks/SA_functional_scores.ipynb",
    params:
        yaml=lambda _, input, output: yaml_str(
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


rule avg_species_sera:
    """Average escape across each species."""
    input:
        csvs=lambda wc: [
            rules.avg_escape.output.effect_csv.format(assay="antibody_escape", antibody=antibody)
            for antibody in avg_assay_config["antibody_escape"]
            if antibody.startswith(wc.species)
        ],
    output:
        csv="results/processed_results/avg_of_{species}_sera.csv",
    log:
        "results/logs/avg_species_sera_{species}.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    script:
        "scripts/avg_species_sera.py"


rule process_SA26_improvement:
    """Improvement of entry in 2,6 cells: positive difference and positive 2,6 entry.""" 
    input:
        csv="results/func_effect_diffs/SA26_vs_SA23_entry_diffs.csv",
    output:
        csv="results/processed_results/increased_SA26_usage.csv",
    log:
        "results/logs/process_SA26_improvement.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    script:
        "scripts/process_SA26_improvement.py"

rule functional_effect_distribution:
    """Plot functional effect dristribution for structural elements of HA"""
    input:
        nb="analysis_notebooks/functional_effect_distribution.ipynb",
        effects_csv="results/func_effects/averages/293T_entry_func_effects.csv",
        structure_csv="data/structure_map.csv",
    output:
        nb="results/notebooks/functional_effect_distribution.ipynb",
    params:
        yaml=lambda _, input, output: yaml_str(
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


rule configure_dms_viz:
    """Configure a JSON file for `dms-viz`."""
    input:
        phenotypes_csv="results/summaries/phenotypes.csv",
        per_antibody_escape_csv="results/summaries/phenotypes_per_antibody_escape.csv",
        site_numbering_map=config["site_numbering_map"],
        nb="analysis_notebooks/configure_dms_viz.ipynb",
    output:
        dms_viz_json="results/dms-viz/dms-viz.json",
        dms_viz_sitemap="results/dms-viz/sitemap.csv",
        dms_viz_phenotypes="results/dms-viz/phenotypes.csv",
        pdb_file="results/dms-viz/pdb_file.pdb",
        nb="results/notebooks/configure_dms_viz.ipynb",
    params:
        dms_viz_subdir=lambda _, output: os.path.dirname(output.dms_viz_json),
        pdb_id="4kwm",
    log:
        "results/logs/configure_dms_viz.txt",
    conda:
        "envs/dms-viz.yml"
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p phenotypes_csv {input.phenotypes_csv} \
            -p per_antibody_escape_csv {input.per_antibody_escape_csv} \
            -p site_numbering_map {input.site_numbering_map} \
            -p dms_viz_json {output.dms_viz_json} \
            -p dms_viz_sitemap {output.dms_viz_sitemap} \
            -p dms_viz_phenotypes {output.dms_viz_phenotypes} \
            -p pdb_file {output.pdb_file} \
            -p dms_viz_subdir {params.dms_viz_subdir} \
            -p pdb_id {params.pdb_id} \
            &> {log}
        """


rule configure_dms_viz_vrc_mabs:
    """Configure a JSON file for `dms-viz` for the VRC antibodies"""
    input:
        phenotypes_csv="results/summaries/phenotypes.csv",
        per_antibody_escape_csv="results/summaries/VRC_antibody_escape_per_antibody_escape.csv",
        site_numbering_map=config["site_numbering_map"],
        nb="analysis_notebooks/configure_dms_viz_mabs.ipynb",
    output:
        dms_viz_json="results/dms-viz/dms-viz_vrc_mabs.json",
        dms_viz_sitemap="results/dms-viz/sitemap_vrc_mabs.csv",
        dms_viz_phenotypes="results/dms-viz/phenotypes_vrc_mabs.csv",
        pdb_file="results/dms-viz/pdb_file_vrc_mabs.pdb",
        nb="results/notebooks/configure_dms_viz_vrc_mabs.ipynb",
    params:
        dms_viz_subdir=lambda _, output: os.path.dirname(output.dms_viz_json),
        pdb_id="4kwm",
    log:
        "results/logs/configure_dms_viz_vrc_mabs.txt",
    conda:
        "envs/dms-viz.yml"
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p phenotypes_csv {input.phenotypes_csv} \
            -p per_antibody_escape_csv {input.per_antibody_escape_csv} \
            -p site_numbering_map {input.site_numbering_map} \
            -p dms_viz_json {output.dms_viz_json} \
            -p dms_viz_sitemap {output.dms_viz_sitemap} \
            -p dms_viz_phenotypes {output.dms_viz_phenotypes} \
            -p pdb_file {output.pdb_file} \
            -p dms_viz_subdir {params.dms_viz_subdir} \
            -p pdb_id {params.pdb_id} \
            &> {log}
        """

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
    "Functional effect distribution ":{
        "Notebook plotting functional effect distribution":
            rules.functional_effect_distribution.output.nb,
    },
    "Visualizations of DMS data on protein structure (dms-viz JSONs)": {
        "Dadonaite (2024) phenotypes JSON": rules.configure_dms_viz.output.dms_viz_json,
        "VRC antibodies JSON": rules.configure_dms_viz_vrc_mabs.output.dms_viz_json,
    },        
}
