
# Number Names kata solution in COBOL using user-defined functions and test driven development

Solution to the 'Number Names' kata written in COBOL using COBOL 2002 user-defined functions.  I used OpenCOBOLIDE to program this with versin 2.0 of the GnuCOBOL compiler, which supports the COBOL 2002 user-definied functions specification.

Here's the Kata (taken from rosettacode.org via cyber-dojo.org):

```
Spell out a number. For example

      99 --> ninety nine
     300 --> three hundred
     310 --> three hundred and ten
    1501 --> one thousand, five hundred and one
   12609 --> twelve thousand, six hundred and nine
  512607 --> five hundred and twelve thousand,
             six hundred and seven
43112603 --> forty three million, one hundred and
             twelve thousand,
             six hundred and three
```
## Thoughts
I found this one really hard for some reason; it took me ages to do.  I kept trying to produce
something that was neeter and more efficient than nested IF statements or large EVALUATES.  I'm
still not happy with the result; though I think it's fairly readable, clean-ish and passes all
the tests.  I feel it's done in a way that possibly doesn't take full advantage of the COBOL-way
of doing things.

## Running the code
To run the code, you'll need version 2.0 of the free GnuCOBOL compiler (to support user-defined functions) and the two files (user defined function for rendering integers as words and the test file).  You'll also need the AssertEquals routine from [COBOL-Test-Suite](https://github.com/mikebharris/COBOL-Test-Suite) compiled and somewhere in your GNU Cobol library path.
```
$ cobc --free IntegerInWords.cbl
$ cobc -x --free IntegerInWordsTest.cbl
$ ./IntegerInWordsTest
Passed: 100 returns 'one hundred'
Passed: 102 returns 'one hundred and two'
Passed: 110 returns 'one hundred and ten'
Passed: 120 returns 'one hundred and twenty'
Passed: 121 returns 'one hundred and twenty-one'
Passed: 2 returns 'two'
Passed: 11 returns 'eleven'
Passed: 30 returns 'thirty'
Passed: 45 returns 'forty-five'
Passed: 310 returns 'three hundred and ten'
Passed: 1000 returns 'one thousand'
Passed: 1001 returns 'one thousand and one'
Passed: 1010 returns 'one thousand and ten'
Passed: 1020 returns 'one thousand and twenty'
Passed: 1921 returns 'one thousand, nine hundred and twenty-one'
Passed: 10921 returns 'ten thousand, nine hundred and twenty-one'
Passed: 99999 returns 'ninety-nine thousand, nine hundred and ninety-nine'
Passed: 999999 returns 'nine hundred and ninety-nine thousand, nine hundred and ninety-nine'
Passed: 1000000 returns 'one million'
Passed: 1000001 returns 'one million and one'
Passed: 1999999 returns 'one million, nine hundred and ninety-nine thousand, nine hundred and ninety-nine'
Passed: 999999999 returns 'nine hundred and ninety-nine million, nine hundred and ninety-nine thousand, nine hundred and ninety-nine'
Passed: 512607 returns 'five hundred and twelve thousand, six hundred and seven'
Passed: 43112603 returns 'forty-three million, one hundred and twelve thousand, six hundred and three'
```
