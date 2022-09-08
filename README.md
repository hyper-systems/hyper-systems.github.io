# Hyper public documentation website

The `./docs` folder contains the final static assets to be published.


## Developers documentation

The developers documentation is managed with [Antora](https://antora.org).

The specification of the build process for developers documentation can be
found in the `./antora` folder.

### Adding documentation components

Currently the workflow for adding external documentaiton components is:

1. Clone the desired git repository into `./antora/sources/repo-name`.
    - Note: the sources folder is part of `.gitignore`.
2. Add the new source to `./antora/antora-playbook.yml` file in the `sources` section.
3. Build the documentation from the `./antora` folder:
    - `make build`
4. Replace the developers docs with the built Antora documentation in `./docs`:
    - `rm -rf ./docs/developers && cp -r ./antora/build/site ./docs/developers`

#### Modifying the UI

Setup the UI build entironment:

- `cd ./antora/antora-ui-default`
- `npm install`

Build the theme bundle:

- `npx gulp bundle`

After this the documentation can be built normally:

- `npx antora generate antora-playbook.yml`
