identification division.
program-id. computeNumberChain.

environment division.
configuration section.
repository.
    function orderNumberByAscendingDigits
    function orderNumberByDescendingDigits.

data division.
working-storage section.
01 numberOrderedAscending pic 9(9).
01 numberOrderedDescending pic 9(9).
01 result pic 9(9) value zero.
01 PreviousResultsTable.
    02 PreviousResult occurs 1 to 99 times depending on numberOfChains indexed by numberIdx.
        03 filler pic 9(9).
01 filler pic 9 binary.
    88 chainIsRepeating value 1 when set to false is 0.

linkage section.
01 numberIn pic 9(9).
01 numberOfChains pic 999.

procedure division using numberIn numberOfChains.
    set chainIsRepeating to false

    perform with test after varying numberOfChains from 1 by 1 until chainIsRepeating
        move orderNumberByAscendingDigits(numberIn) to numberOrderedAscending
        move orderNumberByDescendingDigits(numberIn) to numberOrderedDescending
        subtract numberOrderedAscending from numberOrderedDescending giving result
        display numberOrderedDescending " - " numberOrderedAscending " = " result
        set numberIdx to 1
        search PreviousResult
            when PreviousResult(numberIdx) is equal to result
                set chainIsRepeating to true
        end-search
        move result to numberIn
        move result to PreviousResult(numberOfChains)
    end-perform
    goback.
end program computeNumberChain.
