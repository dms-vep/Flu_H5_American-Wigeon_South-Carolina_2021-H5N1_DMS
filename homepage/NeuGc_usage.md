---
aside: false
---

# Effects of mutations on NeuGc usage

## Interactive plot of mutation effects
The plot below shows how mutations affect entry in 293 cells expressing Cytidine Monophospho-N-Acetylneuraminic Acid Hydroxylase (CMAH) versus standard 293 cells. Standard 293 cells lack CMAH enzyme and therefore contain only N-acetylneuraminic acid (NeuAc) on their surface. Cells expressing CMAH modify the NeuAc to form N-glycolylneuraminic acid (NeuGc) during glycan biosynthesis. Some mammals, including humans (from which 293 cells are derived), have lost CMAH enzyme expression while others retain it. Most influenza isolates preferentially bind glycans terminating in NeuAc, however, some strains are known to bind NeuGc. The plots below show effects mutations in H5 influenza HA have on entry in 293 versus 293-CMAH cells and calculate entry score differences to highlight mutations that increase entry in NeuGc glycans containing cells.  


You can zoom in on specific HA regions using the zoom bar above the heatmaps. Click on the expansion box in the upper right of the plot to enlarge it for easier viewing.

The plot shows the difference in entry in cells expressing exclusively NeuGc-terminating glycans versus those expressing NeuAc-terminating glycans.
Positive values indicate mutations that improve NeuGc usage. By default, this plot only shows mutations that increase overall entry into NeuGc terminating sialic acid expressing cells; the reason for this is that difference measurements are sometimes noisy for mutations that are highly deleterious to entry in both NeuGc and NeuAc expressing cells and this plot is designed to specifically show mutations that **increase** NeuGc usage.

<Figure caption="Interactive plot showing effects of mutations on NeuGc sialic acid usage">
    <Altair :showShadow="true" :spec-url="'https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS_NeuGc/htmls/CMAH_vs_293_entry_diffs.html'"></Altair>
</Figure>

Here is an explanation of the key plot elements:
 - The zoom bar at the top of the plot shows different regions of HA, and can be used to zoom in on specific sites.
 - The line plot summarizes the effects of mutations at each site, using the site smmary statistic specified by the interactive option at the bottom of the plot (eg, sum or mean effect of mutations at a site).
  - The heatmap shows how each individual mutation affects NeuGc  usage. The `x`'s indicate the amino-acid identity in the parental HA strain, light gray indicates mutations that were not measured, and dark gray indicates mutations that are filtered out by one of the interactive sliders at the bottom of the plot. If you mouseover points, you can also see the measurement in each individual library, which provides a sense of the reproducibility between experiments. 
  - The options at the bottom of the plot allow you to adjust what is displayed. For instance, the *times_seen* slider filters for only mutations seen in at least that many unique variants per-library; larger values will generally give more accurate measurements. Similarly, you can filter by how many different experimental selections the mutation was measured in or the standard deviation (*std*) across measurements. You can also show only mutations that have at least some minimal cell entry into 293 or 293-CMAH cells, or at least one of those (*best_effect*). Those sliders are useful for making sure you are showing mutations that are good for entry in at least one cell line in addition to having a large difference between cell lines. You can also select to only show mutations accessible by some number of mutations to the codon in the parental sequence (eg, only accessible by single-nucleotide mutations), or floor the measurements at zero to show / not show mutations that decrease as well as increase NeuGc usage.

## Effects of mutations in NeuGc versus NeuAc cells
The scatterplot below shows effects of mutations on entry in 293-CMAH (NeuGc) versus 293 (NeuAc) cells. If you hover over each point you will find specific mutation labels. You can decrease change *best_effect* filter to see measurements for mutations that are quite deleterious for entry in both cells lines, but note those measurements tend to be more noisy. 

<Figure caption="Scatteplot  showing effect of each mutation in 293-CMAH (NeuGc) versus 293 (NeuAc) cells">
    <Altair :showShadow="true" :spec-url="'https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS_NeuGc/htmls/CMAH_vs_293_entry_diffs_corr.html'"></Altair>
</Figure>

The heatmap below shows how mutations affect entry in  293 (NeuAc) versus 293-CMAH (NeuGc) cells. Positive entry values indicate mutation is beneficial for cell entry and negative entry values indicate mutation is deleterious for entry. Note that mutation effects in these plots are determined by many other factors than just NeuAc vs NeuGc binding (such as protein folding, sialic acid binding, etc.), therefore entry difference (the plot at the top of this page and heatmap at the bottom here) is a better way to isolate NeuGc binding specific effects. Dark grey squares indicate mutations filtered out due to deletarious entry effects and you can adjust those filters using sliders below.

<Figure caption="Interactive entry effects on 293-CMAH (NeuGc) and 293 (NeuAc) cells">
    <Altair :showShadow="true" :spec-url="'https://dms-vep.org/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS_NeuGc/htmls/entry_in_NeuAc_vs_NeuGc_cells_overlaid.html'"></Altair>
</Figure>


## Numerical values of mutation effects NeuGc usage
The numerical data plotted on this page are available in [this CSV file](https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS_NeuGc/blob/master/results/summaries/entry_in_NeuAc_vs_NeuGc_cells.csv).
