"""Gets mutations that increase SA26 usage."""


import pandas as pd


sys.stderr = sys.stdout = open(snakemake.log[0], "w")

(
    pd.read_csv(snakemake.input.csv)[
        [
            "wildtype",
            "site",
            "mutant",
            "difference",
            "difference_std",
            "times_seen",
            "fraction_pairs_w_mutation",
            "SA23 entry effect",
            "SA26 entry effect",
        ]
    ]
    .assign(
        increase_SA26_usage=lambda x: x["difference"].clip(lower=0).where(
            x["SA26 entry effect"] > 0, 0,
        ),
        increase_SA26_usage_std=lambda x: x["difference_std"].where(
            x["increase_SA26_usage"] > 0, 0,
        ),
    )
    .rename(columns={"fraction_pairs_w_mutation": "frac_models"})
    .to_csv(snakemake.output.csv, index=False)
)
