USE [KYF2020_Automation]

CREATE LOGIN [svcprv_iam_test1] WITH PASSWORD=N'!Aig@12#3', DEFAULT_DATABASE=[KYF2020_Automation];
CREATE USER {{prv_user_name}} FOR LOGIN svcprv_iam_test1;

GO
