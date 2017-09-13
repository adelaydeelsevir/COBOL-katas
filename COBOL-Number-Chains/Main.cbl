identification division.
program-id. Main.

*> Run Number Chains - MF COBOL and GNU COBOL

data division.
working-storage section.
01 numberToCompute pic 9(9) value zero.
01 numberOfChains pic 9(3) value zero.

procedure division.
Main section.
    display "Solution to Number Chains Kata"
    display "------------------------------"
    move 123456789 to numberToCompute
    display "Computing number chains for " numberToCompute
    call "computeNumberChain" using numberToCompute numberOfChains
    display "Number of chains this took was " numberOfChains
    display "------------------------------"
    move 1234 to numberToCompute
    display "Computing number chains for " numberToCompute
    call "computeNumberChain" using numberToCompute numberOfChains
    display "Number of chains this took was " numberOfChains
    display "------------------------------"
    move 444 to numberToCompute
    display "Computing number chains for " numberToCompute
    call "computeNumberChain" using numberToCompute numberOfChains
    display "Number of chains this took was " numberOfChains
    stop run
    .
end program Main.
