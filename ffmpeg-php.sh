#!/bin/bash
#Shared Host ffmpeg installation script

#  Copyright (C) 2000-2007 Sherin.in. All rights reserved.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
RED='\033[01;31m'
RESET='\033[0m'
_DOWNLOAD_URL='http://downloads.sherin.in/sources'
_package='ffmpeg-php-0.5.0.tbz2'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET

rm -rf $HOME/src/*
cd $HOME/src
curl -O $_DOWNLOAD_URL/$_package
tar -xvjf $_package
cd ffmpeg-php-0.5.0/
$HOME/bin/phpize
./configure --enable-shared --with-ffmpeg=$HOME --with-php-config=$HOME/bin/php-config

make -j$cpu
make install
export EXTENSION_DIR=$(grep  EXTENSION_DIR  Makefile|grep php|awk '{print $3}')
echo '[PHP]' > $HOME/etc/php.ini
echo "extension_dir = \"$EXTENSION_DIR\" " >> $HOME/etc/php.ini
cat $HOME/etc/php.ini-sherin >> $HOME/etc/php.ini

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
