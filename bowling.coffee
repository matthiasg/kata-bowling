module.exports = class Bowling

    roll: (rolls) ->
        @rollsCount = rolls.length
        @rolls = makeASafeCopyOf(rolls)

    makeASafeCopyOf = (rolls) ->
        copiedArrayOfRolls = cloneArray(rolls)
        return makeItSafeToAccessAtLeastTwoRollsAfterTheLastOne(copiedArrayOfRolls)
    
    cloneArray = (array)->array.slice(0)
    
    makeItSafeToAccessAtLeastTwoRollsAfterTheLastOne = (rolls) ->
        rolls.push(0)
        rolls.push(0)
        return rolls

    score: () ->

        if not @rolls 
            return 0

        if @rollsCount is 0 
            return 0

        if @rollsCount is 1
            return @rolls[0] 

        score = 0
        @currentRoll = 0
        
        for frameIndex in [1..10]
          break if @_alreadyProcessedAllRolls()

          if @_isStrike()
            score += @_strikeBonus()
            @currentRoll++
          else if @_isSpare()
            score += @_spareBonus()
            @currentRoll += 2
          else
            score += @_normalFrameScore()
            @currentRoll += 2
        
        return score

    _alreadyProcessedAllRolls: () ->
        @currentRoll >= @rollsCount

    _isStrike: () ->
        @rolls[@currentRoll] == 10

    _isSpare: () ->
        (@_normalFrameScore()) == 10

    _strikeBonus: () ->
        10 + (@rolls[@currentRoll+1] + @rolls[@currentRoll+2])

    _spareBonus: () ->
        @_normalFrameScore() + @rolls[@currentRoll+2]

    _normalFrameScore: () ->
        (@rolls[@currentRoll] + @rolls[@currentRoll+1])













