
/* Views.sql */

CREATE VIEW vw_Investor_Portfolio AS
SELECT ta.Investor_ID,
       SUM(ph.Market_Value) AS Portfolio_Value
FROM Portfolio_Holdings ph
JOIN Trading_Accounts ta ON ph.Account_ID = ta.Account_ID
GROUP BY ta.Investor_ID;

GO

CREATE VIEW vw_Broker_Performance AS
SELECT Broker_ID,
       COUNT(*) AS Total_Trades,
       SUM(No_of_shares * Price_share) AS Trade_Value
FROM Fact_Trades
GROUP BY Broker_ID;

GO

CREATE VIEW vw_Company_Trading_Summary AS
SELECT Company_ID,
       COUNT(*) AS Total_Trades,
       SUM(No_of_shares) AS Trade_Volume,
       SUM(No_of_shares * Price_share) AS Trade_Value
FROM Fact_Trades
GROUP BY Company_ID;

GO

CREATE VIEW vw_Dividend_Analysis AS
SELECT Company_ID,
       AVG(Dividend_Yield) AS Avg_Yield,
       SUM(Dividend_Per_Share) AS Total_Dividend
FROM Dividends
GROUP BY Company_ID;

GO

CREATE VIEW vw_Account_CashFlow AS
SELECT Account_ID,
       SUM(Amount) AS Total_CashFlow
FROM Cash_Transactions
GROUP BY Account_ID;
