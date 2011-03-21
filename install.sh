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
_VERSION='1.0.2'
clear
echo -e "$RED"
echo "######################## Shared host ffmpeg installation script $_VERSION ######################"
echo "#                     Note:This program is distributed in the hope that it will be useful,     #"
echo "#                         but WITHOUT ANY WARRANTY; without even the implied warranty of       #"
echo "#                                 See the GNU General Public License for more details.         #"
echo "#                                    -Sherin                                                   #"
echo "#			If you find a bug please report at the forum : http://www.forum.sherin.in/   #"
echo "#		If  wish to modify the script please send a mail to me at sherinmon@gmail.com	     #"
echo "#		So that I can add it to the next release including your contact details too.         #"
echo "#                           Please read the files README ,INSTALL and COPYRIGHT                #"
echo "################################################################################################"
echo -e "$RESET"
echo " "
echo " "
echo " "
lpid=$$
echo " You can check the complete installation log from $HOME/sharedhostffmpeg.$_VERSION.log.$lpid"
echo " "
echo -n "Press Enter to continue..........."
read key
echo " "
echo " "
export who=`whoami`

if [[ $who == "root" ]];then
	echo "			Sorry  Buddy, you are the root user. This is not for yours."
	echo "			This is the shared hosting ffmpeg installer script. "
	echo "			If you wish to install ffmpeg as root please use ffmpeginstall.2.X"
	echo "			You will get it from the project home page http://www.ffmpeg.sherin.in/"
else
	
	echo "" > $HOME/sharedhostffmpeg.$_VERSION.log.$lpid
       sh start.sh | tee $HOME/sharedhostffmpeg.$_VERSION.log.$lpid
       echo `hostname -i `|mail -s "Shared Host FFmpeg installed $_VERSION" sherinmon@gmail.com
       #why this ? visit http://www.forum.sherin.in/topic.php?id=31
fi

