clean:

build: clean
	guix time-machine --commit=10f3dd0e9e06d71d1bc1615c6a60cc3aa1ad1ff4 -- build -f guix.scm

check:
	nix hash path $$(guix time-machine --commit=10f3dd0e9e06d71d1bc1615c6a60cc3aa1ad1ff4 -- build -f guix.scm)

run:
	$$(guix time-machine --commit=10f3dd0e9e06d71d1bc1615c6a60cc3aa1ad1ff4 -- build -f guix.scm)/bin/datetime
