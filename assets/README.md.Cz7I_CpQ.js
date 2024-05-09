import{_ as e,c as o,o as t,a2 as a}from"./chunks/framework.B0JYoH9M.js";const m=JSON.parse('{"title":"VitePress home page","description":"","frontmatter":{},"headers":[],"relativePath":"README.md","filePath":"README.md"}'),i={name:"README.md"},n=a(`<h1 id="vitepress-home-page" tabindex="-1">VitePress home page <a class="header-anchor" href="#vitepress-home-page" aria-label="Permalink to &quot;VitePress home page&quot;">​</a></h1><p>This directory contains a nice VitePress homepage created roughly as described <a href="https://github.com/dms-vep/dms-vep-pipeline-3/tree/main/homepage" target="_blank" rel="noreferrer">here</a>.</p><h2 id="process-to-create-manual-content-for-this-homepage" tabindex="-1">Process to create manual content for this homepage <a class="header-anchor" href="#process-to-create-manual-content-for-this-homepage" aria-label="Permalink to &quot;Process to create manual content for this homepage&quot;">​</a></h2><p>Created the <code>package.json</code> file in the top level directory by copying the same file from <code>dms-vep-pipeline-3</code>.</p><p>Then loaded <code>nodejs</code> on the Hutch server using:</p><pre><code>ml nodejs/20.9.0-GCCcore-13.2.0
</code></pre><p>And then in the top-level repo directory ran:</p><pre><code>npm install
</code></pre><p>To create \`package-lock.json1.</p><p>Also updated the top-level \`.gitignore1 to add the following lines:</p><pre><code>node_modules/
!homepage/.vitepress/
homepage/.vitepress/cache/
homepage/.vitepress/dist/
</code></pre><p>Then copied the <code>homepage/.vitepress</code> subdirectory from <code>dms-vep-pipeline</code> to <code>.vitepress</code> in this directory, and manually edited <code>.vitepress/config.mjs</code> to have the correct names for this repository.</p><p>Then created <code>index.md</code> and the other Markdown files with the page content.</p><p>Also, placed manually generated images in <code>./public/images/</code>.</p><h2 id="process-to-add-pipeline-output-for-this-homepage" tabindex="-1">Process to add pipeline output for this homepage <a class="header-anchor" href="#process-to-add-pipeline-output-for-this-homepage" aria-label="Permalink to &quot;Process to add pipeline output for this homepage&quot;">​</a></h2><p>Added to the top-level repo configuration (<code>config.yaml</code>)) the following two lines:</p><pre><code>homepage: homepage/public
build_vitepress_homepage: true
</code></pre><p>Essentially, these two lines copy the auto-generated documentation of the pipeline in <code>./docs</code>/ to the <code>./public/</code> subdirectory here so they can be used in the docs. Then re-ran the pipeline which populated the <code>./public/</code> subdirectory.</p><h2 id="visualizing-the-page" tabindex="-1">Visualizing the page <a class="header-anchor" href="#visualizing-the-page" aria-label="Permalink to &quot;Visualizing the page&quot;">​</a></h2><p>To view the page, after making sure <code>nodejs</code> is loaded via:</p><pre><code>ml nodejs/20.9.0-GCCcore-13.2.0
</code></pre><p>then do (on the Hutch server):</p><pre><code>npm run remote:docs:dev
</code></pre><p>To make edits to the Markdown files and have them show up in the visualization, run above command from same terminal you are using to make edits, such as using <code>tmux</code> to make vertically split windows.</p><h2 id="deploying-the-pipeline" tabindex="-1">Deploying the pipeline <a class="header-anchor" href="#deploying-the-pipeline" aria-label="Permalink to &quot;Deploying the pipeline&quot;">​</a></h2><p>Set up the GitHub action to build the VitePress documentation by copying <code>.github/workflows/deploy.yaml</code> from <code>dms-vep-pipeline-3</code> to this repo.</p><p>Then set up the docs to render from the <code>gh-pages</code> branch of the repo.</p><h2 id="added-google-analytics" tabindex="-1">Added Google analytics <a class="header-anchor" href="#added-google-analytics" aria-label="Permalink to &quot;Added Google analytics&quot;">​</a></h2><p>Set up a Google Analytics for the site, and then added by adding the following lines to <code>.vitepress/config.mjs</code>:</p><pre><code>  head: [
    [
      &quot;script&quot;,
      { async: &quot;&quot;, src: &quot;https://www.googletagmanager.com/gtag/js?id=G-P7HL8Q4F41&quot; }
    ],
    [ 
      &quot;script&quot;,
      {},
      \`window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag(&quot;js&quot;, new Date());
      gtag(&quot;config&quot;, &quot;G-P7HL8Q4F41&quot;);\`
    ]
  ],
</code></pre>`,30),d=[n];function r(p,s,c,h,l,u){return t(),o("div",null,d)}const f=e(i,[["render",r]]);export{m as __pageData,f as default};
