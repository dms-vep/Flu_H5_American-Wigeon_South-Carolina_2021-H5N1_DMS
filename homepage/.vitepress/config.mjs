import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: "en-US",
  title: "Deep mutational scanning of H5 influenza HA",
  description:
    "Interactive figures and detailed results for deep mutational scanning of the HA from the clade 2.3.4.4b A/American Wigeon/South Carolina/USDA-000345-001/2021 (H5N1) strain.",
  base: "/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS",
  appearance: false,
  head: [
    [
      "script",
      { async: "", src: "https://www.googletagmanager.com/gtag/js?id=G-P7HL8Q4F41" }
    ],
    [
      "script",
      {},
      `window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag("js", new Date());
      gtag("config", "G-P7HL8Q4F41");`
    ]
  ],
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "Appendix", link: "/appendix", target: "_self" },
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/dms-vep/Flu_H5_American-Wigeon_South-Carolina_2021-H5N1_DMS" }],
    footer: {
      message: 'Study by <a href="https://www.biorxiv.org/content/10.1101/2024.05.23.595634v1">Dadonaite et al (2014), bioRxiv, DOI 10.1101/2024.05.23.595634</a>',
    },
  },
});
