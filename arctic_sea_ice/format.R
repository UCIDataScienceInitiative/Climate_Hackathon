##################################################################################
##################################################################################
### DESCRIPTION: This file contains a vignette in R on netCDF4 files with arctic 
### sea ice data as an example. Read in the data & convert the first 10 years of
### observations to a traditional R data frame.
###
### AUTHOR: CHRIS GALBRAITH
##################################################################################
##################################################################################
### load necessary package & open the connection to the file
library(ncdf4)
seaice <- nc_open("G10010_SIBT1850_v1.1.nc")
print(seaice)

### get longitude, latitude & time
lon <- ncvar_get(seaice,"longitude")
nlon <- dim(lon)

lat <- ncvar_get(seaice,"latitude")
nlat <- dim(lat)

t <- ncvar_get(seaice,"time")
nt <- dim(t)
tunits <- ncatt_get(seaice,"time","units")
tunits$value

### convert time (in days since 2001-01-01) to human-readable format
sec.mult <- 60*60*24 # number of seconds in a day
ts <- as.POSIXct(t*sec.mult, origin="2001-01-01 00:00:00", tz="UTC")

### get sea ice concentration - this is a long vector that has varies first by
### longitude, then latitude, then time (i.e. the first nlon=1440 observations
### were taken at longitudes varying by 1/4 degree at fixed 89.875 deg latitude 
### on 1850-01-15, the next 1440 obs were taken at 89.625 deg lat on the same day, 
### etc). Thus, each day of measurement has nlon*nlat=345,600 observations and there 
### are 1968 total days measured (164 years * 12 monthly measurements) for approx 
### 680 million total observations. 
conc <- ncvar_get(seaice,"seaice_conc")

### get source of concentration measurement - same as concentration
src <- ncvar_get(seaice,"seaice_source")

### create data frame for first 10 years of measurements
longitude <- rep(rep(lon, nlat),nt)  # longitude varies first
latitude <- rep(rep(lat, each=nlon),nt)  # latitude varies next
date <- rep(ts, each=nlon*nlat)  # time varies last

yr.splits <- seq(1,length(conc),by=nlon*nlat*12) # index of first obs of each year
rng <- yr.splits[1]:(yr.splits[1+10]-1) # indices of all obs in first 10 years 
dat.first10 <- data.frame(lon=longitude[rng], lat=latitude[rng], date=date[rng], 
                          conc=conc[rng], src=src[rng])
head(dat.first10)
tail(dat.first10)

### close connection to file
nc_close(seaice)
