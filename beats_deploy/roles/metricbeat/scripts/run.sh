#!/bin/bash
APP_NAME="metricbeat"

#CURDIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
#cd $CURDIR 

case $1 in 
    start)
        nohup ./metricbeat -e -c conf/metricbeat.yml >nohup.log 2>&1 &
        echo ${APP_NAME} start!
        ;;
    stop)    
        ps -ef| grep ${APP_NAME} |grep -v grep |awk '{print $2}'  | sed -e "s/^/kill -9 /g" | sh - 
        echo ${APP_NAME} stop!
        ;;
    restart)
        "$0" stop
        sleep 1
        "$0" start
        ;;
    status)  ps -aux | grep ${APP_NAME} | grep -v 'grep'
        ;;
    *)       
        echo "Example: services.sh [start|stop|restart|status]" ;;
esac