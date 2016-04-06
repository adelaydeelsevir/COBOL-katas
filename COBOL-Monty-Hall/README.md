# A solution to the Monty Hall kata problem in COBOL

Here's an attempt at a solution in COBOL to the Monty Hall problem, demonstrating that it's always better to swap in round two.  The problem is:

```
Suppose you're on a game show and you're given the
choice of three doors. Behind one door is a car; behind
the others, goats. The car and the goats were
placed randomly behind the doors before the show.

The rules of the game show are as follows:

After you have chosen a door, the door remains closed
for the time being. The game show host, Monty Hall, who
knows what is behind the doors, now has to open one of
the two remaining doors, and the door he opens must have
a goat behind it. If both remaining doors have goats
behind them, he chooses one randomly. After Monty Hall
opens a door with a goat, he will ask you to decide
whether you want to stay with your first choice or to
switch to the last remaining door.

For example:
Imagine that you chose Door 1 and the host opens Door 3,
which has a goat. He then asks you "Do you want to switch
to Door Number 2?" Is it to your advantage to change your
choice?

Note that the player may initially choose any of the
three doors (not just Door 1), that the host opens a
different door revealing a goat (not necessarily Door 3),
and that he gives the player a second choice between the
two remaining unopened doors.

Simulate at least a thousand games using three doors for
each strategy and show the results in such a way as to make
it easy to compare the effects of each strategy.
```

The solution to the problem seemed so straight-forward and simple that I was sure I had
got it wrong, but having looked at various solutions at http://rosettacode.org/wiki/Monty_Hall_problem, it looks right to
me.  Incidentally my solution appear to be much more readable and less complex than the
COBOL solution at http://rosettacode.org/wiki/Monty_Hall_problem#COBOL

I think this proves that you can write really clean and readable and modern code even in a
language as old as COBOL.  It's not so much to do with the language itself, but the way you
write the code.

To run it do the following:
```
$ cobc -x --free MontyHall.cbl
squitty:COBOL-Monty-Hall adelayde$ ./MontyHall
Results
-------
After playing 1000 rounds ...
Times correct door selected after swapping:   660
Times correct door selected without swapping: 340

Conclusion is that it's better to swap.
  This makes sense as the probability in the first round of getting
  the correct door is 1/3; whereas in the second, it's 1/2.
```
