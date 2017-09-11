identification division.
function-id. ParenthesesAreBalanced.

environment division.
configuration section.
    repository.
        function all intrinsic.

    special-names.
        class OpenRoundBracket is "("
        class CloseRoundBracket is ")"
        class OpenSquareBracket is "["
        class CloseSquareBracket is "]"
        class OpenBrace is "{"
        class CloseBrace is "}"
        class Opener is "(", "[", "{"
        class Closer is ")", "]", "}".

data division.
local-storage section.
01 NumCharsInString pic 99 value zero.
01 CurrentCharacterPosition pic 99 value zero.
01 LastUnclosedOpenerPosition pic 99 value zero.
01 CurrentCharacter pic x value space.
01 LastOpenerCharacter pic x value space.
01 CountOfUnblancedParentheses pic 99 value zero.

linkage section.
01 StringToCheck pic x any length.
01 ParenthesesAreBalancedFlag pic 9 value zero usage binary.

procedure division using StringToCheck returning ParenthesesAreBalancedFlag.
Main section.
    move length(trim(StringToCheck)) to NumCharsInString

    perform varying CurrentCharacterPosition from 1 by 1 until CurrentCharacterPosition > NumCharsInString
        move StringToCheck(CurrentCharacterPosition:1) to CurrentCharacter
        evaluate true
            when CurrentCharacter is Opener perform ProcessOpenBracket
            when CurrentCharacter is Closer perform ProcessClosedBracket
        end-evaluate
    end-perform

    if CountOfUnblancedParentheses greater than zero
    then
        move zero to ParenthesesAreBalancedFlag
    end-if

    goback.

ProcessOpenBracket section.
    add 1 to CountOfUnblancedParentheses
    call "Stack", using by content "Push", CurrentCharacterPosition
    .

ProcessClosedBracket section.
    subtract 1 from CountOfUnblancedParentheses
    call "Stack", using by content "Pop", by reference LastUnclosedOpenerPosition
    move StringToCheck(LastUnclosedOpenerPosition:1) to LastOpenerCharacter

    evaluate true also true
        when CurrentCharacter is CloseRoundBracket also LastOpenerCharacter is OpenRoundBracket
        when CurrentCharacter is CloseSquareBracket also LastOpenerCharacter is OpenSquareBracket
        when CurrentCharacter is CloseBrace also LastOpenerCharacter is OpenBrace
            move 1 to ParenthesesAreBalancedFlag
        when other
            move 0 to ParenthesesAreBalancedFlag
            goback
    end-evaluate
    .

end function ParenthesesAreBalanced.
