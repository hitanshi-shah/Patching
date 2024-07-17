#!/bin/bash
echo $2 | dzdo -S su - sybase -c 'showserver'
echo $?
if [ $? == 0 ]; then
  echo "db service is running, proceeding to take backup of db"
  echo $2 | dzdo -S su - sybase -c 'bash /sybase/product/v160/SYBASE.sh'
  echo $2 | dzdo -S su - sybase -c 'isql -U prvATHENA_Ipsoft -P '$3' -S '$4' -i /tmp/sybase_db_backup.sql'
    if [ $? -eq 0 ]; then
        echo "db backup is taken successfully"
    else
         echo "backup is not successful"
     fi
else
echo "db service is not running"
fi
