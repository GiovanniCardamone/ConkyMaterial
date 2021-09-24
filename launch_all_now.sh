#!/bin/sh

cd $HOME/.conky/conky-material

for f in ./*_rc; do
	conky -dq -c $f
done
