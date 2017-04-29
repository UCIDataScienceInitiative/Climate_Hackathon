## Description

Wildfire data from the US west coast from 2010 to 2016 obtained from NASA's [MODIS](https://modis.gsfc.nasa.gov/about/) instruments on two satellites and pre-processed by Zach Butler (4th year CS PhD student, thanks Zach!). MODIS stands for Moderate Resolution Imaging Spectroradiometer, and the pair of instruments scans the entire Earth's surface everyday measuring hundreds of variables. The data in this directory focuses on fire detections, which MODIS accomplishes by measuring the brightness of the Earth's surface at <lat,lon> pairs with some associated uncertainty. Note that fires can be comprised of multiple detections at different locations and possibly different times (think of a wildfire spreading over a region on multiple days). How to define distinct fire events on larger scales is one potential problem that will be left to you to solve if you choose to analyze this data.

The csv file contains the following fields:
+ id: unique identifier of the fire in the overall context of the world dataset
+ confidence: how much confidence the satellite has that this is actually a fire detection (percent)
+ day: the day of the month
+ frp: Fire Radiative Power, the strength of the fire
+ lat: latitude
+ lon: longitude
+ month: month of the year
+ year: year
+ x: x position in a uniformly-spaced grid
+ y: y position in a uniformly-spaced grid
+ dayofyear: day of the year (from 0 to 364 or 365 for leap years)
+ vpd: [Vapor Pressure Deficit](https://en.wikipedia.org/wiki/Vapour-pressure_deficit), the difference between the moisture in the air and the amount of moisture the air could hold
+ temp: temperature (degrees Kelvin)
+ humidity: humidity (percent)