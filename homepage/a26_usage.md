---
aside: false
---

# Effects of mutations on a2,6 sialic-acid usage

## Interactive plot of mutation effects
The plot below shows how mutations affect a2,6 sialic-acid usage, and allows you to zoom and mouseover sites and mutations. 
Click on the expansion box in the upper right of the plot to enlarge it for easier viewing, or [click here](/htmls/SA26_vs_SA23_entry_diffs.html){target="_self"} to open the plot in a stand-alone window.

The plot shows the difference in entry in cells expressing exclusively a2,6 sialic acid  versus those expressing exclusively a2,3 sialic acid.
Positive values indicate mutations that improve a2,6 usage (infection of cells expressing exclusively a2,6 sialic acids).
By default, this plot only shows mutations that increase overall entry into a2,6 cells and shows other mutaitons in dark gray boxes (you can change this by adjusting the *minimum SA26 entry effect* slider below the plot); the reason for this is that difference measurements are sometimes noisy for mutations that are highly deleterious to entry in both a2,3 and a2,6 cells and this plot is designed to specifically show mutations that **increase** a2,6 usage.
See the overall [summary](summary) or [cell entry](cell_entry) to see how mutations affect cell entry in non-sialic-acid specific ways.

<Figure caption="Interactive plot showing effects of mutations on a2,6 sialic acid usage">
    <Altair :showShadow="true" :spec-url="'htmls/SA26_vs_SA23_entry_diffs.html'"></Altair>
</Figure>

Here is an explanation of the key plot elements:
 - The zoom bar at the top of the plot shows different regions of HA, and can be used to zoom in on specific sites.
 - The line plot summarizes the effects of mutations at each site, using the site smmary statistic specified by the interactive option at the bottom of the plot (eg, sum or mean effect of mutations at a site).
  - The heatmap shows how each individual mutation affects a2,6 usage. The `x`'s indicate the amino-acid identity in the parental HA strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the bottom of the plot. If you mouseover points, you can also see the measurement in each individual library, which provides a sense of the reproducibility between experiments. 
  - The options at the bottom of the plot allow you to adjust what is displayed. For instance, the *times_seen* slider filters for only mutations seen in at least that many unique variants per-library; larger values will generally give more accurate measurements. Similarly, you can filter by how many different experimental selections the mutation was measured in or the standard deviation (*std*) across measurements. You can also show only mutations that have at least some minimal cell entry into a2,3 or a2,6 sialic acid cells, or at least one of those (*best_effect*). Those sliders are useful for making sure you are showing mutations that are good for entry in at least one cell line in addition to having a large difference between cell lines. You can also select to only show mutations accessible by some number of mutations to the codon in the parental sequence (eg, only accessible by single-nucleotide mutations), or floor the measurements at zero to show / not show mutations that decrease as well as increase a2,6 sialic acid usage.

## Effects of mutations in a2,6 versus a2,3 cells
The plot below shows the effect of each mutation in each type of cell as a point, and you can mouse over points for details on mutations.
The sliders allow you to adjust what mutations are shown, similar to the heatmap above.
For instance, the default range of this plot only shows mutations that have a net positive effect on a2,6 cell entry, but you can use the *minimum SA26 entry effect* slider to also show mutations with negative effects on a2,6 cell entry.

<Figure caption="Interactive plot showing effect of each mutation in a2,6 versus a2,3 expressing cells">
    <Altair :showShadow="true" :spec-url="'htmls/SA26_vs_SA23_entry_diffs_corr.html'"></Altair>
</Figure>

## Numerical values of mutation effects on a2,6 sialic-acid usage
The numerical data plotted on this page are available in [this CSV file](https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS/blob/main/results/func_effect_diffs/SA26_vs_SA23_entry_diffs.csv).
Note that these values have **not** been filtered by QC criteria like the *times seen*, so either make sure you understand the filters in the file or use the pre-filtered numerical values provided in the [summary of phenotype effects](summary).
