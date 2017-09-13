$set preservecase case repository(update ON)
identification division.
function-id. orderNumberByAscendingDigits.

data division.
working-storage section.
01 workingStorage.
    02 workingStorageDigits occurs 9 times.
        03 workingStorageDigit pic 9.

linkage section.
01 numberIn pic 9(9).
01 numberOut pic 9(9).

procedure division using numberIn returning numberOut.
Main section.
    move numberIn to workingStorage
    sort workingStorageDigits ascending
    move workingStorage to numberOut
    goback
    .
end function orderNumberByAscendingDigits.
