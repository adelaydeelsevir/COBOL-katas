identification division.
program-id. IntegerInWordsTest.

*> Spell out a number. For example

      *> 99 --> ninety nine
     *> 300 --> three hundred
     *> 310 --> three hundred and ten
    *> 1501 --> one thousand, five hundred and one
   *> 12609 --> twelve thousand, six hundred and nine
  *> 512607 --> five hundred and twelve thousand,
             *> six hundred and seven
*> 43112603 --> forty three million, one hundred and
             *> twelve thousand,
             *> six hundred and three

environment division.
configuration section.
    repository.
        function IntegerInWords.

data division.
working-storage section.
01 ExpectedResult pic x(100) value spaces.
01 ReturnedResult pic x(100) value spaces.

procedure division.
Main section.
    move "one hundred" to ExpectedResult
    move IntegerInWords(100) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "100 returns 'one hundred'"

    move "one hundred and two" to ExpectedResult
    move IntegerInWords(102) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "102 returns 'one hundred and two'"

    move "one hundred and ten" to ExpectedResult
    move IntegerInWords(110) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "110 returns 'one hundred and ten'"

    move "one hundred and twenty" to ExpectedResult
    move IntegerInWords(120) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "120 returns 'one hundred and twenty'"

    move "one hundred and twenty-one" to ExpectedResult
    move IntegerInWords(121) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "121 returns 'one hundred and twenty-one'"

    move "two" to ExpectedResult
    move IntegerInWords(2) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "2 returns 'two'"

    move "eleven" to ExpectedResult
    move IntegerInWords(11) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "11 returns 'eleven'"

    move "thirty" to ExpectedResult
    move IntegerInWords(30) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "30 returns 'thirty'"

    move "forty-five" to ExpectedResult
    move IntegerInWords(45) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "45 returns 'forty-five'"

    move "three hundred and ten" to ExpectedResult
    move IntegerInWords(310) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "310 returns 'three hundred and ten'"

    move "one thousand" to ExpectedResult
    move IntegerInWords(1000) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1000 returns 'one thousand'"

    move "one thousand and one" to ExpectedResult
    move IntegerInWords(1001) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1001 returns 'one thousand and one'"

    move "one thousand and ten" to ExpectedResult
    move IntegerInWords(1010) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1010 returns 'one thousand and ten'"

    move "one thousand and twenty" to ExpectedResult
    move IntegerInWords(1020) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1020 returns 'one thousand and twenty'"

    move "one thousand, nine hundred and twenty-one" to ExpectedResult
    move IntegerInWords(1921) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1921 returns 'one thousand, nine hundred and twenty-one'"

    move "ten thousand, nine hundred and twenty-one" to ExpectedResult
    move IntegerInWords(10921) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "10921 returns 'ten thousand, nine hundred and twenty-one'"

    move "ninety-nine thousand, nine hundred and ninety-nine" to ExpectedResult
    move IntegerInWords(99999) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "99999 returns 'ninety-nine thousand, nine hundred and ninety-nine'"

    move "nine hundred and ninety-nine thousand, nine hundred and ninety-nine" to ExpectedResult
    move IntegerInWords(999999) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "999999 returns 'nine hundred and ninety-nine thousand, nine hundred and ninety-nine'"

    move "one million" to ExpectedResult
    move IntegerInWords(1000000) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1000000 returns 'one million'"

    move "one million and one" to ExpectedResult
    move IntegerInWords(1000001) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1000001 returns 'one million and one'"

    move "one million, nine hundred and ninety-nine thousand, nine hundred and ninety-nine" to ExpectedResult
    move IntegerInWords(1999999) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1999999 returns 'one million, nine hundred and ninety-nine thousand, nine hundred and ninety-nine'"

    move "nine hundred and ninety-nine million, nine hundred and ninety-nine thousand, nine hundred and ninety-nine" to ExpectedResult
    move IntegerInWords(999999999) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "999999999 returns 'nine hundred and ninety-nine million, nine hundred and ninety-nine thousand, nine hundred and ninety-nine'"

    move "five hundred and twelve thousand, six hundred and seven" to ExpectedResult
    move IntegerInWords(512607) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "512607 returns 'five hundred and twelve thousand, six hundred and seven'"

    move "forty-three million, one hundred and twelve thousand, six hundred and three" to ExpectedResult
    move IntegerInWords(43112603) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "43112603 returns 'forty-three million, one hundred and twelve thousand, six hundred and three'"

    stop run
    .

end program IntegerInWordsTest.
