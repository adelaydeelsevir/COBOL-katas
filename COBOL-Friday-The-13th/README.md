# COBOL-Friday-13th-Kata-Solution
A solution to the Friday the 13th kata written in COBOL

I thought I'd try my hand at the Friday the 13th kata in COBOL and here's the source code.

The kata is from http://cyber-dojo.org:
```
Write a program to show that the 13th day of the month
falls more often on a Friday than any other day of the
week. The 1st of January 1973 was a Monday.
You should aim at producing the clearest possible
program, not the fastest.

[source: BCPL the language and its compiler
by Martin Richards and Colin Whitby-Strevens]
```
To run the code, you'll need version 2.0 of the free GnuCOBOL compiler and the two files (main code and user defined function for calculating if a year is a leap year).
```
$ cobc --free IsLeapYear.cbl DayOfWeek.cbl
$ cobc -x --free FridayThe13.cbl
$ ./FridayThe13 
Results - Number of occurances of each day
==========================================
Start date: Thursday 01/01/1801
End date  : Monday   29/02/2016
 
Sunday    : 0369
Monday    : 0369
Tuesday   : 0368
Wednesday : 0370
Thursday  : 0367
Friday    : 0371
Saturday  : 0368
 
Therefore the 13th is most often a Friday   
Days processed  78,587
```
