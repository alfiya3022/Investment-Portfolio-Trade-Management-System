
/* Indexes.sql */

CREATE INDEX IX_FactTrades_CompanyID
ON Fact_Trades(Company_ID);

GO

CREATE INDEX IX_FactTrades_AccountID
ON Fact_Trades(Account_ID);

GO

CREATE INDEX IX_FactTrades_TransactionDate
ON Fact_Trades(Transaction_Date);

GO

CREATE INDEX IX_HistoricalPrices_CompanyDate
ON Historical_Prices(Company_ID, Price_Date);

GO

CREATE INDEX IX_PortfolioHoldings_AccountID
ON Portfolio_Holdings(Account_ID);
