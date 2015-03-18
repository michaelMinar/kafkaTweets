#!/bin/bash

# wrapper for getting the analytics environment
# essentially a deformed monster
# 
# this script maintains our python environment (at least for now)
# and ensures that we have that environment for running the given applications
# 
# before you get going
# run 
# brew update
# brew install pyenv
# brew install pyenv-virtualenv
#
# USEAGE --------
# caliban.sh <program to run> 
# 
# if you want to run `python testr.py`
# in the analytics curated environment
# then type
# './caliban.sh python testr.py'
# 
# the environment will be created, if it does not exist
# activated, the commands run, and turned off
# 
# ++ this might also be interesting to add later -- as matplotlib does not typically work out-of-box with pyenv +++
#(sandbox)$ cp ~/.virtualenvs/sandbox/lib/python3.2/site-packages/matplotlib/mpl-data/matplotlibrc ~/.matplotlib/
# (sandbox)$ vi ~/.matplotlib/matplotlibrc
# #backend      : macosx
# backend      : TkAgg
# 
# 

# source $HOME/.bash_profile
envname=rosencrantz
pyversion=2.7.6

script_dir=`dirname $0`
penvx=`which pyenv`
if [ "x$penvx" == "x" ]
then
  echo "pyenv not around by default"
  export PYENV_ROOT="${HOME}/.pyenv"
  if [ -d "${PYENV_ROOT}" ]; then
  	export PATH="${PYENV_ROOT}/bin:${PATH}"
  fi
  penvx=`which pyenv`
  echo $penvx
  if [[ -z $penvx ]]; then
    echo "[ERROR]: unable to find pyenv"
    exit 1
  fi
else
	echo "hooray, pyenv actually is natively supported"
fi

# # initialization steps for pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv activate $envname 
if [ $? -eq 1 ]
then
	echo "need to create environment $envname"
	pyenv install $pyversion -s
	pyenv virtualenv $pyversion $envname 
	pyenv activate $envname
else
	echo "already have the environment $envname"
fi

# pip install requests
pip install numpy
pip install scipy
pip install matplotlib
pip install pandas
pip install -r $script_dir/requirements.txt
pip install -r $script_dir/picky.txt

echo "setup python environment $envname"
echo `pyenv version` 

exec $*

pyenv deactivate $envname


# echo `pyenv version`
# if [[ $vrs = $goodVersion ]]
# then 
# 	echo YES
# else
# 	pyenv activate $goodVersion
# fi

# echo $vrs
