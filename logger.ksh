##########################################################################################
# KSH Logger library
# Log generator for shell scripts
#
# Jesus Moreno Amor <jesus@morenoamor.com>
#
##########################################################################################

##########################################################################################
# Configuration variables
##########################################################################################
LOG_PATH=.
LOG_FILE=log
LOG_LEVEL=2
LOG_DATEFORMAT="%Y/%m/%d %H:%M:%S"
LOG_MESSAGEFORMAT="%-19s - %-5s - %s\n"
LOG_STDOUT=""

##########################################################################################
# Auxiliary functions
##########################################################################################
log_trace(){
  if [[ $LOG_LEVEL -le 1 ]]
  then
    do_log TRACE $1
  fi
}

log_debug(){
  if [[ $LOG_LEVEL -le 2 ]]
  then
    do_log DEBUG $1
  fi
}

log_info(){
  if [[ $LOG_LEVEL -le 3 ]]
  then
    do_log INFO $1
  fi
}

log_warning(){
  if [[ $LOG_LEVEL -le 4 ]]
  then
    do_log WARN $1
  fi
}

log_error(){
  if [[ $LOG_LEVEL -le 5 ]]
  then
    do_log ERROR $1
  fi
}

log_fatal(){
  if [[ $LOG_LEVEL -le 6 ]]
  then
    do_log FATAL $1
  fi
}

##########################################################################################
# Main function
##########################################################################################
logger_init(){
    [[ -d $LOG_PATH ]] || mkdir -p $LOG_PATH
}

do_log(){
  SEVERITY=$1
  shift
  printf "$LOG_MESSAGEFORMAT" "$(date +"$LOG_DATEFORMAT")" "$SEVERITY" "$*" >> $LOG_PATH/$LOG_FILE
  [[ $LOG_STDOUT ]] && printf "$LOG_MESSAGEFORMAT" "$(date +"$LOG_DATEFORMAT")" "$SEVERITY" "$*"
}
