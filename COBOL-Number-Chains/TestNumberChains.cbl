identification division.
program-id. TestNumberChains.

*> Test Number Chains using COBOL Test Suite under GNU COBOL

data division.
working-storage section.
01 InitialValue pic 9(9) value zero.
01 ReturnedChainCount pic 999 value zero.
01 ExpectedChainCount pic 999 value zero.

procedure division.
    move 123456789 to InitialValue
    call "computeNumberChain" using InitialValue, ReturnedChainCount
    move 2 to ExpectedChainCount
    call "AssertEquals" using by content ReturnedChainCount, by content ExpectedChainCount,
        "123456789 returns chain count of 2"

    move 1234 to InitialValue
    call "computeNumberChain" using InitialValue, ReturnedChainCount
    move 4 to ExpectedChainCount
    call "AssertEquals" using by content ReturnedChainCount, by content ExpectedChainCount,
        "1234 returns chain count of 4"

    move 444 to InitialValue
    call "computeNumberChain" using InitialValue, ReturnedChainCount
    move 2 to ExpectedChainCount
    call "AssertEquals" using by content ReturnedChainCount, by content ExpectedChainCount,
        "444 returns chain count of 2"
    .

end program TestNumberChains.
