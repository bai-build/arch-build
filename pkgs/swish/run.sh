#!/usr/bin/env bash

#
# run.sh
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of swish-installer.
#
# swish-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# swish-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with swish-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

# This is the file called from the /usr/bin/swish symlink

pkg_dir="/usr/share/swish"
pid_file="/run/swish/swish.pid"
user="swish"
group="swish"

help()
{
    cat<<-EOF
swish [OPTION]
SWI-Prolog for SHaring: a SWI-Prolog web IDE

Only a single option is permitted.
    -h      print this help
    -k      kill swish
    -s      start swish

Exit status:
 0  if OK,
 1  some error occurred.

Full documentation at: <https://github.com/SWI-Prolog/swish>
EOF
}

killd()
{
    # kill action only if process exists.
    if [ -f "$pid_file" ]; then
        pid=$(cat "$pid_file")
        ps -p $pid > /dev/null
        if [ $? -eq 0 ]; then
            kill -s TERM $pid
        fi
    fi
}

init()
{
    :
}

remove()
{
    :
}

startd()
{
    local pid=""

    {
        (
            cd "$pkg_dir"
            exec swipl --quiet -f "$pkg_dir"/run.pl
        ) &
        pid="$!"
    }

    write_pid_file "$pid"
}

#
# shared_functions.sh
#
# Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
#
# This file is part of swish-installer.
#
# swish-installer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# swish-installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with swish-installer.  If not, see <http://www.gnu.org/licenses/>.
#
#

# This file is used by the various run.sh.

check_running_user_and_group()
{
    if [ "$(id -un)" = "$user" ] && [ "$(id -gn)" = "$group" ]; then
        :
    else
        printf "User must be "$user"\n"
        printf "Group must be "$group"\n"
        return 1
    fi
}

write_pid_file()
{
    local pid="$1"

    if [ -n "$pid" ]; then
        printf "Server running with pid $pid\n"
        printf "$pid\n" > "$pid_file"
    else
        printf "Server error\n"
        return 1
    fi
}

option_parser()
{
    getopts ":hikrs" opt "$@"
    case "$opt" in
        h ) help            ;;
        i ) init            ;;
        k ) killd           ;;
        r ) remove          ;;
        s ) startd          ;;
        ? ) help; return 1  ;;
    esac
}

main()
{
    check_running_user_and_group && option_parser "$@"
}

main "$@"
