#! /bin/bash
DATE=$(date +%y%m%d)

FILE=archive$DATE.tar.gz

CONFIG_FILE=/home/shravanroy/files_to_backup
DESTINATION=/home/shravanroy/$FILE


#checking backup config files

if [ -d $CONFIG_FILE ]
then
echo "$CONFIG_FILE exist we will backup your file in this" 
else
echo "$CONFIG_FILE doesn't exist !! "
echo "plese inital create your configuration file to continue"
exit #terminal of file 
fi


FILE_NO=1
#exec < $CONFIG_FILE
cd files_to_backup
echo "enter name of specifice file you want to archive "
echo "enter finished if you have done"
read FILE_NAME

while [ $? -eq 0 ]
do 
	if [ $FILE_NAME == "finished" ]
	then 
		break
	fi	

	if [ -f $FILE_NAME -o -d $FILE_NAME ]
		then 
			#echo"$FILE_NAME is exist and we started"
		FILE_LIST="$FILE_LIST $FILE_NAME"
	else
	echo "sorry $FILE_NAME doesn't exist"
	fi
	
read FILE_NAME
FILE_NO=$((FILE_NO +1))
done

#backing up the files and archiving them 

echo "archive has been started"
tar -czf $DESTINATION $FILE_LIST 2> /dev/null


echo "archived completed"
echo "destination of archived file is $DESTINATION"
echo 


exit




















