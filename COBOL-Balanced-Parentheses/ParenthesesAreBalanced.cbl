identification division.
function-id. ParenthesesAreBalanced.

environment division.
configuration section.
    repository.
        function all intrinsic.

    special-names.
        class OpenRoundBracket is "("
        class CloseRoundBracket is "("
        class OpenSquareBracket is "["
        class CloseSquareBracket is "]"
        class OpenBrace is "{"
        class CloseBrace is "}".

data division.
local-storage section.
    01 NumCharsInString pic 99 value zero.
    01 CurrentCharacterPosition pic 99 value zero.
    01 LastUnclosedOpenerPosition pic 99 value zero.

linkage section.
    01 StringToCheck pic x any length.
    01 ParenthesesAreBalancedFlag pic 9 value zero usage binary.

procedure division using StringToCheck returning ParenthesesAreBalancedFlag.

    move length(trim(StringToCheck)) to NumCharsInString
    if mod(NumCharsInString; 2) not equal to zero
        move zero to ParenthesesAreBalancedFlag
        goback
    end-if

    perform varying CurrentCharacterPosition from 1 by 1 until CurrentCharacterPosition > NumCharsInString
        evaluate StringToCheck(CurrentCharacterPosition:1)
            when "(" call "Stack", using by content "Push", CurrentCharacterPosition
            when "[" call "Stack", using by content "Push", CurrentCharacterPosition
            when "{" call "Stack", using by content "Push", CurrentCharacterPosition
            when ")"
                call "Stack", using by content "Peek", by reference LastUnclosedOpenerPosition
                if StringToCheck(LastUnclosedOpenerPosition:1) not equal to "("
                then
                    move 0 to ParenthesesAreBalancedFlag
                    goback
                else
                    move 1 to ParenthesesAreBalancedFlag
                    call "Stack", using by content "Pop", by reference LastUnclosedOpenerPosition
                end-if
            when "]"
                call "Stack", using by content "Peek", by reference LastUnclosedOpenerPosition
                if StringToCheck(LastUnclosedOpenerPosition:1) not equal to "["
                then
                    move 0 to ParenthesesAreBalancedFlag
                    goback
                else
                    move 1 to ParenthesesAreBalancedFlag
                    call "Stack", using by content "Pop", by reference LastUnclosedOpenerPosition
                end-if
            when "}"
                call "Stack", using by content "Peek", by reference LastUnclosedOpenerPosition
                if StringToCheck(LastUnclosedOpenerPosition:1) not equal to "{"
                then
                    move 0 to ParenthesesAreBalancedFlag
                    goback
                else
                    move 1 to ParenthesesAreBalancedFlag
                    call "Stack", using by content "Pop", by reference LastUnclosedOpenerPosition
                end-if
        end-evaluate

    end-perform

    goback.

end function ParenthesesAreBalanced.
