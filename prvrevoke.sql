USE [db_name]
GO
 
IF EXISTS (SELECT name 
                FROM [sys].[server_principals]
                WHERE name = N'prv_user_name')
Begin

ALTER SERVER ROLE [sysadmin] DROP MEMBER [prv_user_name]

end

Else
  print 'User not present'
GO
