"""Average escape across sera for a species."""


import pandas as pd


sys.stderr = sys.stdout = open(snakemake.log[0], "w")

(
    pd.concat([pd.read_csv(f) for f in snakemake.input.csvs])
    .groupby(
        ["site", "wildtype", "mutant", "epitope"],
        as_index=False,
    )
    .aggregate(
        escape=pd.NamedAgg("escape_median", "mean"),
        n_sera=pd.NamedAgg("escape_median", "count"),
        times_seen=pd.NamedAgg("times_seen", "mean"),
    )
    .assign(frac_models=lambda x: x["n_sera"] / len(snakemake.input.csvs))
    .to_csv(snakemake.output.csv, index=False, float_format="%.4g")
)
