#!/bin/bash

function __kobman_development_tobvon_dir 
{
	cd ~	
	sudo mkdir -p Dev_TOBVon
	cd Dev_TOBVon
	export KOBMAN_VON_DEV_DIR=$PWD
	sudo chmod 777 ${KOBMAN_VON_DEV_DIR}
	cd ${KOBMAN_VON_DEV_DIR}
	sudo mkdir -p test/ dependency/
}                                                                                                                          
function __kobman_install_tobvon
{
	kobman_namespace="$1"	
	__kobman_echo_red "Building VON-(TheOrgBook) from"
	__kobman_echo_red " ${kobman_namespace}"
	cd ${KOBMAN_CANDIDATES_DIR}
	__kobman_development_tobvon_dir 
	echo "$PWD"
	sudo git clone https://github.com/${kobman_namespace}/von-network.git
        sudo von-network/manage rm
        sudo von-network/manage build
	echo "TOBVon Development Environment is installed."	
	__kobman_echo_red "TOBVon Development Environment is installed."	
	cd ~
}
function __kobman_start_tobvon
{

	__kobman_echo_red "Starting VON-(TheOrgBook) from"
	__kobman_echo_red "${kobman_namespace}"
        cd ${KOBMAN_VON_DEV_DIR} 
	sudo von-network/manage start
}

function __kobman_uninstall_tobvon
{
 	__kobman_echo_red "VON-(TheOrgBook) - Uninstalling..."	
	cd ${KOBMAN_VON_DEV_DIR} 
	sudo rm -rf von-network/ 2> /dev/null	
	cd ~
	sudo rm -rf Dev_TOBVon/ 2> /dev/null	
	sudo rm -rf ${KOBMAN_VON_DEV_DIR} 2> /dev/null	
	__kobman_echo_red "TOBVon Development Environment is un-installed."	
	cd ~
}

function __kobman_version_tobvon
{

	if [ -d "${KOBMAN_TOBVON_DEV_DIR" ]
	then 
		kobman_namespace="$1"
		cd "${KOBMAN_VON_DEV_DIR}" 
		echo "${KOBMAN_VON_DEV_DIR}" 
		cd von-network/	
		git show-ref --tag | grep -o v0.0.*
		cd ~
	else
 		__kobman_echo_red "TOBVON is not installed"	
	fi
}
