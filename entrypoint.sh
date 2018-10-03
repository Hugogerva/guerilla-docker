#!/bin/sh

PPATH="/iexec"
GPROJECT="$PPATH/$1"
GPROJECTPATH=$(dirname $GPROJECT)

tar -xf ${PPATH}/project.tar.gz -C /iexec
rm project.tar.gz

Xvfb :0 -screen 0 1024x768x24 & guerilla --nogui $GPROJECT --cmd "render('batch')" \
	& sleep 180

mv $GPROJECTPATH/*.png /iexec/output
