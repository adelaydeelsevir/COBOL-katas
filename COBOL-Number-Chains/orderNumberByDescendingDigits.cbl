$set preservecase case repository(update ON)
identification division.
function-id. orderNumberByDescendingDigits.

environment division.
configuration section.

data division.
working-storage section.
01 workingStorage.
    02 workingStorageDigits occurs 9 times.
        03 workingStorageDigit pic 9.

01 firstNonZeroDigitOffset pic 9.

linkage section.
01 numberIn pic 9(9).
01 numberOut pic 9(9).

procedure division using numberIn returning numberOut.
Main section.
    move numberIn to workingStorage
    perform with test after varying firstNonZeroDigitOffset from 1 by 1 until
      workingStorageDigits(firstNonZeroDigitOffset) greater than zero
        or firstNonZeroDigitOffset equal to 9
    end-perform
    sort workingStorageDigits descending
    move workingStorage to numberOut
    compute numberOut = numberOut / (10**(firstNonZeroDigitOffset - 1))
    goback
    .
end function orderNumberByDescendingDigits.