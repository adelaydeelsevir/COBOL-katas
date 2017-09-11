*> Write a program to show that the 13th day of the month
*> falls more often on a Friday than any other day of the
*> week. The 1st of January 1973 was a Monday.
*> You should aim at producing the clearest possible
*> program, not the fastest.

*> [source: BCPL the language and its compiler
*> by Martin Richards and Colin Whitby-Strevens]

identification division.
program-id. FridayThe13.

environment division.
configuration section.
    repository.
        function IsLeapYear
        function DayOfWeek.

data division.
working-storage section.

01 CurrentDate.
    02 CurrentYear  pic 9999.
    02 CurrentMonth pic 99.
        88 MonthIsFebruary value "02".
    02 CurrentDay   pic 99.
        88 DayIsThirteenth value "13".

01 StartDate.
    02 StartYear  pic 9999.
    02 StartMonth pic 99.
    02 StartDay   pic 99.

01 EndDate.
    02 EndYear  pic 9999.
    02 EndMonth pic 99.
    02 EndDay   pic 99.

01 DaysInMonthTable.
    02 DaysInMonthValues.
        03 filler pic 99 value 31.
        03 filler pic 99 value 28.
        03 filler pic 99 value 31.
        03 filler pic 99 value 30.
        03 filler pic 99 value 31.
        03 filler pic 99 value 30.
        03 filler pic 99 value 31.
        03 filler pic 99 value 31.
        03 filler pic 99 value 30.
        03 filler pic 99 value 31.
        03 filler pic 99 value 30.
        03 filler pic 99 value 31.
    02 filler redefines DaysInMonthValues.
        03 DaysInMonth occurs 12 times.
            04 NumberOfDays pic 99.

01 DaysInCurrentMonth pic 99.

01 DaysOfWeekTable.
    02 DaysOfWeekValues.
        03 filler pic x(13) value "Sunday".
        03 filler pic x(13) value "Monday".
        03 filler pic x(13) value "Tuesday".
        03 filler pic x(13) value "Wednesday".
        03 filler pic x(13) value "Thursday".
        03 filler pic x(13) value "Friday".
        03 filler pic x(13) value "Saturday".
    02 filler redefines DaysOfWeekValues.
        03 DaysOfWeek occurs 7 times.
            04 DayName pic x(9).
            04 CountOfTimesFallsOnThirteeth pic 9999.

01 CurrentDayOfWeek pic 9.
01 NumberOfDaysInWeek constant 7.
01 DayThatMostFallsOnThirteen pic 9 value 0.
01 HighestNumberOfOccurances pic 999 value 0.

01 TotalNumberOfDays pic 9(5) value zeroes.

01 DateFormatted pic 9999/99/99.
01 TotalDaysFormatted pic ZZZ,ZZ9.

procedure division.
Main section.

    move 18010101 to StartDate
    accept EndDate from date yyyymmdd
    compute CurrentDayOfWeek = DayOfWeek(StartDate)

    perform varying CurrentYear from StartYear by 1 until CurrentYear > EndYear
        perform varying CurrentMonth from StartMonth by 1
            until CurrentMonth > 12
            or CurrentYear = EndYear and CurrentMonth > EndMonth

            evaluate true also true
                when MonthIsFebruary also IsLeapYear(CurrentYear) is equal to 1
                    move 29 to DaysInCurrentMonth
                when other
                    move DaysInMonth(CurrentMonth) to DaysInCurrentMonth
            end-evaluate

            perform varying CurrentDay from StartDay by 1 until CurrentDay > DaysInCurrentMonth
                or CurrentYear = EndYear and CurrentMonth = EndMonth and CurrentDay > EndDay

                if DayIsThirteenth then
                    add 1 to CountOfTimesFallsOnThirteeth(CurrentDayOfWeek)
                end-if

                if CurrentDayOfWeek is less than NumberOfDaysInWeek then
                    add 1 to CurrentDayOfWeek
                else
                    move 1 to CurrentDayOfWeek
                end-if

                add 1 to TotalNumberOfDays

            end-perform
        end-perform
    end-perform

    display "Results - Number of occurances of each day"
    display "=========================================="
    display "Start date: " DayName(DayOfWeek(StartDate)) StartDay "/" StartMonth "/" StartYear
    display "End date  : " DayName(DayOfWeek(EndDate)) EndDay "/" EndMonth "/" EndYear
    display spaces
    perform with test after varying CurrentDayOfWeek from 1 by 1
        until CurrentDayOfWeek equal to NumberOfDaysInWeek
        display DayName(CurrentDayOfWeek) " : " CountOfTimesFallsOnThirteeth(CurrentDayOfWeek)
        if CountOfTimesFallsOnThirteeth(CurrentDayOfWeek) is greater than HighestNumberOfOccurances
            move CountOfTimesFallsOnThirteeth(CurrentDayOfWeek) to HighestNumberOfOccurances
            move CurrentDayOfWeek to DayThatMostFallsOnThirteen
        end-if
    end-perform

    display space
    display "Therefore the 13th is most often a " DayName(DayThatMostFallsOnThirteen)
    move TotalNumberOfDays to TotalDaysFormatted
    display "Days processed " TotalDaysFormatted
    stop run
    .

end program FridayThe13.
