#!/bin/bash

#--------------Variables------------
source "${DIR}/config/config.env"

#----------Config---------
source "${DIR}/lib/config.sh"
source "${DIR}/lib/install.sh"

#--------------Miscellaneus------------------
source "${DIR}/lib/misc.sh"

#--------------Brute Force Attack------------------
source "${DIR}/lib/brute_force/bruteforce_attack.sh"
source "${DIR}/lib/brute_force/password_craking/passwordcraking.sh"

