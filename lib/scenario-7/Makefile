clean:
	rm -rf *.pdf

build: clean
	docker run --entrypoint /bin/typst --mount type=bind,source="$$(pwd)"/src,target=/src ghcr.io/typst/typst:latest compile /src/hello-world.typst

check:
	nix hash path src/hello-world.pdf

run:
	nix hash path src/hello-world.pdf
