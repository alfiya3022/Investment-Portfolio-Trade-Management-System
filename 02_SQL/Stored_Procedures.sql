
/* Stored_Procedures.sql */

CREATE PROCEDURE usp_GetInvestorPortfolio
    @InvestorID VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM vw_Investor_Portfolio
    WHERE Investor_ID = @InvestorID;
END;
GO

CREATE PROCEDURE usp_GetCompanyTradeSummary
    @CompanyID VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM vw_Company_Trading_Summary
    WHERE Company_ID = @CompanyID;
END;
GO

CREATE PROCEDURE usp_GetBrokerPerformance
    @BrokerID VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM vw_Broker_Performance
    WHERE Broker_ID = @BrokerID;
END;
GO

CREATE PROCEDURE usp_GetDividendHistory
    @CompanyID VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM Dividends
    WHERE Company_ID = @CompanyID;
END;
GO

CREATE PROCEDURE usp_GetTopInvestors
AS
BEGIN
    SELECT TOP 10 *
    FROM vw_Investor_Portfolio
    ORDER BY Portfolio_Value DESC;
END;
