identification division.
program-id. BalancedParenthesesTest.

*> Write a program to determine if the the parentheses (),
*> the brackets [], and the braces {}, in a string are balanced.

*> For example:

*> {{)(}} is not balanced because ) comes before (

*> ({)} is not balanced because ) is not balanced between {}
     *> and similarly the { is not balanced between ()

*> [({})] is balanced

*> {}([]) is balanced

*> {()}[[{}]] is balanced

environment division.
configuration section.
    repository.
        function ParenthesesAreBalanced
        function all intrinsic.

data division.
working-storage section.

    01 ExpectedResult pic 9 usage binary.
    01 ReturnedResult pic 9 usage binary.
    01 StringToTest   pic x(10).

procedure division.

    *> Test round brackets only
    *> ( is not valid
    *> () is valid
    *> (()) is valid
    *> ((()) is not valid

    move 1 to ExpectedResult

    move "(" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 0")

    move "()" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "(())" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "((())" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 0")

    *> ()[] is valid
    *> ([)] is not valid
    *> ([([])]) is valid

    move "()[]" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "([)]" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 0")

    move "([([])])" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    *> (){} is valid
    *> ()[]{} is valid
    *> ([{()}]) is valid

    move "(){}" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "()[]{}" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "([{()}])" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    *> {{)(}} is not valid
    *> ({)} is not valid
    *> [({})] is valid
    *> {}([]) is valid
    *> {()}[[{}]] is valid

    move "{{)(}}" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 0")

    move "({)}" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 0")

    move "[({})]" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "{}([])" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

    move "{()}[[{}]]" to StringToTest
    move ParenthesesAreBalanced(StringToTest) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult,
        concatenate(function trim(StringToTest), " returns 1")

stop run.
