import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: "en-US",
  title: "Deep mutational scanning of H5 influenza hemagglutinin (HA)",
  description:
    "Interactive figures and detailed results for deep mutational scanning of the HA from the clade 2.3.4.4b A/American Wigeon/South Carolina/USDA-000345-001/2021 (H5N1) strain.",
  base: "/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "Appendix", link: "/appendix", target: "_self" },
    ],
    srcExclude: ["**/README.md"],
    socialLinks: [{ icon: "github", link: "https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS" }],
    footer: {
      message: "Study by Bernadeta Dadonaite, Jesse Bloom, et al",
    },
  },
});
