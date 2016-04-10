identification division.
program-id. MarsRoverTest.

environment division.
configuration section.
    repository.
        function all intrinsic.

input-output section.
file-control.
    select MarsRoverData assign to "MarsRover.dat"
        organization is line sequential.

data division.
file section.
    fd MarsRoverData.
        copy GridDimensions
            replacing GridDimensions by
            ==GridDimensions.
                88 EndOfMarsRoverData value high-values==.

        copy RoverPosition replacing RoverPosition by InitialRoverPosition.

        01 Movement.
            02 MovementSequence pic x(20).

working-storage section.
    copy GridDimensions replacing GridDimensions by ExpectedGridDimensions.
    copy GridDimensions replacing GridDimensions by ReturnedGridDimensions.
    copy RoverPosition replacing RoverPosition by ExpectedPosition.
    copy RoverPosition replacing RoverPosition by ReturnedPosition.

procedure division.

    open input MarsRoverData

    perform ReadLineOfData
    move "5 5" to ExpectedGridDimensions
    call "MarsRover" using by content "SetGridSize", by content GridDimensions
    call "MarsRover" using by content "GetGridSize", by reference ReturnedGridDimensions
    call "AssertEquals" using by content ReturnedGridDimensions, by content ExpectedGridDimensions,
        concatenate("Returned grid loc of ", ExpectedGridDimensions)

    perform ReadLineOfData
    move "1 2 N" to ExpectedPosition
    call "MarsRover" using by content "SelectRover", by content InitialRoverPosition
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        concatenate("Returned start position of ", ExpectedPosition)

    perform ReadLineOfData
    move "1 3 N" to ExpectedPosition
    call "MarsRover" using by content "MoveRover", by content Movement
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        concatenate("After ", trim(Movement), ", the final position is ", ExpectedPosition)

    perform ReadLineOfData
    move "3 3 E" to ExpectedPosition
    call "MarsRover" using by content "SelectRover", by content InitialRoverPosition
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        concatenate("Returned start position of ", ExpectedPosition)

    perform ReadLineOfData
    move "5 1 E" to ExpectedPosition
    call "MarsRover" using by content "MoveRover", by content Movement
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        concatenate("After ", trim(Movement), ", the final position is ", ExpectedPosition)

    perform ReadLineOfData
    move "0 0 E" to ExpectedPosition
    call "MarsRover" using by content "SelectRover", by content InitialRoverPosition
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        concatenate("Returned start position of ", ExpectedPosition)

    perform ReadLineOfData
    move "5 5 N" to ExpectedPosition
    call "MarsRover" using by content "MoveRover", by content Movement
    call "MarsRover" using by content "GetRoverPosition", by reference ReturnedPosition
    call "AssertEquals" using by content ReturnedPosition, by content ExpectedPosition,
        concatenate("After ",trim(Movement), ", the final position is ", ExpectedPosition)

    close MarsRoverData
    stop run.

ReadLineOfData.
    read MarsRoverData
        at end set EndOfMarsRoverData to true
    end-read
    if EndOfMarsRoverData
        close MarsRoverData
        display "End of data reached"
        stop run.

end program MarsRoverTest.
