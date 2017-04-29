## Description

Wildfire data from the US west coast from 2010 to 2016 obtained from NASA's MODIS satellite and pre-processed by Zach Butler (4th year CS PhD student, thanks Zach!). Contains the following fields:

+ id: unique identifier of the fire in the overall context of the world dataset
+ confidence: how much confidence the satellite has that this is actually a fire detection
+ day: the day of the month
+ frp: Fire Radiative Power, the strength of the fire
+ lat: latitude
+ long: longitude
+ month: month of the year
+ year: year
+ x: x position in a uniformly-spaced grid
+ y: y position in a uniformly-spaced grid
+ dayofyear: day of the year (from 0 to 364 or 365)
+ vpd: [Vapor Pressure Deficit](https://en.wikipedia.org/wiki/Vapour-pressure_deficit), the difference between the moisture in the air and the amount of moisture the air could hold
+ temp: temperature
+ humidity: humidity