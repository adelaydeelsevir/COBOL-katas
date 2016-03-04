identification division.
function-id. IsLeapYear.

environment division.
configuration section.
repository.
    function all intrinsic.

data division.
linkage section.
01 YearToCheck pic 9999 value zeroes.
01 IsLeapYear pic 9.
    88 YearIsLeapYear value 1 when set to false is 0.

procedure division using YearToCheck returning IsLeapYear.

if rem(YearToCheck; 4) is greater than zero then
    set YearIsLeapYear to false
    goback
end-if

if rem(YearToCheck; 100) is greater than zero then
    set YearIsLeapYear to true
    goback
end-if

if rem(YearToCheck; 400) is equal to zero then
    set YearIsLeapYear to true
    goback
end-if

set YearIsLeapYear to false
goback.

end function IsLeapYear.
