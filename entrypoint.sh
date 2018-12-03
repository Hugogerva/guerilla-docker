#!/bin/sh

#env path
GPROJECT="/iexec/$1"
GPROJECTPATH=$(dirname $GPROJECT)

#actual rendering
Xvfb :0 -screen 0 1024x768x24 & guerilla --nogui $GPROJECT --cmd "render('batch')" \
& sleep 180 

#consensus generation (image size)
mv $GPROJECTPATH/*.png /iexec/output
identify /iexec/output | awk '{print $3}' > /iexec/consensus.iexec

#cleaning up
rm -rf $GPROJECTPATH
