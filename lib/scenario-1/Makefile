clean:
	rm -rf datetime

build: clean
	gcc src/datetime.c -o datetime

check:
	nix hash path datetime

run:
	./datetime
