$set preservecase case repository(update ON)
identification division.
function-id. reverseNumber.

data division.
local-storage section.
01 numberLength pic 9 value zero.
01 digit pic 9.
01 outCounter pic 9 value 9.
01 filler pic 9 binary.
    88 processedLeadingZeros value 1 when set to false is 0.

linkage section.
01 numberIn pic 9(9).
01 numberOut pic 9(9).

procedure division using numberIn returning numberOut.
    move function length(numberIn) to numberLength
    set processedLeadingZeros to false
    perform with test after varying digit from 1 by 1
      until digit is equal to numberLength
        if processedLeadingZeros or numberIn(digit:1) greater than zero then
            set processedLeadingZeros to true
            move numberIn(digit:1) to numberOut(outCounter:1)
            subtract 1 from outCounter
        else
            move zero to numberOut(digit:1)
        end-if
    end-perform
    goback
    .
end function reverseNumber.
