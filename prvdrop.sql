USE [db_name]
GO
 
IF EXISTS (SELECT name 
                FROM [sys].[server_principals]
                WHERE name = N'prv_user_name')
Begin

DROP LOGIN [prv_user_name]

end

Else
  print 'User not present'
GO
