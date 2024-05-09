---
aside: false
---

# Effects of mutations on HA stability

## Interactive plot of mutation effects
The plot below shows how mutations affect HA stability, and allows you to zoom and mouseover sites and mutations. 
Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/stability_mut_effect.html){target="_self"} to open the plot in a stand-alone window.
Positive values indicate greater stability (more resistance to acidic pH).

<Figure caption="Interactive plot showing effects of mutations on HA stability">
    <Altair :showShadow="true" :spec-url="'htmls/stability_mut_effect.html'"></Altair>
</Figure>

Here is an explanation of the key plot elements:
 - The zoom bar at the top of the plot shows different regions of HA, and can be used to zoom in on specific sites.
 - The line plot summarizes the effects of mutations at each site, using the site smmary statistic specified by the interactive option at the bottom of the plot (eg, sum or mean effect of mutations at a site).
  - The heatmap shows how each individual mutation affects stability. The `x`'s indicate the amino-acid identity in the parental HA strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the bottom of the plot. If you mouseover points, you can also see the measurement in each individual library, which provides a sense of the reproducibility between experiments. 
  - The options at the bottom of the plot allow you to adjust what is displayed. For instance, the *times_seen* slider filters for only mutations seen in at least that many unique variants per-library; larger values will generally give more accurate measurements. Similarly, you can filter by how many different experimental selections the mutation was measured in, or the standard deviation (*std*) across measurements. You can also show only mutations that have at least some minimal function as measured by entry into 293T cells (*functional effect* slider) to avoid showing highly deleterious mutations. You can also select to only show mutations accessible by some number of mutations to the codon in the parental sequence (eg, only accessible by single-nucleotide mutations), or floor the measurements at zero to show / not show destabilizing as well as stabilizing mutations.

## Numerical values of mutation effects
The numerical data plotted on this page are available in [this CSV file](https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS/blob/main/results/stability/averages/stability_mut_effect.csv).
Note that these values have **not** been filtered by QC criteria like the *times seen*, so either make sure you understand the filters in the file or use the pre-filtered numerical values provided in the [summary of phenotype effects](summary).
