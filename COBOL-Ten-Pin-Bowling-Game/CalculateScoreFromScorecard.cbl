identification division.
function-id. CalculateScoreFromScorecard.

data division.
local-storage section.

01 MainFrames pic x(30) value spaces.
01 BonusBalls pic x(2) value spaces.
01 NumberOfFrames pic 99 value zero.

01 CurrentFrame pic 99 value zero.
01 FrameResultPointer pic 99 value 1.

01 NumberOfFramesPlusBonusBalls pic 99 value zero.

01 FrameResults.
    02 FrameResult occurs 1 to 12 times.
        03 Result pic x(2) value spaces.
            88 ResultIsStrike value "X".
            88 BallMissedPins value "-".
            88 BallHitRestOfPins value "/".
        03 FirstBallScore pic 99 value zero.
        03 SecondBallScore pic 99 value zero.

linkage section.
01 ScoreCard pic x(33) value spaces.
01 TotalScore pic 999 value zero.

procedure division using ScoreCard returning TotalScore.

Main.
    perform SplitScoreCardIntoFrames thru EndSplitScoreCardIntoFrames
    perform CalculateFrameScores thru EndCalculateFrameScores
    perform CalculateTotalScore thru EndCalculateTotalScore
    exit function.
EndMain.

SplitScoreCardIntoFrames.
    unstring ScoreCard
        delimited by "||"
        into MainFrames, BonusBalls
    end-unstring

    inspect MainFrames tallying NumberOfFrames for all "|".
    add 1 to NumberOfFrames

    perform with test after varying CurrentFrame from 1 by 1 until CurrentFrame is equal to NumberOfFrames
        unstring MainFrames delimited by "|"
            into Result(CurrentFrame)
            with pointer FrameResultPointer
        end-unstring
    end-perform

    move BonusBalls(1:1) to Result(NumberOfFrames + 1)
    move BonusBalls(2:1) to Result(NumberOfFrames + 2)

    add NumberOfFrames, 2 to NumberOfFramesPlusBonusBalls.
EndSplitScoreCardIntoFrames.

CalculateFrameScores.
    perform with test after varying CurrentFrame from 1 by 1 until CurrentFrame is equal to NumberOfFramesPlusBonusBalls
        if ResultIsStrike(CurrentFrame) then
            move 10 to FirstBallScore(CurrentFrame)
        else
            evaluate true
                when Result(CurrentFrame)(1:1) equal to "-"
                    move 0 to FirstBallScore(CurrentFrame)
                when other
                    move function numval(Result(CurrentFrame)(1:1)) to FirstBallScore(CurrentFrame)
            end-evaluate

            evaluate true
                when Result(CurrentFrame)(2:1) equal to "-"
                    move 0 to SecondBallScore(CurrentFrame)
                when Result(CurrentFrame)(2:1) equal to "/"
                    compute SecondBallScore(CurrentFrame) = 10 - FirstBallScore(CurrentFrame)
                when other
                    move function numval(Result(CurrentFrame)(2:1)) to SecondBallScore(CurrentFrame)
            end-evaluate
        end-if
    end-perform.
EndCalculateFrameScores.

CalculateTotalScore.
    initialize TotalScore
    perform with test before varying CurrentFrame from 1 by 1 until CurrentFrame is greater than NumberOfFrames
        evaluate true
            when ResultIsStrike(CurrentFrame)
                if ResultIsStrike(CurrentFrame + 1) or CurrentFrame equal to NumberOfFrames then
                    add FirstBallScore(CurrentFrame),
                        FirstBallScore(CurrentFrame + 1), FirstBallScore(CurrentFrame + 2) to TotalScore
                else
                    add FirstBallScore(CurrentFrame),
                        FirstBallScore(CurrentFrame + 1), SecondBallScore(CurrentFrame + 1) to TotalScore
                end-if
            when FirstBallScore(CurrentFrame) + SecondBallScore(CurrentFrame) equal to 10
                add FirstBallScore(CurrentFrame), SecondBallScore(CurrentFrame), FirstBallScore(CurrentFrame + 1)
                    to TotalScore
            when other
                add FirstBallScore(CurrentFrame), SecondBallScore(CurrentFrame) to TotalScore
        end-evaluate
    end-perform.
EndCalculateTotalScore.

end function CalculateScoreFromScorecard.
