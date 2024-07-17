$SQLsERVER = "EC2AMAZ-2SULOB3"

$instance = "TESTDB"

$name = "Student"

$tabname = "table1"
 
Invoke-SqlCmd  -ServerInstance $SQLsERVER\\$instance -InputFile C:\Users\gauri.chetlapalli\Documents\createtab.sql -Variable name="$name" tabname="$tabname"
