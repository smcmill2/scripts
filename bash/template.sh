#!/usr/bin/env bash
# Taken from https://dev.to/thiht/shell-scripts-matter
#
# -e Exits the script if any command returns a non-zero status
# -u Prevents use of an undefined variable
# -o pipefile forces pipelines to fail on first non-zero status
set -euo pipefail
IFS=$'\n\t'  # Make iterations and splitting less surprising

#/ Usage: bash template.sh
#/ Description: A template script for demonstrating best practices
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage


# Basic logging functionality
readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $@" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $@" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $@" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $@" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

cleanup() {
    # Remove temporary files
    # Restart services
    # ...
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap cleanup EXIT  # insures cleanup is run
    # Script goes here
    # ...
fi
