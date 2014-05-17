#!/bin/bash

#-------------------------:  :-------------------------#
#-------------------: echroma.sh :---------------------#

# functions for printing 'echo' output in colors
# echo -e "\E[1;XXm$1" << set color of output
# echo -e '\e[0m'}     << reset echo output vars
# usage example: $ echo_purple "This is purple text"

echo_red(){
	echo -e "\E[1;31m$1"
	echo -e '\e[0m'}
echo_yellow(){
	echo -e "\E[1;33m$1"
	echo -e '\e[0m'}
echo_green(){
	echo -e "\E[1;32m$1"
	echo -e '\e[0m'}
echo_blue(){
	echo -e "\E[1;34m$1"
	echo -e '\e[0m'}
echo_cyan(){
	echo -e "\E[1;36m$1"
	echo -e '\e[0m'}
echo_purple(){
	echo -e "\E[1;35m$1"
	echo -e '\e[0m'}

#-------------------------:  :-------------------------#
