

-- Data pre-cleaned in Excel (nulls replaced with 0, removed unwanted columns)

SELECT *
FROM [London Housing]..housing_in_london_monthly_varia$



-- Standardising dates, removing the time from the dates column as not needed

SELECT datesconverted, convert(date, dates)
FROM [London Housing]..housing_in_london_monthly_varia$

Update housing_in_london_monthly_varia$
SET dates = convert(date, dates)

ALTER TABLE housing_in_london_monthly_varia$
ADD datesconverted Date;

Update housing_in_london_monthly_varia$
SET datesconverted = convert(date, dates)



-- Adding commas to prices at every 4th digit

SELECT format(average_price, '0,000') as pricefixed
FROM [London Housing]..housing_in_london_monthly_varia$

Update housing_in_london_monthly_varia$
SET fixedprice = format(average_price, '0,000')

ALTER TABLE housing_in_london_monthly_varia$
ADD fixedprice float

SELECT fixedprice
FROM [London Housing]..housing_in_london_monthly_varia$