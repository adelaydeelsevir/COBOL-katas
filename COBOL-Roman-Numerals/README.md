# COBOL-Roman-Numerals-Kata-Solution

Solution to the Roman Numbers kata written in COBOL using COBOL 2000 user-defined functions.  I used OpenCOBOL IDE to program this and versin 2.0 of the GnuCOBOL compiler.

Having failed to get either of the free software unit testing frameworks for COBOL to work, I've opted for writing tests myself.

Here's the Kata (taken from cyber-dojo.org):
```
Given a positive integer number (eg 42) determine
its Roman numeral representation as a String (eg "XLII").

You cannot write numerals like IM for 999.
Wikipedia states "Modern Roman numerals are written by
expressing each digit separately starting with the
leftmost digit and skipping any digit with a value of zero."

Examples:

1 ->    "I" | 10 ->    "X" | 100 ->    "C" | 1000 ->    "M"
2 ->   "II" | 20 ->   "XX" | 200 ->   "CC" | 2000 ->   "MM"
3 ->  "III" | 30 ->  "XXX" | 300 ->  "CCC" | 3000 ->  "MMM"
4 ->   "IV" | 40 ->   "XL" | 400 ->   "CD" | 4000 -> "MMMM"
5 ->    "V" | 50 ->    "L" | 500 ->    "D" |
6 ->   "VI" | 60 ->   "LX" | 600 ->   "DC" |
7 ->  "VII" | 70 ->  "LXX" | 700 ->  "DCC" |
8 -> "VIII" | 80 -> "LXXX" | 800 -> "DCCC" |
9 ->   "IX" | 90 ->   "XC" | 900 ->   "CM" |

1990 -> "MCMXC"  (1000 -> "M"  + 900 -> "CM" + 90 -> "XC")
2008 -> "MMVIII" (2000 -> "MM" + 8 -> "VIII")
  99 -> "XCIX"   (90 -> "XC" + 9 -> "IX")
  47 -> "XLVII"  (40 -> "XL" + 7 -> "VII")
```

To run the code, you'll need version 2.0 of the free GnuCOBOL compiler and the two files (main code and user defined function for calculating if a year is a leap year).
```
$ cobc --free ArabicToRoman.cbl 
$ cobc -x -free RomanNumeralsTest.cbl 
$ ./RomanNumeralsTest 
Test 01 passed 1990 = MCMXC                                   
Test 02 passed 2008 = MMVIII                                  
Test 03 passed 0047 = XLVII                                   
Test 04 passed 0099 = XCIX                                    
Test 05 passed 2525 = MMDXXV                                  
Test 06 passed 5999 = MMMMMCMXCIX 
$
```
