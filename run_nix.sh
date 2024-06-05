#!/bin/sh

cd nx
nix-shell --run ./run_ol.sh ~/openlane2/shell.nix

cd ../openframe
nix-shell --run ./run_ol.sh ~/openlane2/shell.nix
