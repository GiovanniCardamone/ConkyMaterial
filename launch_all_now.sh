#!/bin/sh

for f in ./*_rc; do
	conky -dq -c $f
done
