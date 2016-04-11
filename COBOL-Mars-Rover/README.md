# Google's Mars Rover Technical Challenge - solution in COBOL

Here's a basic solution in COBOL to the Mars Rover programming kata from Google - see https://code.google.com/archive/p/marsrovertechchallenge/

There's five files involved with the current solution:
* MarsRover.cbl - the main code that positions, moves and keeps track of the rover
* MarsRoverTest.cbl - reads from a file of input instructions and tests that MarsRover returns the right output.
* MarsRover.dat - the data input file with instructions for the Mars Rovers (sent via radio waves to Mars from Earth).
* GridDimensions.cbl & RoverPosition.cpy - copybooks containing common data structures used in the code

Note I haven't kept track of two separate rover instances as the input file is sequential I figured there was no need to.

To compile and run it using GnuCOBOL (version 1.x or 2.x), you'll also need the AssertEqual subprogram from COBOL-Simple-Test compiled and in your COBOL library path somewhere.

```
$ cobc --free MarsRover.cbl 
$ cobc -x --free MarsRoverTest.cbl 
$ ./MarsRoverTest 
Passed: Returned grid loc of 5 5
Passed: Returned start position of 1 2 N
Passed: After LMLMLMLMM, the final position is 1 3 N
Passed: Returned start position of 3 3 E
Passed: After MMRMMRMRRM, the final position is 5 1 E
Passed: Returned start position of 0 0 E
Passed: After MLMRMLMRMLMRMLMRMLM, the final position is 5 5 N
$ 
```
