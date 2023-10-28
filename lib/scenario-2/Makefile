clean:

build: clean
	docker buildx build --no-cache -t datetime:latest --output type=oci,dest=image.tar .
	docker load -i image.tar

check:
	docker create --quiet --name datetime datetime:latest &>/dev/null
	docker cp --quiet datetime:/app/datetime datetime
	docker container rm -f datetime &>/dev/null

	nix hash path datetime
	rm -rf datetime
	nix hash path image.tar

run:
	docker run datetime:latest
