USE [KYF2020_Automation]
GO
 
IF NOT EXISTS (SELECT name 
                FROM [sys].[server_principals]
                WHERE name = N'prv_user_name')
Begin
CREATE LOGIN [prv_user_name] WITH PASSWORD=N'!Aig@12#3', DEFAULT_DATABASE=[KYF2020_Automation],
CHECK_EXPIRATION=OFF, CHECK_POLICY=ON

ALTER SERVER ROLE [sysadmin] ADD MEMBER [prv_user_name]

end

Else

ALTER SERVER ROLE [sysadmin] ADD MEMBER [prv_user_name]
GO
