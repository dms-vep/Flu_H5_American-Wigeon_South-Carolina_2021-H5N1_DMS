---
aside: false
---

# Summary of how mutations affect all measured phenotypes

## Interactive plot of all phenotypes
The plot below shows how mutations affect all the measured phenotypes, and allows you to zoom and mouseover sites and mutations. 
Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/phenotypes_faceted.html){target="_self"} to open the plot in a stand-alone window.
Note that the two different shades of gray in the heatmaps have differing meanings: light gray means a mutation was *missing (not measured)* in the library, whereas dark gray means a mutation *was measured but was so deleterious for cell entry* it is not possible to reliably estimate its effect on other phenotypes (the threshold for how deleterious a mutation must be for cell entry to be shown in dark gray is controlled by the cell entry slider at the bottom of the plot).

<Figure caption="Interactive plot showing effects of mutations on all phenotypes">
    <Altair :showShadow="true" :spec-url="'htmls/phenotypes_faceted.html'"></Altair>
</Figure>

Here is an explanation of the key plot elements:
 - The zoom bar at the top of the plot shows different regions of HA, and can be used to zoom in on specific sites.
 - The line plots summarize the average escape from neutralization by sera from different species in black at top, and then below that in gray the escape for sera from each species (averaged across animals; see the [serum escape page](escape){target="_self"} for per-animal escape). The height of each line summarizes the total escape caused by mutations at each site using the *site escape statistic* specified by the interactive options at the bottom of the plot.
  - The heatmaps show how each individual mutation affects each phenotype. The `x`'s indicate the amino-acid identity in the parental HA strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the bottom of the plot (eg, they have a very negative effect on cell entry). You can mouse over any of the points for details.
  - The options at the bottom of the plot allow you to interactively adjust what is displayed. For instance, the *minimum mutation entry in 293T cells* only shows mutations with at least some minimal cell entry function (and grays out mutations that are more deleterious). You can also select to only show mutations accessible by some number of mutations to the codon in the parental sequence (eg, only accessible by single-nucleotide mutations), or floor the escape at zero to show / not show "negative" escape values.

HA genes are numbering various different ways; see [here](numbering) for an explanation of the numbering scheme used here.

## Structure-based visualization
To view the effects of mutations in the context of the H5 HA three-dimensional structure, use [this dms-viz link](https://dms-viz.github.io/v0/?data=https%3A%2F%2Fraw.githubusercontent.com%2Fdms-vep%2FFlu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS%2Fmain%2Fresults%2Fdms-viz%2Fdms-viz.json).

## Numerical values of mutation effects on all phenotypes
The numerical data plotted above are in [this CSV file](https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS/blob/main/results/summaries/phenotypes.csv).
These data have been to retain only higher-confidence values.
For more detailed data without the pre-filtering, see the phenotype-specific pages.


## Interactive Phenotype Tool

Explore the effect of mutations on the phenotypes measured in this experiment using the interactive table below. Use the small search bar beneath the table to find individual mutations (i.e. 'V5L').

Generate a detailed histogram of any phenotype by typing its name into the `column` bar. See how the effects of individual mutations compare to this histogram by typing a comma-separated list into the `sites` bar. Another interactive table shows the rows matching these mutations.

<iframe width="100%" height="1183.59375" frameborder="0"
  src="https://observablehq.com/embed/@willhannon-mcb/h5n1-dms-phenotype-lookup@60?cells=viewof+sites%2Csummary%2Cfilter_df%2Cviewof+column%2Cplot"></iframe>