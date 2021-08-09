#!/bin/ksh

_CFG_FILE="${HOME}/etc/Config.ini"

_get_ip(){
	_ip=`grep 'ip' "${_CFG_FILE}"`
	if [[ ! "${_ip}" ]]; then
		echo "can't get ip"
		_ip='null'
	else
		_ip="${_ip##*=}"
	fi
}

_get_port(){
	_port=`grep 'port' "${_CFG_FILE}"`
	if [[ ! "${_port}" ]]; then
		echo "can't get port"
		_port='null'
	else
		_port="${_port##*=}"
	fi
}

_run(){
	_get_ip
	_get_port
	echo "ip = ${_ip}"
	echo "port = ${_port}"
	echo "[network]" > ./NetworkInfo.txt
	echo "ip=${_ip}" >> ./NetworkInfo.txt
	echo "port=${_port}" >> ./NetworkInfo.txt
}

_run $*
