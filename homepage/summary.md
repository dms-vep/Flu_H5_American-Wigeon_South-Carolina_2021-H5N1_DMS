---
aside: false
---

# Summary of how mutations affect all measured phenotypes

## Interactive plot of all phenotypes
The plot below shows how mutations affect all the measured phenotypes, and allows you to zoom and mouseover the plot for details (click on the expansion box in the upper right to enlarge the plot for easier viewing).

<Figure caption="Interactive plot showing effects of mutations on all phenotypes">
    <Altair :showShadow="true" :spec-url="'htmls/phenotypes_faceted.html'"></Altair>
</Figure>

Here is an explanation of the key plot elements:
 - The zoom bar at the top of the plot shows different regions of HA, and can be used to zoom in on specific sites.
 - The line plots summarize the average escape from neutralization by sera from different species in black at top, and then below that in gray the escape for sera from each species (averaged across animals; see the [serum escape page](escape){target="_self"} for per-animal escape). The height of each line summarizes the total escape caused by mutations at each site using the *site escape statistic* specified by the interactive options at the bottom of the plot.
  - The heatmaps then show how each individual mutation affects each measured phenotype. The `x` values indicate the amino-acid identity in the parental HA strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the bottom of the plot (eg, they have a very negative effect on cell entry). You can mouse over any of the points for details.
  - The options at the bottom of the plot allow you to interactively adjust what is displayed. For instance, the *minimum mutation entry in 293T cells* only shows mutations with at least some minimal cell entry function (and grays out mutations that are more deleterious). You can also select to only show mutations accessible by some number of mutations to the codon in the parental sequence (eg, only accessible by single-nucleotide mutations), or floor the escape at zero to show / not show "negative" escape values.

Here is how to interpret the values:
 - escape: positive values mean more neutralization escape, negative values mean the mutant is better neutralized.
 - cell entry: positive values mean better cell entry than the parental HA, negative values mean worse cell entry.
 - stability: positive values indicate greater HA stability than the parental HA (more tolerant of acidic pH), negative values indicate reduced stability.
 - SA26 usage: positive values indicate improved usage of a2,6-sialic acid.

## Numerical summary of mutation effects
The numerical data plotted on this page are available in [this CSV file](https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS/blob/main/results/summaries/phenotypes.csv).
These data have been pre-filtered in various ways to retain only higher-confidence values.
For more detailed data without the pre-filtering, see the phenotype-specific pages.
