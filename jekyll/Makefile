# Configuration Sources
# Primary:
# https://matthewrhone.dev/jekyll-in-nixos
# Other:
# https://nathan.gs/2019/04/19/using-jekyll-and-nix-to-blog/
# https://savo.rocks/posts/jekyll-setup-in-nixos/

# Adding new packates example
# nix-shell -p bundler --run 'bundle add <package-name>'

.PHONY: shell
shell:
	nix-shell

.PHONY: update
update:
	nix-shell -p bundler -p bundix --run 'bundler update; bundler lock; bundler package --no-install --path vendor; bundix; rm -rf vendor'

.PHONY: build
build:
	nix-shell --command "jekyll build && cp -Ruf ./_site/* ../docs/"

.PHONY: clean
clean:
	nix-shell --command "jekyll clean"


.PHONY: serve
serve:
	nix-shell --command "jekyll"

.PHONY: watch
watch:
	nix-shell --command "jekyll serve --watch"

.PHONY: release
release: build
	ln -s ../antora/build/site ../docs/developers
	touch ../docs/.nojekyll
