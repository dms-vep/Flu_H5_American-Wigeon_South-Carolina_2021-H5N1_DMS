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

Also, placed manually generated images in [public/images/](public/images).

## Process to add pipeline output for this homepage
Added to the top-level repo configuration ([../config.yaml](../config.yaml)) the following two lines:

    homepage: homepage/public
    build_vitepress_homepage: true

Essentially, these two lines copy the auto-generated documentation of the pipeline in [../docs/](../docs) to the [./public/](public) subdirectory here so they can be used in the docs.
Then re-ran the pipeline which populated the [./public/](public) subdirectory with a copy of [../docs/](../docs).

## Visualizing the page
To view the page, after making sure `nodejs` is loaded via:

    ml nodejs/20.9.0-GCCcore-13.2.0

then do (on the Hutch server):

    npm run remote:docs:dev

To make edits to the Markdown files and have them show up in the visualization, run above command from same terminal you are using to make edits, such as using `tmux` to make vertically split windows.

## Deploying the pipeline
Set up the GitHub action to build the VitePress documentation by copying [../.github/workflows/deploy.yaml](../.github/workflows/deploy.yaml) from `dms-vep-pipeline-3` to this repo.

Then set up the docs to render from the `gh-pages` branch of the repo.
