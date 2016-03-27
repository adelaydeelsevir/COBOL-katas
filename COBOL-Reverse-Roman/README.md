# COBOL-Reverse-Roman-Kata-Solution

Solution to the Reverse Roman kata written in COBOL using COBOL 2002 user-defined functions.  I used OpenCOBOL IDE to program this and versin 2.0 of the GnuCOBOL compiler.

Having failed to get either of the free software unit testing frameworks for COBOL to work, I've opted for writing tests myself using [my own nacsent set of COBOL sub-programs](https://github.com/mikebharris/COBOL-Test-Suite).

Here's the Kata (taken from cyber-dojo.org):
```
Given a Roman number as a string (eg "XX") determine
its integer value (eg 20).

You cannot write numerals like IM for 999.
Wikipedia states "Modern Roman numerals are written by
expressing each digit separately starting with the
leftmost digit and skipping any digit with a value of zero."

Examples:

   "I" -> 1 |    "X" -> 10 |    "C" -> 100 |    "M" -> 1000 
  "II" -> 2 |   "XX" -> 20 |   "CC" -> 200 |   "MM" -> 2000 
 "III" -> 3 |  "XXX" -> 30 |  "CCC" -> 300 |  "MMM" -> 3000 
  "IV" -> 4 |   "XL" -> 40 |   "CD" -> 400 | "MMMM" -> 4000 
   "V" -> 5 |    "L" -> 50 |    "D" -> 500 | 
  "VI" -> 6 |   "LX" -> 60 |   "DC" -> 600 | 
 "VII" -> 7 |  "LXX" -> 70 |  "DCC" -> 700 | 
"VIII" -> 8 | "LXXX" -> 80 | "DCCC" -> 800 | 
  "IX" -> 9 |   "XC" -> 90 |   "CM" -> 900 | 

 "MCMXC" -> 1990 ("M" -> 1000 + "CM" -> 900 + "XC" -> 90)
"MMVIII" -> 2008 ("MM" -> 2000 + "VIII" -> 8)
  "XCIX" -> 99   ("XC" -> 90 + "IX" -> 9)
 "XLVII" -> 47   ("XL" -> 40 + "VII" -> 7)


```

To run the code, you'll need version 2.0 of the free GnuCOBOL compiler (to support user-defined functions) and the two files (test file and user defined function for converting Roman numbers to Arabic numbers).  You'll also need the AssertEquals routine from [COBOL-Test-Suite](https://github.com/mikebharris/COBOL-Test-Suite) compiled and somewhere in your GNU Cobol library path.
```
$ cobc --free RomanToArabic.cbl
$ cobc -x --free -L ../../COBOL-Test-Suite/Assert ReverseRomanTest.cbl 
$ ./ReverseRomanTest 
Passed: Test 1: MM = 2000
Passed: Test 2: MCM = 1900
Passed: Test 3: MMCCC = 2300
Passed: Test 4: MMD = 2500
Passed: Test 5: MMDCCC = 2800
Passed: Test 6: MMCD = 2400
Passed: Test 7: MMCDXXX = 2430
Passed: Test 8: MMCDXC = 2490
Passed: Test 9: MMCDL = 2450
Passed: Test 10: MMCDLXXX = 2480
Passed: Test 11: MMCDXL = 2440
Passed: Test 12: MMCDXLV = 2445
Passed: Test 13: MMCDXLVI = 2446
Passed: Test 14: MMCDXLIV = 2444
Passed: Test 15: MMCDXLIX = 2449
Passed: Test 16: MCMXC = 1990
Passed: Test 17: MMVIII = 2008
Passed: Test 18: XCIX = 99
Passed: Test 19: XLVII = 47
Passed: Test 20: MMMMDCCCLXXXVIII = 4888
Passed: Test 21: BGAHSH returns 0
$
```
