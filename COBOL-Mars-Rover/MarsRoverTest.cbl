identification division.
program-id. MarsRoverTest.

data division.
working-storage section.

    01 ExpectedGridSizeResults.
        02 MaxWidth pic 9.
        02 filler pic x value space.
        02 MaxHeight pic 9.

    01 ReturnedGridSizeResults.
        02 MaxWidth pic 9.
        02 filler pic x value space.
        02 MaxHeight pic 9.

    01 ExpectedPosition.
        02 XPos pic 9.
        02 filler pic x value space.
        02 YPos pic 9.
        02 filler pic x value space.
        02 Orientation pic x.

    01 ReturnedPosition.
        02 XPos pic 9.
        02 filler pic x value space.
        02 YPos pic 9.
        02 filler pic x value space.
        02 Orientation pic x.

procedure division.

    move "5 5" to ExpectedGridSizeResults
    call "MarsRover" using by content "SetGridSize", by content ExpectedGridSizeResults
    call "MarsRover" using by content "GetGridSize", by reference ReturnedGridSizeResults
    call "AssertEquals" using by content ReturnedGridSizeResults, by content ExpectedGridSizeResults,
        function concatenate("Returned grid loc of ", ExpectedGridSizeResults)

    move "1 2 N" to ExpectedPosition
    call "MarsRover" using by content "SelectRover", by content ExpectedPosition
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        function concatenate("Returned start position of ", ExpectedPosition)

    move "1 3 N" to ExpectedPosition
    call "MarsRover" using by content "MoveRover", by content "LMLMLMLMM"
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        function concatenate("After LMLMLMLMM final position is ", ExpectedPosition)

    move "3 3 E" to ExpectedPosition
    call "MarsRover" using by content "SelectRover", by content ExpectedPosition
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        function concatenate("Returned start position of ", ExpectedPosition)

    move "5 1 E" to ExpectedPosition
    call "MarsRover" using by content "MoveRover", by content "MMRMMRMRRM"
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        function concatenate("After MMRMMRMRRM final position is ", ExpectedPosition)

    move "0 0 E" to ExpectedPosition
    call "MarsRover" using by content "SelectRover", by content ExpectedPosition
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        function concatenate("Returned start position of ", ExpectedPosition)

    move "5 5 N" to ExpectedPosition
    call "MarsRover" using by content "MoveRover", by content "MLMRMLMRMLMRMLMRMLM"
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        function concatenate("After MMRMMRMRRM final position is ", ExpectedPosition)

    stop run.

end program MarsRoverTest.
