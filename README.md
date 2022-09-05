# Hyper public documentation website

The `./public` folder contains the final static assets to be published.


## Developers documentation

The developers documentation is managed with [Antora](https://antora.org).

The specification of the build process for developers documentation can be
found in the `./antora` folder.

### Adding documentation components

Currently the workflow for adding external documentaiton components is:

1. Clone the desired git repository into `./antora/sources/repo-name`.
    - Note: the sources folder is part of `.gitignore`.
2. Add the new source to `./antora/antora-playbook.yml` file in the `sources` section.
3. Build the documentation:
    - `npx antora generate antora-playbook.yml`
4. Replace the developers docs with the built Antora documentation in `./public`:
    - `rm -rf ./public/developers && cp -r ./antora/build/site ./public/developers`
