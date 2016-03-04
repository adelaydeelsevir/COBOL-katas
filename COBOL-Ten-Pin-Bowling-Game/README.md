# COBOL solution to Ten Pin Bowling Game kata
A solution to the problem of calculating Ten Pin Bowling scorecards written in COBOL

I thought I'd try my hand at the Ten Pin Bowling kata in COBOL and here's the source code.

The kata is from http://cyber-dojo.org and the full kata is below and to be found in **TenPinBowling.cbl**

## Running it

There's two versions of the solution.  One uses the COBOL 85 method of external subprograms using the CALL verb to return the answer; the other uses the COBOL 2002 user defined functions method.  To run the code, you'll need version 1.1 or 2.0 of the free GnuCOBOL compiler for the version using subprograms and version 2.0 for the version using user defined functions.  Here's how to run both solutions:

### Version using an external subprogram

```
$ cobc --free ProcessBowlingScoreCard.cbl
$ cobc -x --free TenPinBowling.cbl
$ ./TenPinBowling
Test score card 1 is X|X|X|X|X|X|X|X|X|X||XX          
Test score card 1 result of 300 matches expected... Test passed
 
Test score card 2 is 5/|5/|5/|5/|5/|5/|5/|5/|5/|5/||5 
Test score card 2 result of 150 matches expected... Test passed
 
Test score card 3 is 9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||  
Test score card 3 result of 090 matches expected... Test passed
 
Test score card 4 is X|7/|9-|X|-8|8/|-6|X|X|X||81     
Test score card 4 result of 167 matches expected... Test passed
```

### Version using user-defined functions

```
$ cobc --free CalculateScoreFromScorecard.cbl 
$ cobc --free -x TenPinBowlingUsingFunction.cbl 
$ ./TenPinBowlingUsingFunction 
Test score card 1 is X|X|X|X|X|X|X|X|X|X||XX          
Test score card 1 result of 300 matches expected... Test passed
 
Test score card 2 is 5/|5/|5/|5/|5/|5/|5/|5/|5/|5/||5 
Test score card 2 result of 150 matches expected... Test passed
 
Test score card 3 is 9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||  
Test score card 3 result of 090 matches expected... Test passed
 
Test score card 4 is X|7/|9-|X|-8|8/|-6|X|X|X||81     
Test score card 4 result of 167 matches expected... Test passed
``` 

## The Kata

```
Write a program to score a game of Ten-Pin Bowling.

Input: string (described below) representing a bowling game
Ouput: integer score

The scoring rules:

Each game, or "line" of bowling, includes ten turns, 
or "frames" for the bowler.

In each frame, the bowler gets up to two tries to 
knock down all ten pins.

If the first ball in a frame knocks down all ten pins,
this is called a "strike". The frame is over. The score 
for the frame is ten plus the total of the pins knocked 
down in the next two balls.

If the second ball in a frame knocks down all ten pins, 
this is called a "spare". The frame is over. The score 
for the frame is ten plus the number of pins knocked 
down in the next ball.

If, after both balls, there is still at least one of the
ten pins standing the score for that frame is simply
the total number of pins knocked down in those two balls.

If you get a spare in the last (10th) frame you get one 
more bonus ball. If you get a strike in the last (10th) 
frame you get two more bonus balls.
These bonus throws are taken as part of the same turn. 
If a bonus ball knocks down all the pins, the process 
does not repeat. The bonus balls are only used to 
calculate the score of the final frame.

The game score is the total of all frame scores.

Examples:

X indicates a strike
/ indicates a spare
- indicates a miss
| indicates a frame boundary
The characters after the || indicate bonus balls

X|X|X|X|X|X|X|X|X|X||XX
Ten strikes on the first ball of all ten frames.
Two bonus balls, both strikes.
Score for each frame == 10 + score for next two 
balls == 10 + 10 + 10 == 30
Total score == 10 frames x 30 == 300

9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||
Nine pins hit on the first ball of all ten frames.
Second ball of each frame misses last remaining pin.
No bonus balls.
Score for each frame == 9
Total score == 10 frames x 9 == 90

5/|5/|5/|5/|5/|5/|5/|5/|5/|5/||5
Five pins on the first ball of all ten frames.
Second ball of each frame hits all five remaining
pins, a spare.
One bonus ball, hits five pins.
Score for each frame == 10 + score for next one
ball == 10 + 5 == 15
Total score == 10 frames x 15 == 150

X|7/|9-|X|-8|8/|-6|X|X|X||81
Total score == 167
```

## TO DOs

1. Re-write the test suite using cobol-unit-test (https://github.com/neopragma/cobol-unit-test) or COBOLUnit (https://sites.google.com/site/cobolunit/).
