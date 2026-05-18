CREATE DATABASE zomato_stock_pred;
USE zomato_stock_pred;
CREATE TABLE stock_prices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    trade_date DATE NOT NULL UNIQUE,
    open_price DECIMAL(10,2) NOT NULL,
    high_price DECIMAL(10,2) NOT NULL,
    low_price DECIMAL(10,2) NOT NULL,
    close_price DECIMAL(10,2) NOT NULL,
    adj_close DECIMAL(10,2),
    volume BIGINT NOT NULL
);
SHOW TABLES;
SELECT COUNT(*) FROM stock_prices;
SELECT * FROM stock_prices LIMIT 5;
CREATE TABLE daily_returns (
    trade_date DATE PRIMARY KEY,
    daily_return DECIMAL(10,6),
    log_return DECIMAL(10,6),
    absolute_change DECIMAL(10,2),
    FOREIGN KEY (trade_date) REFERENCES stock_prices(trade_date)
);
SHOW TABLES;
INSERT INTO daily_returns (trade_date, daily_return, log_return, absolute_change)
SELECT 
    trade_date,
    (close_price - LAG(close_price) OVER (ORDER BY trade_date)) 
        / LAG(close_price) OVER (ORDER BY trade_date) AS daily_return,
    LOG(close_price / LAG(close_price) OVER (ORDER BY trade_date)) AS log_return,
    close_price - LAG(close_price) OVER (ORDER BY trade_date) AS absolute_changedaily_returns
FROM stock_prices;
TRUNCATE TABLE daily_returns;
INSERT INTO daily_returns (trade_date, daily_return, log_return, absolute_change)
SELECT 
    trade_date,
    (close_price - LAG(close_price) OVER (ORDER BY trade_date)) 
        / LAG(close_price) OVER (ORDER BY trade_date),
    LOG(close_price / LAG(close_price) OVER (ORDER BY trade_date)),
    close_price - LAG(close_price) OVER (ORDER BY trade_date)
FROM stock_prices;
SELECT COUNT(*) FROM daily_returns;
SELECT * FROM daily_returns LIMIT 5;
SELECT 
    COUNT(*) AS total_rows,
    COUNT(daily_return) AS non_null_returns
FROM daily_returns;
CREATE TABLE technical_indicators (
    trade_date DATE PRIMARY KEY,
    sma_7 DECIMAL(10,2),
    sma_30 DECIMAL(10,2),
    sma_90 DECIMAL(10,2),
    volatility_30 DECIMAL(10,6),
    FOREIGN KEY (trade_date) REFERENCES stock_prices(trade_date)
);
SHOW TABLES; 
INSERT INTO technical_indicators (trade_date, sma_7, sma_30, sma_90, volatility_30)
SELECT
    trade_date,

    AVG(close_price) OVER (
        ORDER BY trade_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS sma_7,

    AVG(close_price) OVER (
        ORDER BY trade_date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS sma_30,

    AVG(close_price) OVER (
        ORDER BY trade_date
        ROWS BETWEEN 89 PRECEDING AND CURRENT ROW
    ) AS sma_90,

    STDDEV_SAMP(daily_return) OVER (
        ORDER BY trade_date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS volatility_30

FROM stock_prices
JOIN daily_returns USING(trade_date);
SELECT COUNT(*) FROM technical_indicators;
SELECT * FROM technical_indicators LIMIT 10;
SELECT 
    trade_date,
    volume
FROM stock_prices
ORDER BY volume DESC
LIMIT 10;
SELECT 
    trade_date,
    daily_return
FROM daily_returns
ORDER BY daily_return DESC
LIMIT 10;
SELECT 
    trade_date,
    daily_return
FROM daily_returns
ORDER BY daily_return ASC
LIMIT 10;
SELECT 
    DATE_FORMAT(trade_date,'%Y-%m') AS month,
    ROUND(AVG(daily_return)*100,2) AS avg_return_percent,
    SUM(volume) AS total_volume
FROM daily_returns
JOIN stock_prices USING(trade_date)
GROUP BY month
ORDER BY month;
SELECT 
    t1.trade_date,
    t1.sma_30,
    t1.sma_90
FROM technical_indicators t1
JOIN technical_indicators t0 
    ON t1.trade_date = DATE_ADD(t0.trade_date, INTERVAL 1 DAY)
WHERE 
    t0.sma_30 <= t0.sma_90
    AND t1.sma_30 > t1.sma_90;
    SELECT 
    t1.trade_date,
    t1.sma_30,
    t1.sma_90
FROM technical_indicators t1
JOIN technical_indicators t0 
    ON t1.trade_date = DATE_ADD(t0.trade_date, INTERVAL 1 DAY)
WHERE 
    t0.sma_30 >= t0.sma_90
    AND t1.sma_30 < t1.sma_90;
    SELECT 
    trade_date,
    ABS(daily_return) AS volatility
FROM daily_returns
ORDER BY volatility DESC
LIMIT 10;