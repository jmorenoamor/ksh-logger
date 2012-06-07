##########################################################################################
# KSH Logger library
# Log generator for KSH shell scripts
#
# Jesús Moreno Amor <jesus@morenoamor.com>
# April 2011
##########################################################################################

##########################################################################################
# Configuration variables the using script must define before loading the library
# TODO: Set default values for them
##########################################################################################
LOG_PATH=UNDEFINED
LOG_FILE=log
LOG_LEVEL=0

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
    do_log "INFO " $1
  fi
}

log_warning(){
  if [[ $LOG_LEVEL -le 4 ]]
  then
    do_log "WARN " $1
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
do_log(){
  if [[ ${LOG_PATH} != "UNDEFINED" ]]
  then
    SEVERIDAD=$1
    shift
    echo $(date +"%Y/%m/%d %H:%M:%S") - $(printf "%-10s" ${SEVERIDAD}) - $* >> ${LOG_PATH}/${LOG_FILE}
  else
    echo $(date +"%Y/%m/%d %H:%M:%S") - ERROR - "No se ha definido la ruta del fichero de log, revise la documentación" >&2
  fi
}