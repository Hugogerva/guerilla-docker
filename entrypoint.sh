#!/bin/sh

GPROJECT="/iexec/$1"
GPROJECTPATH=$(dirname $GPROJECT)

Xvfb :0 -screen 0 1024x768x24 & guerilla --nogui $GPROJECT --cmd "render('batch')" \
& sleep 180

mv $GPROJECTPATH/*.png /iexec/output
identify output | awk '{print $3}' > consensus.iexec

rm -rf $GPROJECTPATH 
