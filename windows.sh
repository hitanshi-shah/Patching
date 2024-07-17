file=$1/License_status_passed_*

if [ -f ${file} ];then
   cat  $1/License_status_passed_* $1/mergedfile
else
    echo $1
    echo "No Remediation file available proceeding to update"
fi
