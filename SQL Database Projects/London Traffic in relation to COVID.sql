
-- How have traffic patterns changed since before COVID?
-- How has traffic changed before and after specific lockdown restriction dates?

-- Key dates found here: "https://www.instituteforgovernment.org.uk/sites/default/files/timeline-lockdown-web.pdf"
-- ONS CCTV data found here: https://www.ons.gov.uk/economy/economicoutputandproductivity/output/datasets/trafficcameraactivity

-- Table of Key dates related to lockdown
SELECT *
FROM LondonRoadTraffic..LockdownEvents

-- Table of London CCTV data
SELECT *
FROM LondonRoadTraffic..LondonTraffic


-- Weekly difference:
-- 1. Traffic in the week period before and after the first lockdown

-- 1.1 car traffic in the week period before the first lockdown (2,863,960)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-20' AND '2020-03-26';

-- 1.2 car traffic in the week period after the first lockdown (2,445,602)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-01';

-- The Percentage difference in car traffic during week before and after first lockdown (-15%)
SELECT 100.0*(2445602 - 2863960) / 2863960 AS PercentDiff;
-- Car traffic reduced by 15% a week after the first lockdown restrictions came into force



-- 1.3 Motorbike traffic in the week period before the first lockdown (7,698)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-20' AND '2020-03-26';

-- 1.4 Motorbike traffic in the week period after the first lockdown (9,240)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-01';

-- The Percentage difference in motorbike traffic during week before and after first lockdown (+20%)
SELECT 100.0*(9240 - 7698) / 7698 AS PercentDiff;
-- Motorbike traffic increased by 20% during the week after the first lockdown restrictions came into force



-- 1.5 Buses traffic in the week period before the first lockdown (222,788)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-20' AND '2020-03-26';

-- 1.6 Buses traffic in the week period after the first lockdown (220,948)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-01';

-- The Percentage difference in Bus traffic during week before and after first lockdown (-1%)
SELECT 100.0*(220948 - 222788) / 222788 AS PercentDiff;
-- -- Bus traffic reduced by 1% after the first lockdown restrictions came into force



-- 1.7 Pedestrians and Cyclists in the week period before the first lockdown (427,908)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-20' AND '2020-03-26';

-- 1.8 Pedestrians and Cyclists in the week period after the first lockdown (422,532)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-01';

-- The Percentage difference in pedestrians and cyclists during week before and after first lockdown (-1%)
SELECT 100.0*(422532 - 427908) / 427908 AS PercentDiff;
-- -- Pedestrians and cyclist numbers reduced by 1% the week after the first lockdown restrictions came into force



-- 2. Traffic in the week period before and after the second lockdown

-- 2.1 Car traffic in the week period before the second lockdown (3223872)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-30' AND '2020-11-05';

-- 2.2 Car traffic in the week period after the second lockdown (2617096)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-11';

-- The Percentage difference in car traffic during week before and after second lockdown (-18%)
SELECT 100.0*(2617096 - 3223872) / 3223872 AS PercentDiff;
-- Car traffic reduced by 18% the week after the second lockdown restrictions came into force compared to the previous week

-- 2.3 Motorbike traffic in the week period before the second lockdown (6028
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-30' AND '2020-11-05';

-- 2.4 Motorbike traffic in the week period after the second lockdown (6854)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-11';

-- The Percentage difference in motorbike traffic during week before and after second lockdown (+13%)
SELECT 100.0*(6854 - 6028) / 6028 AS PercentDiff;
-- Motorbike traffic increased by 13% after the second lockdown restrictions came into force


-- 2.5 Bus traffic in the week period before the second lockdown (203594)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-30' AND '2020-11-05';

-- 2.6 Bus traffic in the week period after the second lockdown (196524)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-11';

-- The Percentage difference in bus traffic during week before and after second lockdown (-3.5%)
SELECT 100.0*(196524 - 203594) / 203594 AS PercentDiff;
-- Bus traffic decreased by 3.5% after the second lockdown restrictions came into force


-- 2.7 Pedestrians and cyclists in the week period before the second lockdown (488828)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-30' AND '2020-11-05';

-- 2.8 Pedestrians and cyclists in the week period after the second lockdown (459656)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-11';

-- The Percentage difference in number of pedestrians and cyclists during week before and after second lockdown (-6%)
SELECT 100.0*(459656 - 488828) / 488828 AS PercentDiff;
-- Number of pedestrians and cyclists decreased by -6% 
-- the week after the second lockdown restrictions came into force compared to the previous week



-- 3. Traffic in the week period before and after the third lockdown

-- 3.1 Car traffic in the week period before the third lockdown (2533936)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-31' AND '2021-01-06';

-- 3.2 Car traffic in the week period after the third lockdown (2453196)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-12';

-- The Percentage difference in car traffic during week before and after third lockdown (-3%)
SELECT 100.0*(2453196 - 2533936) / 2533936 AS PercentDiff;
-- Car traffic reduced by 3% the week after the third lockdown restrictions came into force compared to the previous week


-- 3.3 Motorbike traffic in the week period before the third lockdown (5720)
SELECT SUM(Motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-31' AND '2021-01-06';

-- 3.4 Motorbike traffic in the week period after the third lockdown (6348)
SELECT SUM(Motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-12';

-- The Percentage difference in motorbike traffic during week before and after third lockdown (+11%)
SELECT 100.0*(6348 - 5720) / 5720 AS PercentDiff;
-- Motorbike traffic increased by 11% the week after the third lockdown restrictions
-- came into force compared to the previous week


-- 3.5 Bus traffic in the week period before the third lockdown (201420)
SELECT SUM(Buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-31' AND '2021-01-06';

-- 3.6 Bus traffic in the week period after the third lockdown (201978)
SELECT SUM(Buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-12';

-- The Percentage difference in bus traffic during week before and after third lockdown (0.3%)
SELECT 100.0*(201978 - 201420) / 201420 AS PercentDiff;
-- Bus traffic increased by 0.3% the week after the third lockdown restrictions
-- came into force compared to the previous week


-- 3.7 Pedestrians and cyclists in the week period before the third lockdown (366656)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-31' AND '2021-01-06';

-- 3.8 Pedestrians and cyclists in the week period after the third lockdown (386960)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-12';

-- The Percentage difference in pedestrians and cyclists during week before and after third lockdown (+6%)
SELECT 100.0*(386960 - 366656) / 366656 AS PercentDiff;
-- Pedestrians and cyclists increased by 6% the week after the third lockdown restrictions
-- came into force compared to the previous week




-- 2 Week Difference
-- 1. Traffic in the 2 week period before and after the first lockdown

-- 1.1 car traffic in the 2 week period before the first lockdown (6826520)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-13' AND '2020-03-26';

-- 1.2 car traffic in the 2 week period after the first lockdown (4500812)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-08';

-- The Percentage difference in car traffic during the 2 week period before and after first lockdown (-34%)
SELECT 100.0*(4500812 - 6826520) / 6826520 AS PercentDiff;
-- Car traffic decreased by 34% 2 weeks after the first lockdown restrictions came into force
-- compared to the 2 weeks before the lockdown


-- 1.3 Motorbike traffic in 2 week period before the first lockdown (15110)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-13' AND '2020-03-26';

-- 1.4 Motorbike traffic in the 2 week period after the first lockdown (18124)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-08';

-- The Percentage difference in motorbike traffic during the 2 week period before and after first lockdown (+20%)
SELECT 100.0*(18124 - 15110) / 15110 AS PercentDiff;
-- Motorbike traffic increased by 20% during the 2 week period after the first lockdown restrictions came into force
-- compared to the 2 weeks before lockdown



-- 1.5 Buses traffic in the 2 week period before the first lockdown (486868)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-13' AND '2020-03-26';

-- 1.6 Buses traffic in the 2 week period after the first lockdown (418578)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-08';

-- The Percentage difference in Bus traffic during the 2 week period before and after first lockdown (-14%)
SELECT 100.0*(418578 - 486868) / 486868 AS PercentDiff;
-- Bus traffic reduced by 14% 2 weeks after the first lockdown restrictions came into force
-- compared to the 2 weeks before lockdown



-- 1.7 Pedestrians and Cyclists in the 2 week period before the first lockdown (1082232)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-13' AND '2020-03-26';

-- 1.8 Pedestrians and Cyclists in the 2 week period after the first lockdown (817742)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-03-26' AND '2020-04-08';

-- The Percentage difference in pedestrians and cyclists during the 2 week period before and after first lockdown (-24%)
SELECT 100.0*(817742 - 1082232) / 1082232 AS PercentDiff;
-- -- Pedestrians and cyclist numbers reduced by 24% in the 2 week period after the first lockdown restrictions came into force
-- compared to the 2 weeks before lockdown



-- 2. Traffic in the 2 week period before and after the second lockdown

-- 2.1 Car traffic in the 2 week period before the second lockdown (6260654)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-23' AND '2020-11-05';

-- 2.2 Car traffic in the 2 week period after the second lockdown (5281816)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-18';

-- The Percentage difference in car traffic during the 2 week period before and after second lockdown (-16%)
SELECT 100.0*(5281816 - 6260654) / 6260654 AS PercentDiff;
-- Car traffic reduced by 16% in the 2 week period after the second lockdown restrictions
-- came into force compared to the previous 2 week period


-- 2.3 Motorbike traffic in the 2 week period before the second lockdown (11818)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-23' AND '2020-11-05';

-- 2.4 Motorbike traffic in the 2 week period after the second lockdown (13032)
SELECT SUM(motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-18';

-- The Percentage difference in motorbike traffic during the 2 week before and after second lockdown (+10%)
SELECT 100.0*(13032 - 11818) / 11818 AS PercentDiff;
-- Motorbike traffic increased by 10% in the 2 week period after the second lockdown restrictions
-- came into force compared to the previous 2 week period


-- 2.5 Bus traffic in the 2 week period before the second lockdown (408320)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-23' AND '2020-11-05';

-- 2.6 Bus traffic in the 2 week period after the second lockdown (396812)
SELECT SUM(buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-18';

-- The Percentage difference in bus traffic during the 2 week period before and after second lockdown (-3%)
SELECT 100.0*(396812 - 408320) / 408320 AS PercentDiff;
-- Bus traffic decreased by 3% in the 2 week period after the second lockdown restrictions came into force
-- compared to the previous 2 week period


-- 2.7 Pedestrians and cyclists in the 2 week period before the second lockdown (943418)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-10-23' AND '2020-11-05';

-- 2.8 Pedestrians and cyclists in the 2 week period after the second lockdown (888686)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-11-05' AND '2020-11-18';

-- The Percentage difference in number of pedestrians and cyclists during the 2 week before and after second lockdown (-6%)
SELECT 100.0*(888686 - 943418) / 943418 AS PercentDiff;
-- Number of pedestrians and cyclists decreased by -6% in the 2 week period after
-- after the second lockdown restrictions came into force compared to the previous 2 week period



-- 3. Traffic in the 2 week period before and after the third lockdown

-- 3.1 Car traffic in the 2 week period before the third lockdown (5141350)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-24' AND '2021-01-06';

-- 3.2 Car traffic in the 2 week period after the third lockdown (4852754)
SELECT SUM(cars)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-19';

-- The Percentage difference in car traffic during the 2 week before and after third lockdown (-6%)
SELECT 100.0*(4852754 - 5141350) / 5141350 AS PercentDiff;
-- Car traffic reduced by 6% in the 2 week period after the third lockdown restrictions came into force
-- compared to the previous 2 week period


-- 3.3 Motorbike traffic in the 2 week period before the third lockdown (11710)
SELECT SUM(Motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-24' AND '2021-01-06';

-- 3.4 Motorbike traffic in the 2 week period after the third lockdown (12148)
SELECT SUM(Motorbikes)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-19';

-- The Percentage difference in motorbike traffic during the 2 week period before and after third lockdown (+4%)
SELECT 100.0*(12148 - 11710) / 11710 AS PercentDiff;
-- Motorbike traffic increased by 4% in the 2 week period after the third lockdown restrictions
-- came into force compared to the previous 2 week period


-- 3.5 Bus traffic in the 2 week period before the third lockdown (366112)
SELECT SUM(Buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-24' AND '2021-01-06';

-- 3.6 Bus traffic in the 2 week period after the third lockdown (401964)
SELECT SUM(Buses)
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-19';

-- The Percentage difference in bus traffic during the 2 week period before and after third lockdown (10%)
SELECT 100.0*(401964 - 366112) / 366112 AS PercentDiff;
-- Bus traffic increased by 10% in the 2 week period after the third lockdown restrictions
-- came into force compared to the previous 2 week period


-- 3.7 Pedestrians and cyclists in the week period before the third lockdown (756634)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2020-12-24' AND '2021-01-06';

-- 3.8 Pedestrians and cyclists in the 2 week period after the third lockdown (726404)
SELECT SUM([Pedestrians/cyclists])
FROM LondonRoadTraffic..LondonTraffic
WHERE Dates BETWEEN '2021-01-06' AND '2021-01-19';

-- The Percentage difference in pedestrians and cyclists in the 2 week period before and after third lockdown (-4%)
SELECT 100.0*(726404 - 756634) / 756634 AS PercentDiff;
-- Pedestrians and cyclists decreased by 4% in the 2 week period after the third lockdown restrictions
-- came into force compared to the previous 2 week period
