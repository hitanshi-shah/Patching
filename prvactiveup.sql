USE [db_name]
GO
 
IF NOT EXISTS (SELECT name 
                FROM [sys].[server_principals]
                WHERE name = N'prv_user_name')
Begin
CREATE LOGIN [prv_user_name] FROM WINDOWS WITH DEFAULT_DATABASE=[db_name]

ALTER SERVER ROLE [sysadmin] ADD MEMBER [prv_user_name]

end

Else
ALTER SERVER ROLE [sysadmin] ADD MEMBER [prv_user_name]
GO
