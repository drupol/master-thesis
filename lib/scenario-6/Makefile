clean:
	rm -rf output result
	nix-collect-garbage -d

build: clean
	nix build
	gunzip -c result | docker load

check:
	$$(nix build --quiet --no-link --print-out-paths nixpkgs#coreutils)/bin/cp -r --dereference "$$(readlink -f result)" "output"
	nix hash path output
	chmod 777 output

run:
	docker run datetime:latest
