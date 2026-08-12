def getTeam(trainerID)
  difficulty_map = {
    0 => :normal,
    1 => :hard,
    2 => :unfair
  }

  difficulty_key = difficulty_map[$PokemonSystem.difficulty] || :normal

  trainer_hashes = TRAINERS_ALL
  trainer_hashes.each do |trainer|
    if trainer[trainerID]
      team_data = trainer[trainerID][1]
      return team_data[difficulty_key]
    end
  end

  return nil
end

def test_all_trainers
  group_names = [
    "TRAINER_0",
    "TRAINER_1",
    "TRAINER_2",
    "TRAINER_3",
    "TRAINER_4",
    "TRAINER_5",
    "TRAINER_6",
    "TRAINER_7",
    "CHAMPION"
  ]

  group_choice = pbMessage(
    "\\tg[Debug] Select a trainer group.",
    group_names + ["Cancel"],
    -1
  )
  return if group_choice < 0 || group_choice >= group_names.size

  group_hash = TRAINERS_ALL[group_choice]

  trainer_list = group_hash.keys.map { |sym| sym.to_s }
  trainer_list.sort!
  trainer_list << "Cancel"

  trainer_choice = pbMessage(
    "\\tg[Debug] Select a trainer.",
    trainer_list,
    -1
  )
  return if trainer_choice < 0 || trainer_list[trainer_choice] == "Cancel"

  trainer_id = trainer_list[trainer_choice].to_sym

  pbRandomTeamGenerator(trainer_id)
end

def pbRandomTeamGenerator(trainer)

  opp = NPCTrainer.new(_INTL(trainer.to_s.sub(/^(CHAMPION_|LEADER_)/, '')), trainer)
  opp.lose_text = _INTL("...")
  opp.items = [:MEGARING]
  selected_pokemon = getTeam(trainer)
  echoln selected_pokemon
  team_size = selected_pokemon.size
  
  opp.party = selected_pokemon.map do |species, details|
    pkmn = Pokemon.new(species, getLevelCap)
    pkmn.shiny = false
    pkmn.ability = details[:ability] if details[:ability]
    pkmn.item    = details[:item] if details[:item]
    pkmn.moves   = details[:moves]
    pkmn.nature  = details[:nature] if details[:nature]
    
    [:HP, :ATTACK, :DEFENSE, :SPECIAL_ATTACK, :SPECIAL_DEFENSE, :SPEED].each do |stat|
      ev_key1 = "#{stat}_ev".to_sym
      ev_key2 = stat
      if details[ev_key1]
        pkmn.ev[stat] = details[ev_key1]
      elsif details[ev_key2]
        pkmn.ev[stat] = details[ev_key2]
      end
    end

    [:HP, :ATTACK, :DEFENSE, :SPECIAL_ATTACK, :SPECIAL_DEFENSE, :SPEED].each do |stat|
      pkmn.iv[stat] = 31
    end

    pkmn.calc_stats
    pkmn
  end
  
  TrainerBattle.start(opp)
end
