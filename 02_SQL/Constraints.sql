SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Company_ID) DistinctRows
FROM Companies;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Stock_ID) DistinctRows
FROM Stocks;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Investor_ID) DistinctRows
FROM Investors;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Broker_ID) DistinctRows
FROM Brokers;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Account_ID) DistinctRows
FROM Trading_Accounts;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Trade_ID) DistinctRows
FROM Fact_Trades;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Dividend_ID) DistinctRows
FROM Dividends;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Cash_Transaction_ID) DistinctRows
FROM Cash_Transactions;


SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Price_ID) DistinctRows
FROM Historical_Prices;

SELECT COUNT(*) TotalRows,
COUNT(DISTINCT Holding_ID) DistinctRows
FROM Portfolio_Holdings;

--primary keys
ALTER TABLE Companies
ADD CONSTRAINT PK_Companies
PRIMARY KEY (Company_ID);

ALTER TABLE Stocks
ADD CONSTRAINT PK_Stocks
PRIMARY KEY (Stock_ID);

ALTER TABLE Investors
ADD CONSTRAINT PK_Investors
PRIMARY KEY (Investor_ID);

ALTER TABLE Brokers
ADD CONSTRAINT PK_Brokers
PRIMARY KEY (Broker_ID);

ALTER TABLE Trading_Accounts
ADD CONSTRAINT PK_TradingAccounts
PRIMARY KEY (Account_ID);

ALTER TABLE Dim_Date
ADD CONSTRAINT PK_DimDate
PRIMARY KEY (Date_Key);

ALTER TABLE Fact_Trades
ADD CONSTRAINT PK_FactTrades
PRIMARY KEY (Trade_ID);

ALTER TABLE Dividends
ADD CONSTRAINT PK_Dividends
PRIMARY KEY (Dividend_ID);

ALTER TABLE Cash_Transactions
ADD CONSTRAINT PK_CashTransactions
PRIMARY KEY (Cash_Transaction_ID);

ALTER TABLE Historical_Prices
ADD CONSTRAINT PK_HistoricalPrices
PRIMARY KEY (Price_ID);

ALTER TABLE Portfolio_Holdings
ADD CONSTRAINT PK_PortfolioHoldings
PRIMARY KEY (Holding_ID)

sp_help Portfolio_Holdings;
sp_help Cash_Transactions;
sp_help Historical_Prices;
sp_help Dividends

--foreign keys
ALTER TABLE Stocks
ADD CONSTRAINT FK_Stocks_Companies
FOREIGN KEY (Company_ID)
REFERENCES Companies(Company_ID);

ALTER TABLE Trading_Accounts
ADD CONSTRAINT FK_TradingAccounts_Investors
FOREIGN KEY (Investor_ID)
REFERENCES Investors(Investor_ID);

ALTER TABLE Trading_Accounts
ADD CONSTRAINT FK_TradingAccounts_Brokers
FOREIGN KEY (Broker_ID)
REFERENCES Brokers(Broker_ID);

ALTER TABLE Fact_Trades
ADD CONSTRAINT FK_FactTrades_Accounts
FOREIGN KEY (Account_ID)
REFERENCES Trading_Accounts(Account_ID);

ALTER TABLE Fact_Trades
ADD CONSTRAINT FK_FactTrades_Brokers
FOREIGN KEY (Broker_ID)
REFERENCES Brokers(Broker_ID);

ALTER TABLE Fact_Trades
ADD CONSTRAINT FK_FactTrades_Companies
FOREIGN KEY (Company_ID)
REFERENCES Companies(Company_ID);

ALTER TABLE Portfolio_Holdings
ADD CONSTRAINT FK_PortfolioHoldings_Accounts
FOREIGN KEY (Account_ID)
REFERENCES Trading_Accounts(Account_ID);

ALTER TABLE Portfolio_Holdings
ADD CONSTRAINT FK_PortfolioHoldings_Companies
FOREIGN KEY (Company_ID)
REFERENCES Companies(Company_ID);

ALTER TABLE Cash_Transactions
ADD CONSTRAINT FK_CashTransactions_Accounts
FOREIGN KEY (Account_ID)
REFERENCES Trading_Accounts(Account_ID);

ALTER TABLE Historical_Prices
ADD CONSTRAINT FK_HistoricalPrices_Companies
FOREIGN KEY (Company_ID)
REFERENCES Companies(Company_ID);

ALTER TABLE Dividends
ADD CONSTRAINT FK_Dividends_Companies
FOREIGN KEY (Company_ID)
REFERENCES Companies(Company_ID);


SELECT TABLE_NAME,COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
ORDER BY TABLE_NAME,ORDINAL_POSITION;