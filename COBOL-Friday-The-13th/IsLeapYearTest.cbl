identification division.
program-id. IsLeapYearTest.

*> Write a function that returns true or false depending on
*> whether its input integer is a leap year or not.

*> A leap year is defined as one that is divisible by 4,
*> but is not otherwise divisible by 100 unless it is
*> also divisible by 400.

*> For example, 2001 is a typical common year and 1996
*> is a typical leap year, whereas 1900 is an atypical
*> common year and 2000 is an atypical leap year.

environment division.
configuration section.
    repository.
        function IsLeapYear.

data division.
working-storage section.

    01 ExpectedResult pic 9 usage binary.
    01 ReturnedResult pic 9 usage binary.

procedure division.

    move 1 to ExpectedResult
    move IsLeapYear(2001) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult, "2001 is not a leap year"

    move 1 to ExpectedResult
    move IsLeapYear(1996) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "1996 is a leap year"

    move 1 to ExpectedResult
    move IsLeapYear(1900) to ReturnedResult
    call "AssertNotEquals" using ReturnedResult, ExpectedResult, "1900 is not a leap year"

    move 1 to ExpectedResult
    move IsLeapYear(2000) to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "2000 is a leap year"

    stop run.

end program IsLeapYearTest.
