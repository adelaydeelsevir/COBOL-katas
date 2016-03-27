# COBOL 100 Doors kata solution

Here's a solution in COBOL to the 100 doors problem, which is:

```
100 doors in a row are all initially closed. You make
100 passes by the doors. The first time through, you
visit every door and toggle the door (if the door is
closed, you open it; if it is open, you close it).
The second time you only visit every 2nd door (door
#2, #4, #6, ...). The third time, every 3rd door
(door #3, #6, #9, ...), etc, until you only visit
the 100th door.

Question: What state are the doors in after the last
pass? Which are open, which are closed?
```

It's a little different, and easier to read I think than the one at http://rosettacode.org/wiki/100_doors#COBOL

To run it do the following:
```
$ cobc -x --free 100Doors.cbl
$ ./100Doors
State of doors at end of run: 
 
Door 001 is Closed
Door 002 is Open  
Door 003 is Closed
Door 004 is Open  
Door 005 is Closed
Door 006 is Open  
Door 007 is Closed
Door 008 is Open  
Door 009 is Closed
Door 010 is Open  
Door 011 is Closed
Door 012 is Open  
Door 013 is Closed
Door 014 is Open  
Door 015 is Closed
Door 016 is Open  
Door 017 is Closed
Door 018 is Open  
Door 019 is Closed
Door 020 is Open  
Door 021 is Closed
Door 022 is Open  
Door 023 is Closed
Door 024 is Open  
Door 025 is Closed
Door 026 is Open  
Door 027 is Closed
Door 028 is Open  
Door 029 is Closed
Door 030 is Open  
Door 031 is Closed
Door 032 is Open  
Door 033 is Closed
Door 034 is Open  
Door 035 is Closed
Door 036 is Open  
Door 037 is Closed
Door 038 is Open  
Door 039 is Closed
Door 040 is Open  
Door 041 is Closed
Door 042 is Open  
Door 043 is Closed
Door 044 is Open  
Door 045 is Closed
Door 046 is Open  
Door 047 is Closed
Door 048 is Open  
Door 049 is Closed
Door 050 is Open  
Door 051 is Closed
Door 052 is Open  
Door 053 is Closed
Door 054 is Open  
Door 055 is Closed
Door 056 is Open  
Door 057 is Closed
Door 058 is Open  
Door 059 is Closed
Door 060 is Open  
Door 061 is Closed
Door 062 is Open  
Door 063 is Closed
Door 064 is Open  
Door 065 is Closed
Door 066 is Open  
Door 067 is Closed
Door 068 is Open  
Door 069 is Closed
Door 070 is Open  
Door 071 is Closed
Door 072 is Open  
Door 073 is Closed
Door 074 is Open  
Door 075 is Closed
Door 076 is Open  
Door 077 is Closed
Door 078 is Open  
Door 079 is Closed
Door 080 is Open  
Door 081 is Closed
Door 082 is Open  
Door 083 is Closed
Door 084 is Open  
Door 085 is Closed
Door 086 is Open  
Door 087 is Closed
Door 088 is Open  
Door 089 is Closed
Door 090 is Open  
Door 091 is Closed
Door 092 is Open  
Door 093 is Closed
Door 094 is Open  
Door 095 is Closed
Door 096 is Open  
Door 097 is Closed
Door 098 is Open  
Door 099 is Closed
Door 100 is Open  
$
```
