# current contribs to CoreScan & DotZipNuke >> https://github.com/alleck 

################################################################
################################################################

#!/bin/bash

#------------------------------::------------------------------#
#------------------------: backscan.sh :-----------------------#

if [ ! -d "/home/sscan/backLogs" ]c
then
mkdir /home/sscan/backLogs
chmod 755 /home/sscan/backLogs
fi

fileBackLog="$(date +%y%m%d%H%M)_backfind.log"
echo $fileBackLog

echo -e "\e[093;1mFinding Akeeba Backups...\e[0m"
find /home*/*/public_html/*/administrator/components/com_akeeba/backup/ -name '*.zip*' >> backupsfound.log
find /home*/*/public_html/administrator/components/com_akeeba/backup/  -name '*.zip*' >> backupsfound.log
echo -e "\e[092;1mFinished Akeeba Backups\e[0m"
echo -e "\e[093;1mFinding Backup Buddy Backups...\e[0m"
find /home*/*/public_html/*/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
find /home*/*/public_html/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
echo -e "\e[092;1mFinished Backup Buddy Backups\e[0m"
echo -e "\e[093;1mFinding Large Zip files. (DotZipNuke)...\e[0m"
find /home*/* -type f -name '*.zip*' -size +200M >> backupsfound.log
echo -e "\e[093;1mDone! Check backupsfound.log\e[0m"


for file in `cat backupsfound.log | cut -d":" -f1`
do
        ls -lh $file | awk '{print $5,$9;}' >> ./backLogs/$fileBackLog
done

echo "Results can be found in /home/sscan/backLogs/"$fileBackLog
echo "Done!"

#------------------------------::------------------------------#

################################################################
################################################################

#!/bin/bash

#------------------------------::------------------------------#
#------------------------: corescan.sh :-----------------------#

if [ ! -d "/home/sscan/coreLogs" ]
then
mkdir /home/sscan/coreLogs
chmod 755 /home/sscan/coreLogs
fi

fileCoreLog="$(date +%y%m%d%H%M)_corefind.log"
echo $fileCoreLog

echo "Finding core files for /home. This may take a while..."
find /home*/* -type f -size +20M -name "core.[[:digit:]]*[[:digit:]]" >> corefind.log
cp corefind.log /home/sscan/coreLogs/$fileCoreLog

#du -s /home*/* >> /home/sscan/coreLogs/$fileCoreLog

echo "Results can be found in /home/sscan/coreLogs/"$fileCoreLog

#------------------------------::------------------------------#
