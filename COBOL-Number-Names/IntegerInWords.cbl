identification division.
function-id. IntegerInWords.

environment division.
    configuration section.
        repository.
        function all intrinsic
        function ThreeDigitNumberInWords.

data division.
    local-storage section.
        01 NumberToConvert pic 999999999 value zeros.

        01 NumberInParts.
            02 UnitsPart pic 999 value zeroes.
            02 ThousandsPart pic 999 value zeroes.
            02 MillionsPart pic 999 value zeroes.

        01 NumberInWords.
            02 MillionsInWords pic x(30) value spaces.
            02 ThousandsInWords pic x(30) value spaces.
            02 UnitsInWords pic x(30) value spaces.

    linkage section.
        01 InputValue pic 9 any length.
        01 StringValue  pic x(255).

procedure division using InputValue returning StringValue.

    initialize NumberToConvert, NumberInParts, NumberInWords
    move InputValue to NumberToConvert
    move NumberToConvert(1:3) to MillionsPart
    move NumberToConvert(4:3) to ThousandsPart
    move NumberToConvert(7:3) to UnitsPart

    move ThreeDigitNumberInWords(UnitsPart) to UnitsInWords
    move ThreeDigitNumberInWords(ThousandsPart) to ThousandsInWords
    move ThreeDigitNumberInWords(MillionsPart) to MillionsInWords

    evaluate MillionsPart also ThousandsPart also UnitsPart
    when 0 also 0 also > 0
        move UnitsInWords to StringValue
    when 0 also > 0 also 0
        move concatenate(trim(ThousandsInWords), " thousand") to StringValue
    when 0 also > 0 also < 100
        move concatenate(trim(ThousandsInWords), " thousand and ", UnitsInWords) to StringValue
    when 0 also > 0 also >= 100
        move concatenate(trim(ThousandsInWords), " thousand, ", UnitsInWords) to StringValue
    when > 0 also 0 also 0
        move concatenate(trim(MillionsInWords), " million") to StringValue
    when > 0 also 0 also < 100
        move concatenate(trim(MillionsInWords), " million and ", UnitsInWords) to StringValue
    when > 0 also 0 also >= 100
        move concatenate(trim(MillionsInWords), " million, ", UnitsInWords) to StringValue
    when > 0 also > 0 also 0
        move concatenate(trim(MillionsInWords), " million, ",
                        trim(ThousandsInWords), " thousand") to StringValue
    when > 0 also > 0 also < 100
        move concatenate(trim(MillionsInWords), " million, ",
        trim(ThousandsInWords), " thousand and ",
        trim(UnitsInWords)) to StringValue
    when > 0 also > 0 also >= 100
        move concatenate(trim(MillionsInWords), " million, ",
        trim(ThousandsInWords), " thousand, ",
        trim(UnitsInWords)) to StringValue
    end-evaluate

    goback
    .

end function IntegerInWords.

identification division.
function-id. ThreeDigitNumberInWords.

environment division.
    configuration section.
        repository.
        function all intrinsic.

data division.
local-storage section.
    01 WorkingValue pic 999.
    01 CurrentDigit pic 9.
    01 CurrentDigitInWords pic x(25).
    01 NumberHasHundreds pic 9 binary value 0.

linkage section.
    01 InputValue pic 999.
    01 NumberInWords pic x(255).

procedure division using InputValue returning NumberInWords.
Main.
    move InputValue to WorkingValue
    initialize NumberHasHundreds

    if InputValue less than 10
        move WorkingValue(3:1) to CurrentDigit
        perform UnitValues thru EndUnitValues
        move trim(CurrentDigitInWords) to NumberInWords
        goback
    end-if

    if WorkingValue(1:1) greater than zero
        move WorkingValue(1:1) to CurrentDigit
        perform UnitValues thru EndUnitValues
        move concatenate(trim(CurrentDigitInWords), " hundred") to NumberInWords
        move 1 to NumberHasHundreds
    end-if

    if WorkingValue(2:1) greater than zero
        if WorkingValue(2:1) greater than 1
            move WorkingValue(2:1) to CurrentDigit
            perform Tens thru EndTens
            if NumberHasHundreds equals 1
                move concatenate(trim(NumberInWords), " and ", trim(CurrentDigitInWords)) to NumberInWords
            else
                move CurrentDigitInWords to NumberInWords
            end-if
            if WorkingValue(3:1) greater than zero
                move WorkingValue(3:1) to CurrentDigit
                perform UnitValues thru EndUnitValues
                move concatenate(trim(NumberInWords), "-", trim(CurrentDigitInWords)) to NumberInWords
            end-if
        else
            move WorkingValue(3:1) to CurrentDigit
            perform Teens thru EndTeens
            if NumberHasHundreds equals 1
                move concatenate(trim(NumberInWords), " and ", trim(CurrentDigitInWords)) to NumberInWords
            else
                move CurrentDigitInWords to NumberInWords
            end-if
        end-if
    else
        if WorkingValue(3:1) greater than zero
            move WorkingValue(3:1) to CurrentDigit
            perform UnitValues thru EndUnitValues
            move concatenate(trim(NumberInWords), " and ", trim(CurrentDigitInWords)) to NumberInWords
        end-if
    end-if
    goback
    .
EndMain.

UnitValues.
    evaluate CurrentDigit
        when 1 move "one" to CurrentDigitInWords
        when 2 move "two" to CurrentDigitInWords
        when 3 move "three" to CurrentDigitInWords
        when 4 move "four" to CurrentDigitInWords
        when 5 move "five" to CurrentDigitInWords
        when 6 move "six" to CurrentDigitInWords
        when 7 move "seven" to CurrentDigitInWords
        when 8 move "eight" to CurrentDigitInWords
        when 9 move "nine" to CurrentDigitInWords
    end-evaluate
    .
EndUnitValues.

Teens.
    evaluate CurrentDigit
        when 0 move "ten" to CurrentDigitInWords
        when 1 move "eleven" to CurrentDigitInWords
        when 2 move "twelve" to CurrentDigitInWords
        when 3 move "thirteen" to CurrentDigitInWords
        when 4 move "fourteen" to CurrentDigitInWords
        when 5 move "fifteen" to CurrentDigitInWords
        when 6 move "sixteen" to CurrentDigitInWords
        when 7 move "seventeen" to CurrentDigitInWords
        when 8 move "eighteen" to CurrentDigitInWords
        when 9 move "nineteen" to CurrentDigitInWords
    end-evaluate
    .
EndTeens.

Tens.
    evaluate CurrentDigit
        when 2 move "twenty" to CurrentDigitInWords
        when 3 move "thirty" to CurrentDigitInWords
        when 4 move "forty" to CurrentDigitInWords
        when 5 move "fifty" to CurrentDigitInWords
        when 6 move "sixty" to CurrentDigitInWords
        when 7 move "seventy" to CurrentDigitInWords
        when 8 move "eighty" to CurrentDigitInWords
        when 9 move "ninety" to CurrentDigitInWords
    end-evaluate
    .
EndTens.

end function ThreeDigitNumberInWords.
