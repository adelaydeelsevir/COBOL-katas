identification division.
function-id. DayOfWeek.

data division.
local-storage section.
01 DateBritianAdoptedGregorian constant 17520914.

linkage section.

01 InputDate pic 99999999.
01 ReturnedDayOfWeek pic 9 value 0.

procedure division using InputDate returning ReturnedDayOfWeek.

if InputDate less than DateBritianAdoptedGregorian then
    compute ReturnedDayOfWeek = function mod(function integer-of-date(InputDate) 7) - 10
else
    compute ReturnedDayOfWeek = function mod(function integer-of-date(InputDate) 7) + 1
end-if

goback.
end function DayOfWeek.
