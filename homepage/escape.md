---
aside: false
---

# Escape from serum antibody neutralization

## Interactive plot of mutation effects
The plot below shows how mutations affect neutralization by polyclonal serum from mice or ferrets vaccinated or infected with a clade 2.3.4.4b H5 HA.
The plot is interactive, and allows you to zoom and mouseover sites and mutations. 
Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/all_sera_escape_overlaid.html){target="_self"} to open the plot in a stand-alone window.
For a larger version of the plot that shows escape from each animal's sera in a separate plot, [click here](/htmls/all_sera_escape_faceted.html){target="_self"}.

<Figure caption="Interactive plot showing effects of mutations on escape from serum neutralization">
    <Altair :showShadow="true" :spec-url="'htmls/all_sera_escape_overlaid.html'"></Altair>
</Figure>

Here is an explanation of the key plot elements:
 - The zoom bar at the top of the plot shows different regions of HA, and can be used to zoom in on specific sites.
 - The line plot summarizes the neutralization escape caused by mutations at each site (larger values indicate more escape) first for mouse sera and then for ferret sera. The black lines show the average across sera for different animals, and the gray lines show escape for individual animals. The escape at a site is quantified using the site summary statistic specified by the interactive option at the bottom of the plot (eg, sum or mean effect of mutations at a site).
 - The heatmaps then show how each individual mutation affects each measured phenotype. The `x`'s indicate the amino-acid identity in the parental HA strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the by one of the interactive sliders at the bottom of the plot (eg, they have a very negative effect on cell entry). You can mouse over any of the points. You can mouse over any of the heatmap cells for details.
 - The options at the bottom of the plot allow you to interactively adjust what is displayed. For instance, 
   the *minimum mutation entry in 293T cells* only shows mutations with at least some minimal cell entry
   function (and grays out mutations that are more deleterious). You can also select to only show mutations
   accessible by some number of mutations to the codon in the parental sequence (eg, only accessible by single
   -nucleotide mutations), or floor the escape at zero to show / not show "negative" escape values.  

## Numerical values of escape
For per-serum escape values, see [this CSV file](https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS/blob/main/results/summaries/all_sera_escape_per_antibody_escape.csv).

## Detailed plots for each sera
See the more detailed results of the analysis [here](/appendix){target="_self"} under the antibody escape section for detailed plots for each serum.
