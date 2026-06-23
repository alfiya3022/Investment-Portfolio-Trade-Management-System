
/* Triggers.sql */

CREATE TRIGGER trg_PreventNegativeCashTransaction
ON Cash_Transactions
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Amount < 0)
    BEGIN
        RAISERROR ('Negative Amount Not Allowed',16,1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE TRIGGER trg_ValidateTradeQuantity
ON Fact_Trades
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE No_of_shares <= 0)
    BEGIN
        RAISERROR ('Invalid Share Quantity',16,1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE TRIGGER trg_TradeAudit
ON Fact_Trades
AFTER INSERT
AS
BEGIN
    PRINT 'New Trade Inserted';
END;
