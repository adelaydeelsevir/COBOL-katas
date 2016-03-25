identification division.
function-id. ArabicToRoman.

data division.
local-storage section.
01 RemainderToConvert pic 9(4) value zero.
01 CurrentNumeralCount pic 9.
01 CurrentNumeralPosition pic 9.
01 CountOfNumerals pic 99 value 1.

linkage section.
01 ArabicNumber pic 9(4) value zero.
01 RomanNumber pic X(40) value spaces.

procedure division using ArabicNumber returning RomanNumber.

initialize RomanNumber
move ArabicNumber to RemainderToConvert

divide RemainderToConvert by 1000 giving CurrentNumeralCount
perform varying CurrentNumeralPosition from 1 by 1 until CurrentNumeralPosition > CurrentNumeralCount
    move "M" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 1000 from RemainderToConvert
end-perform

if RemainderToConvert greater than or equal to 900 then
    move "CM" to RomanNumber(CountOfNumerals:2)
    add 2 to CountOfNumerals
    subtract 900 from RemainderToConvert
end-if

if RemainderToConvert greater than or equal to 500 then
    move "D" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 500 from RemainderToConvert
end-if

if RemainderToConvert greater than or equal to 400 then
    move "CD" to RomanNumber(CountOfNumerals:2)
    add 2 to CountOfNumerals
    subtract 400 from RemainderToConvert
end-if

divide RemainderToConvert by 100 giving CurrentNumeralCount

perform with test before varying CurrentNumeralPosition from 1 by 1 until CurrentNumeralPosition > CurrentNumeralCount
    move "C" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 100 from RemainderToConvert
end-perform

if RemainderToConvert greater than or equal to 90 then
    move "XC" to RomanNumber(CountOfNumerals:2)
    add 2 to CountOfNumerals
    subtract 90 from RemainderToConvert
end-if

if RemainderToConvert greater than or equal to 50 then
    move "L" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 50 from RemainderToConvert
end-if

if RemainderToConvert greater than or equal to 40 then
    move "XL" to RomanNumber(CountOfNumerals:2)
    add 2 to CountOfNumerals
    subtract 40 from RemainderToConvert
end-if

divide RemainderToConvert by 10 giving CurrentNumeralCount

perform with test before varying CurrentNumeralPosition from 1 by 1 until CurrentNumeralPosition > CurrentNumeralCount
    move "X" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 10 from RemainderToConvert
end-perform

if RemainderToConvert greater than or equal to 9 then
    move "IX" to RomanNumber(CountOfNumerals:2)
    add 2 to CountOfNumerals
    subtract 9 from RemainderToConvert
end-if

if RemainderToConvert greater than or equal to 5 then
    move "V" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 5 from RemainderToConvert
end-if

if RemainderToConvert greater than or equal to 4 then
    move "IV" to RomanNumber(CountOfNumerals:2)
    add 2 to CountOfNumerals
    subtract 4 from RemainderToConvert
end-if

divide RemainderToConvert by 1 giving CurrentNumeralCount

perform with test before varying CurrentNumeralPosition from 1 by 1 until CurrentNumeralPosition > CurrentNumeralCount
    move "I" to RomanNumber(CountOfNumerals:1)
    add 1 to CountOfNumerals
    subtract 1 from RemainderToConvert
end-perform

goback.

end function ArabicToRoman.
