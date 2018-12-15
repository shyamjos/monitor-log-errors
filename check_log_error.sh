#!/usr/bin/env bash
#shyamjos.com 2018
#usage ./check_log_error.sh "a big error found" /var/log/myapp.log

  if [[ -z "$1" ]]; then
    echo "Error: grep keyword not found"
    exit 2
  fi

  if [[ -z "$2" ]]; then
    echo "Error: Log file not defined"
    exit 2
  fi

output=$(grep -i "$1" "$2")
error_count=$(echo "$output" | wc -l )

  if [[ ! -z "$output" ]]; then
    echo "Critical - $2 contains error(s) :"
    echo "$output | Log_Errors=$error_count"
    exit 2
  fi


echo "OK - No Errors found in $2 | Log_Errors=0"
exit 0

