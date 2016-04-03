
# Number Names kata solution in COBOL using user-defined functions and test driven development

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
