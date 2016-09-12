# Solution to the Balanced Parenteses kata in COBOL

Here's a solution in GnuCOBOL to the Balance Parentheses problem, which is:

```
*> Write a program to determine if the the parentheses (),
*> the brackets [], and the braces {}, in a string are balanced.

*> For example:
*> {{)(}} is not balanced because ) comes before (
*> ({)} is not balanced because ) is not balanced between {}
     *> and similarly the { is not balanced between ()
*> [({})] is balanced
*> {}([]) is balanced
*> {()}[[{}]] is balanced
```

To run the test you'll also need to download and compile both https://github.com/mikebharris/COBOL-Stack and https://github.com/mikebharris/COBOL-Test-Suite

The easiest way to link the libraries is to copy the resultant library files into the same directory as the Balanced Parentheses code, then compile and run thus:

```
$ cobc --free ParenthesesAreBalanced.cbl 
$ cobc --free -x BalancedParenthesesTest.cbl 
$ ./BalancedParenthesesTest 
Passed: ( returns 0
Passed: () returns 1
Passed: (()) returns 1
Passed: ((()) returns 0
Passed: ()[] returns 1
Passed: ([)] returns 0
Passed: ([([])]) returns 1
Passed: (){} returns 1
Passed: ()[]{} returns 1
Passed: ([{()}]) returns 1
Passed: {{)(}} returns 0
Passed: ({)} returns 0
Passed: [({})] returns 1
Passed: {}([]) returns 1
Passed: {()}[[{}]] returns 1
Passed: sub main { a = (b * c) / (d * e) } returns 1
```
