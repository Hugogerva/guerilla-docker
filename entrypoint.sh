#!/bin/sh

GPROJECT="/iexec/$1"
GPROJECTPATH=$(dirname $GPROJECT)

Xvfb :0 -screen 0 1024x768x24 & guerilla --nogui $GPROJECT --cmd "render('batch')" \
	& sleep 180

mv $GPROJECTPATH/*.png /iexec/output
convert /iexec/output -define png:include-chunk=none -set colorspace Gray -separate -average -depth 4 /iexec/consensus.iexec

rm -rf ./*/
