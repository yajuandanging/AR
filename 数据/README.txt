1, The first column is the timestamp which is the value  of 
time  in  seconds since 00:00:00 UTC, January 1, 1970.

2, The names of columns are listed in file apache.dat.list and
httper.dat.list

3, There are three sets of data. The first set was collected
in a 7-day period with a connection rate of 350 per second.
The second set was collected in a 25-day period with
connection rate of  400 per second. While the connection rates
in data set I and data set II  are constant, the connection
rate of the third data set varied  from 350 per second to 390
per second during a 14-day period.

4, The data in each set consists of two parts. The first part,
contained in file apache.dat, is system status information of
Knopfler which is the host machine of the Apache web server.
This part of data was recorded by Procmon, the Linux system
monitoring tool. Another part of the data, contained in file
httperf.dat, is the performance of the web server, which  was
recorded by Httperf. All data were recorded at five-minute
intervals.


5. 

TDSC paper data set Use:
the connection
rate of the third data set varied  from 350 per second to 390
per second during a 14-day period
