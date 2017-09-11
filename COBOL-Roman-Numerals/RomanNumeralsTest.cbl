identification division.
program-id. RomanNumeralsTest.

*> Given a positive integer number (eg 42) determine
*> its Roman numeral representation as a String (eg "XLII").

*> You cannot write numerals like IM for 999.
*> Wikipedia states "Modern Roman numerals are written by
*> expressing each digit separately starting with the
*> leftmost digit and skipping any digit with a value of zero."

*> Examples:

*> 1 ->    "I" | 10 ->    "X" | 100 ->    "C" | 1000 ->    "M"
*> 2 ->   "II" | 20 ->   "XX" | 200 ->   "CC" | 2000 ->   "MM"
*> 3 ->  "III" | 30 ->  "XXX" | 300 ->  "CCC" | 3000 ->  "MMM"
*> 4 ->   "IV" | 40 ->   "XL" | 400 ->   "CD" | 4000 -> "MMMM"
*> 5 ->    "V" | 50 ->    "L" | 500 ->    "D" |
*> 6 ->   "VI" | 60 ->   "LX" | 600 ->   "DC" |
*> 7 ->  "VII" | 70 ->  "LXX" | 700 ->  "DCC" |
*> 8 -> "VIII" | 80 -> "LXXX" | 800 -> "DCCC" |
*> 9 ->   "IX" | 90 ->   "XC" | 900 ->   "CM" |

*> 1990 -> "MCMXC"  (1000 -> "M"  + 900 -> "CM" + 90 -> "XC")
*> 2008 -> "MMVIII" (2000 -> "MM" + 8 -> "VIII")
  *> 99 -> "XCIX"   (90 -> "XC" + 9 -> "IX")
  *> 47 -> "XLVII"  (40 -> "XL" + 7 -> "VII")

environment division.
configuration section.
    repository.
        function ArabicToRoman.

data division.
working-storage section.
01 ArabicNumber pic 9(4) value zero.
01 ExpectedResult pic x(40) value spaces.
01 ReturnedResult pic x(40) value spaces.
01 CurrentTest pic 99 value 1.

procedure division.
Main section.
    move 1990 to ArabicNumber
    move "MCMXC" to ExpectedResult
    move ArabicToRoman(ArabicNumber) to ReturnedResult
    perform RunTest

    add 1 to CurrentTest
    move 2008 to ArabicNumber
    move "MMVIII" to ExpectedResult
    move ArabicToRoman(ArabicNumber) to ReturnedResult
    perform RunTest

    add 1 to CurrentTest
    move 47 to ArabicNumber
    move "XLVII" to ExpectedResult
    move ArabicToRoman(ArabicNumber) to ReturnedResult
    perform RunTest

    add 1 to CurrentTest
    move 99 to ArabicNumber
    move "XCIX" to ExpectedResult
    move ArabicToRoman(ArabicNumber) to ReturnedResult
    perform RunTest

    add 1 to CurrentTest
    move 2525 to ArabicNumber
    move "MMDXXV" to ExpectedResult
    move ArabicToRoman(ArabicNumber) to ReturnedResult
    perform RunTest

    add 1 to CurrentTest
    move 5999 to ArabicNumber
    move "MMMMMCMXCIX" to ExpectedResult
    move ArabicToRoman(ArabicNumber) to ReturnedResult
    perform RunTest

    stop run
    .

RunTest section.
    if ReturnedResult equals ExpectedResult then
      display "Test " CurrentTest " passed " ArabicNumber " = " ExpectedResult
    else
      display "Test " CurrentTest " failed: expected " ExpectedResult " but got " ReturnedResult
    end-if
    exit section
    .

end program RomanNumeralsTest.
