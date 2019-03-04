#!/bin/sh

#configure your favorite diff program here
DIFF="/usr/bin/vimdiff"

# Subverion provides the paths we need as the sixth and seventh parameters.

LEFT=${6}
RIGHT=${7}

#call the diff command
$DIFF $LEFT $RIGHT

#Change your $HOME/.subverion/config file to point at this script
#diff-cmd = /home/user/xxxx/.vim/shell/diffwrap.sh
