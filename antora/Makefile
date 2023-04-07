.PHONY: all
all: build

antora-ui-hyper/node_modules:
	nix-shell --command "cd antora-ui-hyper && npm --prefix ./ install"

antora-ui-hyper/build/ui-bundle.zip: antora-ui-hyper/node_modules
	nix-shell --command "cd antora-ui-hyper && npx --prefix ./ gulp bundle"

node_modules:
	nix-shell --command "npm --prefix ./ install"

.PHONY: release
release: node_modules antora-ui-hyper/build/ui-bundle.zip
# make sure the GIT_CREDENTIALS environment variable is set
	docker run \
		--rm \
		-u $(shell id -u) \
		-t \
		-v ${PWD}/../:/antora:Z \
		-e GIT_CREDENTIALS \
		antora/antora \
			--cache-dir=./.cache/antora \
			--clean \
			antora/antora-playbook-release.yml

.PHONY: build
build: node_modules antora-ui-hyper/build/ui-bundle.zip
	nix-shell --command "npx --prefix ./antora antora generate --log-level debug antora-playbook-dev.yml"

.PHONY: clean
clean:
	rm -Rf build
	rm -Rf .cache

.PHONY: distclean
distclean: clean
	rm -Rf antora-ui-hyper/node_modules
	rm -Rf antora-ui-hyper/build
	rm -Rf antora-ui-hyper/public
	rm -Rf node_modules
