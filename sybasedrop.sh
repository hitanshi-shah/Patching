#!/bin/bash
echo $2 | dzdo -S su - sybase -c 'isql -U prvATHENA_Ipsoft -P '$3' -S '$4' -i /tmp/sybasedrop.sql'
