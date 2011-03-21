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
_DOWNLOAD_URL='http://downloads.sherin.in/sources/'
_package='php-5.2.3.tar.gz'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET

rm -rf $HOME/src/*
cd $HOME/src
curl -O $_DOWNLOAD_URL/$_package
tar -xvzf $_package
cd php-5.2.3/
./configure --prefix=$HOME --enable-fastcgi --with-jpeg-dir=$HOME \
	--with-zlib-dir=$HOME  --with-iconv-dir=$HOME  --with-gd=$HOME   \
	--with-freetype-dir=$HOME  --with-gettext=$HOME --with-png-dir=$HOME \
	--with-config-file-path=$HOME/etc --with-mysql

make -j$cpu
make install
cp -f php.ini-sherin $HOME/etc/php.ini-sherin
cp -f php.ini-dist $HOME/etc/php.ini

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
