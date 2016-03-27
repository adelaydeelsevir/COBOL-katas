identification division.
function-id. RomanToArabic.

environment division.
configuration section.
    special-names.
        class RomanNumeral is "I", "V", "X", "L", "C", "D", "M".

data division.
local-storage section.
01 CharacterPosition pic 99 value 1.
01 CurrentCharacter pic a value space.
01 PreviousCharacter pic a value space.
01 NextCharacter pic a value space.

linkage section.
01 ArabicNumber pic 9(4) value zero.
01 RomanNumber pic x(40) value spaces.

procedure division using RomanNumber returning ArabicNumber.

    initialize ArabicNumber
    perform varying CharacterPosition from 1 by 1 until RomanNumber(CharacterPosition:1) equals space
        move RomanNumber(CharacterPosition:1) to CurrentCharacter
        move RomanNumber(CharacterPosition + 1:1) to NextCharacter

        if CurrentCharacter is not RomanNumeral then
            move 0 to ArabicNumber
            goback
        end-if

        if CurrentCharacter equals "M" and PreviousCharacter not equal to "C"
            add 1000 to ArabicNumber
        end-if
        if CurrentCharacter equals "C" and NextCharacter equals "M"
            add 900 to ArabicNumber
        end-if
        if CurrentCharacter equals "C" and NextCharacter not equal to "M" and NextCharacter not equal to "D"
            and PreviousCharacter not equal to "X"
            add 100 to ArabicNumber
        end-if
        if CurrentCharacter equals "D" and PreviousCharacter not equal to "C"
            add 500 to ArabicNumber
        end-if
        if CurrentCharacter equals "C" and NextCharacter equals "D"
            add 400 to ArabicNumber
        end-if
        if CurrentCharacter equals "X" and NextCharacter not equal to "C" and NextCharacter not equal to "L"
            and PreviousCharacter not equal to "I"
            add 10 to ArabicNumber
        end-if
        if CurrentCharacter equals "X" and NextCharacter equals "C"
            add 90 to ArabicNumber
        end-if
        if CurrentCharacter equals "L" and PreviousCharacter not equal to "X"
            add 50 to ArabicNumber
        end-if
        if CurrentCharacter equals "X" and NextCharacter equals "L"
            add 40 to ArabicNumber
        end-if
        if CurrentCharacter equals "V" and PreviousCharacter not equal to "I"
            add 5 to ArabicNumber
        end-if
        if CurrentCharacter equals "I" and NextCharacter not equal to "V" and NextCharacter not equal to "X"
            add 1 to ArabicNumber
        end-if
        if CurrentCharacter equals "I" and NextCharacter equals "V"
            add 4 to ArabicNumber
        end-if
        if CurrentCharacter equals "I" and NextCharacter equals "X"
            add 9 to ArabicNumber
        end-if
        move CurrentCharacter to PreviousCharacter
    end-perform

    goback.

end function RomanToArabic.
