identification division.
program-id. ReverseRomanTest.

*> Given a Roman number as a string (eg "XX") determine
*> its integer value (eg 20).

*> You cannot write numerals like IM for 999.
*> Wikipedia states "Modern Roman numerals are written by
*> expressing each digit separately starting with the
*> leftmost digit and skipping any digit with a value of zero."

*> Examples:

   *> "I" -> 1 |    "X" -> 10 |    "C" -> 100 |    "M" -> 1000
  *> "II" -> 2 |   "XX" -> 20 |   "CC" -> 200 |   "MM" -> 2000
 *> "III" -> 3 |  "XXX" -> 30 |  "CCC" -> 300 |  "MMM" -> 3000
  *> "IV" -> 4 |   "XL" -> 40 |   "CD" -> 400 | "MMMM" -> 4000
   *> "V" -> 5 |    "L" -> 50 |    "D" -> 500 |
  *> "VI" -> 6 |   "LX" -> 60 |   "DC" -> 600 |
 *> "VII" -> 7 |  "LXX" -> 70 |  "DCC" -> 700 |
*> "VIII" -> 8 | "LXXX" -> 80 | "DCCC" -> 800 |
  *> "IX" -> 9 |   "XC" -> 90 |   "CM" -> 900 |

 *> "MCMXC" -> 1990 ("M" -> 1000 + "CM" -> 900 + "XC" -> 90)
*> "MMVIII" -> 2008 ("MM" -> 2000 + "VIII" -> 8)
  *> "XCIX" -> 99   ("XC" -> 90 + "IX" -> 9)
 *> "XLVII" -> 47   ("XL" -> 40 + "VII" -> 7)

environment division.
configuration section.
    repository.
        function RomanToArabic.

data division.
working-storage section.
01 InputValue pic x(40) value spaces.
01 ExpectedResult pic 9(4) value zero.
01 ReturnedResult pic 9(4) value zero.

procedure division.

    move "MM" to InputValue
    move 2000 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 1: MM = 2000"

    move "MCM" to InputValue
    move 1900 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 2: MCM = 1900"

    move "MMCCC" to InputValue
    move 2300 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 3: MMCCC = 2300"

    move "MMD" to InputValue
    move 2500 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 4: MMD = 2500"

    move "MMDCCC" to InputValue
    move 2800 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 5: MMDCCC = 2800"

    move "MMCD" to InputValue
    move 2400 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 6: MMCD = 2400"

    move "MMCDXXX" to InputValue
    move 2430 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 7: MMCDXXX = 2430"

    move "MMCDXC" to InputValue
    move 2490 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 8: MMCDXC = 2490"

    move "MMCDL" to InputValue
    move 2450 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 9: MMCDL = 2450"

    move "MMCDLXXX" to InputValue
    move 2480 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 10: MMCDLXXX = 2480"

    move "MMCDXL" to InputValue
    move 2440 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 11: MMCDXL = 2440"

    move "MMCDXLV" to InputValue
    move 2445 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 12: MMCDXLV = 2445"

    move "MMCDXLVI" to InputValue
    move 2446 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 13: MMCDXLVI = 2446"

    move "MMCDXLIV" to InputValue
    move 2444 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 14: MMCDXLIV = 2444"

    move "MMCDXLIX" to InputValue
    move 2449 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 15: MMCDXLIX = 2449"

    move "MCMXC" to InputValue
    move 1990 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 16: MCMXC = 1990"

    move "MMVIII" to InputValue
    move 2008 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 17: MMVIII = 2008"

    move "XCIX" to InputValue
    move 99 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 18: XCIX = 99"

    move "XLVII" to InputValue
    move 47 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 19: XLVII = 47"

    move "MMMMDCCCLXXXVIII" to InputValue
    move 4888 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 20: MMMMDCCCLXXXVIII = 4888"

    move "BGAHSH" to InputValue
    move 0 to ExpectedResult
    move RomanToArabic(InputValue) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Test 21: BGAHSH returns 0"

    stop run.

end program ReverseRomanTest.
