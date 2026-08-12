def arceusBattle
  $game_variables[28] = 0
  $PokemonGlobal.nextBattleBGM = "ArcyBattle"
  pkmn = Pokemon.new(:ARCEUS, 100)
  pkmn.item = $PokemonSystem.difficulty != 0 ? :LEGENDPLATE : :WISEGLASSES
  case $PokemonSystem.difficulty
  when 0
    # look how they massacred my boy
  when 1
    # look how they massacred my boy x2
  when 2
    pkmn.ev[:SPECIAL_ATTACK] = 252
    pkmn.ev[:SPEED] = 252
  end
  pkmn.ev[:HP] = 6
  pkmn.shiny = false
  pkmn.learn_move(:JUDGMENT)
  if $PokemonSystem.difficulty > 0
    pkmn.learn_move(:RECOVER)
  else
    pkmn.learn_move(:FLAMETHROWER)
  end
  pkmn.learn_move(:CALMMIND)
  pkmn.learn_move(:DARKPULSE)
  pkmn.nature = :MODEST
  setBattleRule("midbattleScript", :arcy_battle)
  setBattleRule("databoxStyle", :Long)
  setBattleRule("editWildPokemon", {
  :hp_level => 6,
  :immunities => [:OHKO, :ABILITYREMOVAL, :PPLOSS, :TRANSFORM, :INDIRECT, :PLATESTEAL]
  }) #this doesnt work for some reason
  pkmn.instance_variable_set(:@immunities, [
    :OHKO, :ABILITYREMOVAL, :PPLOSS, :TRANSFORM, :INDIRECT, :PLATESTEAL
  ])
  setBattleRule("cannotRun")
  setBattleRule("disablePokeBalls")
  setBattleRule("outcome", 1)
  WildBattle.start(pkmn)
end

MidbattleHandlers.add(:midbattle_scripts, :raid_catch,
  proc { |battle, idxBattler, idxTarget, trigger|
    scene = battle.scene
    foe = battle.battlers[1]
    battler = battle.battlers[idxBattler]
    logname = _INTL("{1} ({2})", foe.pbThis(true), foe.index)
    case trigger
    #---------------------------------------------------------------------------
    # The player's Poke Balls are disabled at the start of the first round.
    when "RoundStartCommand_1_foe"
      PBDebug.log("[Midbattle Script] '#{trigger}' triggered by #{logname}...")
      battle.pbDisplayPaused(_INTL("{1} emited a powerful magnetic pulse!", foe.pbThis))
      battle.pbAnimation(:CHARGE, foe, foe)
      pbSEPlay("Anim/Paralyze3")
      battle.pbDisplayPaused(_INTL("Your Poké Balls short-circuited!\nThey cannot be used this battle!"))
      battle.disablePokeBalls = true
      foe.damageThreshold = 1
      PBDebug.log("[Midbattle Script] '#{trigger}' effects ended")
    end
    #---------------------------------------------------------------------------
  }
)

MidbattleHandlers.add(:midbattle_scripts, :arcy_battle,
  proc { |battle, idxBattler, idxTarget, trigger|
    scene = battle.scene
    foe = battle.battlers[1]
    user = battle.battlers[0]
    battler = battle.battlers[idxBattler]
    logname = _INTL("{1} ({2})", foe.pbThis(true), foe.index)
    case trigger
    when "TurnEnd_foe"
      scene.cycleBattleBackground
    #---------------------------------------------------------------------------
    # The player's Poke Balls are disabled at the start of the first round.
    when "RoundStartCommand_1_foe" 
      PBDebug.log("[Midbattle Script] '#{trigger}' triggered by #{logname}...")
      battle.pbDisplayPaused(_INTL("{1} emited a powerful magnetic pulse!", foe.pbThis))
      battle.pbAnimation(:CHARGE, foe, foe)
      pbSEPlay("Anim/Paralyze3")
      battle.pbDisplayPaused(_INTL("Your Poké Balls short-circuited!\nThey cannot be used this battle!"))
      battle.disablePokeBalls = true
      foe.damageThreshold = 1
      PBDebug.log("[Midbattle Script] '#{trigger}' effects ended")
      if $PokemonSystem.difficulty < 2 # normal and hard only
        user.pbOwnSide.effects[PBEffects::Tailwind] = 10
        battle.pbDisplay(_INTL("You remember the encouragement the lake fairies gave you as you climbed the tower..."))
        battle.pbDisplay(_INTL("Your team's speed rose for 10 turns!"))
      end
    #---------------------------------------------------------------------------
    when "BattlerReachedHPCap_foe"
      next if battle.pbTriggerActivated?(trigger) && $game_variables[28] > 3
      PBDebug.log("[Midbattle Script] '#{trigger}' triggered by #{logname}...")

      scene.pbStartSpeech(1)
      case $game_variables[28]
      when 0
        voice("Arcy", :laugh)
        Mugshot.load("ArcyLaugh")
        pbMessage(_INTL("\\tg[Arceus]Hahahahaha... Did you really think it would be that easy?"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]This place... it's the only one that's ever truly cared about you."))
        Mugshot.load("Arcy")
        choice = pbMessage(_INTL("\\tg[Arceus]So tell me... why would you ever want to leave?"),
        [
        _INTL("I don't want to stay... not if it means being your plaything.")
        ], -1)
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]You say that like you haven't enjoyed yourself ascending this tower with me."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]Or am I mistaken?"))
        Mugshot.dispose
      when 1
        voice("Arcy", :nod)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Surely, you understand by now, don't you?"))
        Mugshot.load("Arcy")
        choice = pbMessage(_INTL("\\tg[Arceus]If you keep going, you'll only suffer more over and over again."),
        [
        _INTL("No. I want to get out of here...")
        ], -1)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]You're truly a stubborn, maddening little thing."))
        Mugshot.dispose
      when 2
        voice("Arcy", :nod)
        Mugshot.load("ArcyLaugh")
        choice = pbMessage(_INTL("\\tg[Arceus]Well? Had enough?"),
        [
        _INTL("No. I won't give up.")
        ], -1)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]You're going to break if this continues."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Do you truly believe there's something better waiting for you outside this tower?"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]How exhausting you are..."))
        Mugshot.dispose
      when 3
        pbBGMFade(2)
        voice("Arcy", :nod)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]So... this isn't about strength anymore, is it?"))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahahahaha..."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]You... No, I..."))
        Mugshot.load("ArcyLaugh")
        pbMessage(_INTL("\\tg[Arceus]It seems like I've ruined all the fun, haven't I!?"))
        Mugshot.dispose
      end
      scene.pbForceEndSpeech

      $game_variables[28] += 1

      if $game_variables[28] < 4
        battle.pbAnimation(:BULKUP, battler, battler)
        battler.displayPokemon.play_cry
        battler.pbRecoverHP(battler.totalhp / 2)
        battle.pbDisplayPaused(_INTL("{1} is standing its ground!", battler.pbThis))
        showAnim = true
        [:DEFENSE, :SPECIAL_DEFENSE].each do |stat|
          next if !battler.pbCanRaiseStatStage?(stat, battler)
          battler.pbRaiseStatStage(stat, 2, battler, showAnim)
          showAnim = false
        end
        foe.damageThreshold = 1
      else
        old_hp = battler.hp
        battler.hp -= battler.totalhp.round
        scene.pbHitAndHPLossAnimation([[battler, old_hp, 0]])
        battler.pbFaint(true) if battler.fainted?
      end

      PBDebug.log("[Midbattle Script] '#{trigger}' effects ended")
    #---------------------------------------------------------------------------
    end
    #---------------------------------------------------------------------------
  }
)