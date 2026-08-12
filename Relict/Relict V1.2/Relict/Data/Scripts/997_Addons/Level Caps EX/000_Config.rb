module LevelCapsEX

  # Set this to the Game Variable which controls the value of the
  # level cap
  LEVEL_CAP_VARIABLE      = 29

  # Set this to the Game Variable which controls the mode of the
  # level cap. The 3 modes are:
  #   1 (Hard Cap) - The Pokemon cannot level up/gain experience 
  #   past the level cap.
  #   2 (EXP Cap) - The Pokemon will gain reduced EXP when it
  #   crosses the level cap.
  #   3 (Obedience Cap)  - The Pokemon will gain disobey the player
  #   when it crosses the level cap.
  LEVEL_CAP_MODE_VARIABLE = 30

  # Set this to the default mode of the Level Cap
  DEFAULT_LEVEL_CAP_MODE  = 1

  # Set this to the Game Switch which, when ON, disables level cap for enemy trainers
  LEVEL_CAP_BYPASS_SWITCH = 61

  # Set this to true if any changes to the Level Cap/Level Cap mode
  # should be printed to the console.
  LOG_LEVEL_CAP_CHANGES   = true
end

def getLevelCap
  return $game_variables[LevelCapsEX::LEVEL_CAP_VARIABLE]
end

def advancetoNextLevelCap
  levels = [
    10,
    19,
    28,
    37,
    46,
    55,
    64,
    73,
    82,
    100
  ]
  
  current_cap = $game_variables[LevelCapsEX::LEVEL_CAP_VARIABLE]
  index = levels.index(current_cap)

  if index.nil?
    $game_variables[LevelCapsEX::LEVEL_CAP_VARIABLE] = levels.first
  elsif index < levels.size - 1
    $game_variables[LevelCapsEX::LEVEL_CAP_VARIABLE] = levels[index + 1]
  end
end
