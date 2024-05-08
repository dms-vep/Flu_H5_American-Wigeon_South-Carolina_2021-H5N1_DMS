# VitePress home page
This directory contains a nice VitePress homepage created roughly as described [here](https://github.com/dms-vep/dms-vep-pipeline-3/tree/main/homepage).

## Process to create manual content for this homepage

Created the [../package.json](../package.json) file in the top level directory by copying the same file from `dms-vep-pipeline-3`.

Then loaded `nodejs` on the Hutch server using:

    ml nodejs/20.9.0-GCCcore-13.2.0

And then in the top-level repo directory ran:

    npm install

To create [../package-lock.json](../package-lock.json).

Also updated the [../.gitignore](../.gitignore) to add the following lines:

    node_modules/
    !homepage/.vitepress/
    homepage/.vitepress/cache/
    homepage/.vitepress/dist/

Then copied the `homepage/.vitepress` subdirectory from `dms-vep-pipeline` to [.vitepress](.vitepress), and manually edited [.vitepress/config.mjs](.vitepress/config.mjs) to have the correct names for this repository.

Then created [index.md](index.md) and the other Markdown files with the page content.

## Process to add pipeline output for this homepage
Added to the top-level repo configuration ([../config.yaml](../config.yaml)) the following two lines:

    homepage: homepage/public
    build_vitepress_homepage: true

Essentially, these two lines copy the auto-generated documentation of the pipeline in [../docs/](../docs) to the [./public/](public) subdirectory here so they can be used in the docs.
Then re-ran the pipeline.
