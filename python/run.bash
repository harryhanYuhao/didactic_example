#!/bin/bash 

#### RUN with:
#### source run.bash

# GLOBAL VARIABLES
RED='\033[0;31m'
BOLD='\033[1m'
NOCOLOR='\033[0m'

declare PYTHON

graceful_exit() {
	if [ "${BASH_SOURCE-}" = "$0" ]; then
		exit $1
	else
		return $1
	fi
}


help() {
	echo "usage: source run.bash [deploy|test]"
	echo "       source run.bash -t # shorthand for test"
	echo "       source run.bash -r # shorthand for run"
}

test() {
	echo "testing"

	return 0
}

run() {
	echo -e "${RED}${BOLD}OUTPUT OF python main.py ${NOCOLOR}"
	$PYTHON main.py
	return 0
}

############################################
#### START OF SCRIPT
############################################

# Get the correct name for python executable 

if command -v python3 &> /dev/null; then
	PYTHON=python3
elif command -v python &> /dev/null; then
	PYTHON=python
else
	echo "python not found, please install python"
	graceful_exit 1
fi

if [ -z "$VIRTUAL_ENV" ]; then
	echo -e "You are ${RED}${BOLD}NOT${NOCOLOR} under virtual environment"
	echo "You may want to source this script"
	if [[ ! -d .venv ]]; then
		$PYTHON -m virtualenv .venv
		echo "virtual environment created"
	fi
	source .venv/bin/activate 
	echo -e " Trying to ${RED}${BOLD}activate ${NOCOLOR} virtual environment."
fi

if [ -z "$1" ]; then
	help
	graceful_exit 1
fi

while [[ $# -gt 0 ]] ; do
	case $1 in
		-t|t|test)
			test
			shift
			;;
		-r|r|redeploy)
			run
			shift
			;;
		*)
			echo "unknown option"
			help
			shift
			;;
	esac
done
