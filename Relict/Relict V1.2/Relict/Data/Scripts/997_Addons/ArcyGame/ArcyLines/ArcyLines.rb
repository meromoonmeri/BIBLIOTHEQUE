class PokemonGlobalMetadata
    attr_accessor :remainingPlates
  
    def remainingPlates
      @remainingPlates ||= [
        :FLAMEPLATE,
        :SPLASHPLATE,
        :ZAPPLATE,
        :MEADOWPLATE,
        :ICICLEPLATE,
        :FISTPLATE,
        :TOXICPLATE,
        :EARTHPLATE,
        :SKYPLATE,
        :MINDPLATE,
        :INSECTPLATE,
        :STONEPLATE,
        :SPOOKYPLATE,
        :DRACOPLATE,
        :DREADPLATE,
        :IRONPLATE,
        :PIXIEPLATE,
        :BLANKPLATE
      ]
    end
end

def giveCandyItem
  pbMessage(_INTL("Something strange somehow ended up in your pockets..."))
  amount = [$PokemonGlobal.dungeonFloor / 10, 3].max.floor
  candy = :EXPCANDYXS
  case $PokemonGlobal.dungeonFloor
  when 1..10
    candy = :EXPCANDYXS
  when 11..20
    candy = :EXPCANDYS
  when 21..30
    candy = :EXPCANDYM
  when 31..40
    candy = :EXPCANDYL
  else
    candy = :EXPCANDYXL
  end
  pbReceiveItem(candy, amount * 3)
end

def unownDialogue
  return if $game_switches[68]
  Mugshot.load("ArcySmile")
  pbMessage(_INTL("\\tg[Arceus]Hahahaha... Did you try to figure out what it says on your own before I could translate it for you?"))
  Mugshot.dispose
  $game_switches[68] = true
end

def getArcyPlateDialogue(plate = nil)
    echoln $PokemonGlobal.remainingPlates
    return if $PokemonGlobal.remainingPlates.empty?
    pickPlate = plate.nil? ? $PokemonGlobal.remainingPlates.sample : plate
    GivePlateMessage.new(pickPlate)
    pbReceiveItem(pickPlate)

    case pickPlate
    when :FLAMEPLATE
        voice("Arcy", :curious)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]The Flame Plate. I missed this one."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]I may have made its message a little more explicit than necessary."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]But oh well. For those who seek the truth, it should be known."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]At the very beginning, before the universe even existed, there was someone else besides me."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]In fact, there were several individuals."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The first battle ever fought took place then... and the defeated were dealt with."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]I repurposed the power they wielded against me to create this Plate."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]It was the first act of justice ever carried out."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Though, if nothing truly existed back then... can it even be called justice?"))
        Mugshot.dispose
      end
    when :SPLASHPLATE
        voice("Arcy", :nod)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Splash Plate. Thank you."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]The \"rightful bearer\"... perhaps I should have written \"owner\" instead?"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]Oh? You didn't know I carved these Plates myself?"))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]I did so because I wanted everyone to know..."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]How everything came to be, which deities are to be revered..."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]And which ones are to be feared."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]I'm sure there will be many reactions from those who decipher the true meaning behind these Plates."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Once you've recovered them all, how about I prepare a little test?"))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]If you answer everything correctly, I'll even lend you my place at the Hall of Origin... as a god."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Of course, I'm only joking."))
        Mugshot.dispose
      end
    when :ZAPPLATE
        voice("Arcy", :curious)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Zap Plate. You did well."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]This Plate speaks specifically of <c3=f93d3d>Giratina</c3>'s rage."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Hatred built up over time, he now waits for the moment to unleash his wrath upon me."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]After all, it was I who imprisoned him in his realm for all eternity."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]To me, that was justice."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Certain events have led to <c3=f93d3d>Giratina</c3> being freed from his prison as of late."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Yet, he's only ever directed his rage at me..."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Even after all this time, he remains true to the duty I once gave him."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]So sometimes, I really wonder..."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]No, it's nothing. Pay me no mind."))
        Mugshot.dispose
      end
    when :MEADOWPLATE
        voice("Arcy", :curious)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Meadow Plate. Thank you."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Green isn't my favorite, but it is rather refreshing to look at."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]There are 18 types in total. Each one has a Plate it can draw power from."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]That means every Pokémon can make use of these Plates, too."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Of course, I'm the one who draws out their full potential."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Are you fond of any particular type?"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]I personally think the Fairy type is quite charming. It even gives me a nice pink look."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]Though it has its weaknesses, I think the Ice type is impressive as well."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]In the end, though, it all comes down to knowing how to use them properly."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]The moment you know your opponent's type, you already have a solid advantage."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]There are even people who've memorized nearly every Pokémon, their types, and effectiveness..."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Those people truly aren't afraid of boredom."))
        Mugshot.dispose
      end
    when :ICICLEPLATE
        voice("Arcy", :nod)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Icicle Plate. Let's see."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]The two beings it speaks of are <c3=1784ff>Dialga</c3> and <c3=e147f1>Palkia</c3>."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]As described, they were entrusted with the creation and control of time and space."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]Each resides within their own realm, separated from one another."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Both elements are extremely dangerous to tamper with..."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]But at the same time, they're the most entertaining forces to observe."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Just like the situation we find ourselves in now."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]As dangerous as it may seem... because this is something even I am experiencing for the first time..."))
        voice("Arcy", :laugh)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahahaha... Ah, I'm enjoying this a little."))
        Mugshot.dispose
      end
    when :FISTPLATE
      voice("Arcy", :nod)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Another Plate recovered. I owe you my thanks."))
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Sometimes, the world becomes unbalanced because of... that individual in the Distortion World."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]This warps the reality we live in, creating anomalies and things never seen before."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Though undesirable, I don't really mind these anomalies popping up every now and then."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]If everything always worked out exactly as intended..."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Well, I'd die of boredom."))
        Mugshot.dispose
      end
    when :TOXICPLATE
      voice("Arcy", :curious)
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]The Toxic Plate. I see."))
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Would you like to hear about the world it refers to?"))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]That would be the Distortion World."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]It's a parallel realm to your own, one that embodies antimatter; existing to maintain balance."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]The Distortion World's antimatter affects your world's matter... and vice versa."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]That means everything you do here could have consequences over there."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Ever considered that breaking something in this world might also affect the reverse one?"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]But don't worry too much."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Just make sure you haven't broken anything <c3=f93d3d>Giratina</c3> was particularly fond of."))
        Mugshot.dispose
      end
    when :EARTHPLATE
      voice("Arcy", :curious)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]The Earth Plate... I really like this one."))
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Whatever I used to create this Plate also became part of the universe long ago."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]Aren't you curious? About how the universe came to be?"))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Not everything was born from nothingness."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]I wasn't entirely alone before creation began."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]All you really need to understand is this: by the time everything came into being, I was the only one left watching it all unfold."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]You're welcome to try and make sense of it. Or, if your head starts to ache, feel free to ignore me entirely."))
        voice("Arcy", :laugh)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahahaha... That look on your face when I speak in riddles... It's truly fascinating."))
        Mugshot.dispose
      end
    when :SKYPLATE
      voice("Arcy", :curious)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]This is the Sky Plate. Thank you."))  
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Let me see... Ah, yes. This relates to that mineral humans call Origin Ore."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]It's a remnant of creation. Though to me it's just litter, it appears to have its uses."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]If any of the mythical Pokémon were to become enraged and unleash their power upon the world, it might prove useful for crafting weapons."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Yes. It's only natural to assume that anything originating from me holds immense value."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]If you succeed in helping me, I'll even grant you one of my golden trinkets... engraved with my symbol, of course."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]It even comes in different colors for you to choose from. Truly a Tempting Charm, isn't it?"))
        Mugshot.dispose
      end
    when :MINDPLATE
        voice("Arcy", :curious)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]This is... the Mind Plate. Thank you."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Yes, just as it says. I was the only one alive, back when there was nothing."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Looking back, it's been quite a long time."))
        Mugshot.load("ArcyThinkA")
        choice = pbMessage(_INTL("\\tg[Arceus]I wish I could enjoy things the way I did back then."),
        [
          _INTL("I suppose the world has changed a lot.")
        ], -1)
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Indeed. And I witnessed it all, every step of the way."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]To avoid disturbing the balance of the world, I imposed a rule upon myself: not to intervene directly."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]This resolution was absolute."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]As a fragment that still holds most of my original self's memories... it's been a long time since I've spoken like this with anyone."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]So, this is a little entertaining for me."))
        Mugshot.load("ArcyShrugB")
        choice = pbMessage(_INTL("\\tg[Arceus]And for that, I must thank you."),
        [
          _INTL("Do you, as a fragment, also follow the no-intervention policy?")
        ], -1)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]...That's a tricky question."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]This resolution has only grown stronger within me throughout the years."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]The more I restrained myself, the more entertaining it became to witness the unexpected."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]I'm fairly certain a fragment of a younger version of myself would have had more freedom than I do now."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Unfortunately, you're stuck with a rather useless god; merely a spectator."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]I wonder if you would have preferred another version of me."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]But oh well."))
        Mugshot.dispose
      end
    when :INSECTPLATE
        voice("Arcy", :curious)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Insect Plate... Thank you."))
        Mugshot.dispose
        unownDialogue
        if $PokemonGlobal.remainingPlates.include?(pickPlate)
            Mugshot.load("ArcyThink")
            pbMessage(_INTL("\\tg[Arceus]It's said that everything originated atop Mt. Coronet, in Sinnoh."))
            Mugshot.load("ArcyThinkA")
            pbMessage(_INTL("\\tg[Arceus]Because that place is closest to the skies, it's also closest to the Hall of Origin, where my true self resides."))
            Mugshot.load("ArcyThinkB")
            pbMessage(_INTL("\\tg[Arceus]What do I mean by my \"true self\"?"))
            Mugshot.load("Arcy")
            pbMessage(_INTL("\\tg[Arceus]The being you see before you is but a fraction of what I truly am."))
            Mugshot.load("ArcyDown")
            pbMessage(_INTL("\\tg[Arceus]As an absolute god, I would never allow myself to fall into such a problematic situation as this."))
            Mugshot.load("ArcyShrug")
            choice = pbMessage(_INTL("\\tg[Arceus]Were my full self compromised, it would threaten the very existence of the universe and every world within it."),
            [
            _INTL("So, what are you exactly?")
            ], -1)
            Mugshot.load("ArcyShrugA")
            pbMessage(_INTL("\\tg[Arceus]You could say I am a part of the true \"Arceus\", if that makes sense to you."))
            Mugshot.load("ArcyShrugB")
            pbMessage(_INTL("\\tg[Arceus]Usually, I wouldn't fragment myself like this without a reason. This was a little experiment of mine."))
            Mugshot.load("ArcyThink")
            pbMessage(_INTL("\\tg[Arceus]Would things play out differently if I appeared in the world myself? Would people behave in more interesting ways?"))
            Mugshot.load("ArcyThinkB")
            pbMessage(_INTL("\\tg[Arceus]I was eager to find out. However..."))
            Mugshot.load("Arcy")
            pbMessage(_INTL("\\tg[Arceus]In doing this, I only made things worse. Splitting myself off cut me off from the other worlds and timelines I used to watch."))
            Mugshot.load("ArcyDown")
            pbMessage(_INTL("\\tg[Arceus]And even now, my own rules prevent me from interfering. Plus, hardly anyone climbs the tower to reach me..."))
            Mugshot.load("ArcyYeah")
            pbMessage(_INTL("\\tg[Arceus]Hahahaha... My little plan backfired..."))
            Mugshot.dispose
        end
    when :STONEPLATE
      voice("Arcy", :nod)
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Mmm. The Stone Plate."))
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]It speaks of something I've already mentioned. The Plates hold power for me to wield."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]The flute it mentions is the Azure Flute. It's one of the ways mortals can call upon me at the Hall of Origin."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]A few humans have managed to do so in the past."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Both were truly fascinating individuals and earned my blessing."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Do you seek my blessing as well?"))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]In the past, I've strengthened Pokémon bloodlines, and even offered myself to humans becoming their personal tool."))
        Mugshot.load("ArcyShrugB")
        choice = pbMessage(
        _INTL("\\tg[Arceus]I wonder what would suit you best."),
        [
        _INTL("I would strengthen my Pokémon..."),
        _INTL("I would choose Arceus himself...")
        ],-1)
        case choice
        when 0
          Mugshot.load("ArcyShrugB")
          pbMessage(_INTL("\\tg[Arceus]Everyone has their favorites they wish to see become the strongest."))
          Mugshot.load("Arcy")
          pbMessage(_INTL("\\tg[Arceus]An interesting choice, no doubt."))
        when 1
          voice("Arcy", :laugh)
          Mugshot.load("ArcySmile")
          pbMessage(_INTL("\\tg[Arceus]Hahahaha..."))
          Mugshot.load("ArcySmile")
          pbMessage(_INTL("\\tg[Arceus]A God in the hands of a human is always a fascinating sight."))
          Mugshot.load("ArcySmile")
          choice = pbMessage(
          _INTL("\\tg[Arceus]I would be most pleased to serve you."),
          [
          _INTL("...So that I can put him on a diet. He's a bit chonky.")
          ],-1)
          voice("Arcy", :surprise)
          Mugshot.load("ArcyShrug")
          pbMessage(_INTL("\\tg[Arceus]...Guess I walked right into that one."))
        end
        Mugshot.dispose
      end
    when :SPOOKYPLATE
      voice("Arcy", :curious)
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Ah, forgive me. Thank you for retrieving the Spooky Plate."))
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]The \"other side of this world\" refers to the Distortion World. And the \"raging third\" would be Giratina."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]At first, that realm was entrusted to him to protect as its guardian."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]But in the end, I judged him too dangerous... and banished him there."))
        Mugshot.load("ArcyDown")
        choice = pbMessage(_INTL("\\tg[Arceus]That is all there is to it. I kind of forgot what else happened exactly."),
        [
          _INTL("Why create someone that dangerous in the first place?")
        ], -1)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Distortion World was never intended to be a prison for <c3=f93d3d>Giratina</c3>."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]It's a complicated matter... ironically so."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.dispose
      end
    when :DRACOPLATE
        voice("Arcy", :curious)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The Draco Plate. One of people's favorites."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Mesprit, Uxie, and Azelf... These are the three beings mentioned."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Because time and space are no laughing matter, they were also created with the purpose of restraining either one, should they fall into chaos."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]If I had to guess, only <c3=f93d3d>Giratina</c3> and myself would be able to handle both at the same time."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]But even so, given the situation we find ourselves in, there isn't much I can do."))
        Mugshot.load("ArcyDown")
        choice = pbMessage(_INTL("\\tg[Arceus]And I doubt <c3=f93d3d>Giratina</c3> would be kind enough to come to my aid."),
        [
          _INTL("Why leave it in the hands of a human..."),
          _INTL("...and not someone stronger with better odds?")
        ], -1)
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Because that would be boring, of course."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]I am but a fragment of my true self. My life isn't so valuable that I must do everything in my power to survive."))
        Mugshot.load("ArcyShrugB")
        choice = pbMessage(_INTL("\\tg[Arceus]As such, I'd rather have a little fun, even if it ends with my death."),
        [
          _INTL("That sounds terrible.")
        ], -1)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Does it, really?"))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Fragments exist to simply watch the world from up close."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]But from here, there isn't much I can truly enjoy."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Just like my original self, I can't interfere unless it's a true emergency."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]If I'm being honest, my existence is rather dull."))
        Mugshot.load("ArcyDown")
        choice = pbMessage(_INTL("\\tg[Arceus](...)"),
        [
          _INTL("But oh well?")
        ], -1)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Yes..."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]But oh well."))
        Mugshot.dispose
      end
    when :DREADPLATE
        voice("Arcy", :nod)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]You found the Dread Plate. Well done."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]The beings mentioned here form the core of the world."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]<c3=e147f1>Palkia</c3> and <c3=1784ff>Dialga</c3> govern space and time, while Uxie, Mesprit, and Azelf embody the spirit: wisdom, emotion, and willpower."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]Is there one of those you find yourself particularly strong in?"))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]As for me, it would have to be wisdom."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]As the one who created everything, it would be shameful if I lacked knowledge about anything in this world."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]I rarely forget anything, so if I ever claim I have, it would be a blatant lie."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]I've witnessed so much since the moment I came into existence."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]If I had the chance to erase my memories and return to the one I once was, still discovering the wonders of the world..."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Mmmm. I wonder..."))
        Mugshot.dispose
      end
    when :IRONPLATE
        voice("Arcy", :nod)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Thank you for finding the Iron Plate."))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]The antimatter within the Distortion World also serves to absorb and contain the negative emotions from the world above."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]If it were to become unstable, it could begin to affect the behavior of both people and Pokémon."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Spending too long in a world built to harbor negativity..."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]You can imagine what that might do to someone."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]But oh well. Everything in the world must be tended to, one way or another."))
        Mugshot.dispose
      end
    when :PIXIEPLATE
        voice("Arcy", :nod)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]The Pixie Plate. Pink is good, right?"))
        Mugshot.dispose
        unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]This Plate speaks of myself. There isn't much I can say about it; just me, the creator of all things, yet present in none."))
        Mugshot.load("ArcyThinkB")
        choice = pbMessage(
          _INTL("\\tg[Arceus]Speaking of myself... I'm rather curious. What do you think of me?"),
          [
            _INTL("You really have issues."),
            _INTL("You speak of boredom, but you are the one boring yourself.")
          ], -1
        )
        voice("Arcy", :laugh)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahahaha. Coming from a human, that stings a little, I must admit."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]It hasn't always been like this, you know."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]I was... a little different when I was still discovering the wonders of the world for the first time."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]I even used to have my fair share of issues doing simple math."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]One time, I had <c3=e147f1>Palkia</c3> and <c3=1784ff>Dialga</c3> fetch some bread for me at the Hall of Origin."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]But I insisted on paying for it myself..."))
        Mugshot.load("ArcyThinkB")
        choice = pbMessage(
        _INTL("\\tg[Arceus]And thus, I ended up spending forever just counting out the coins."),
        [
        _INTL("You can't do math...?"),
        _INTL("Why bread?")
        ], -1
        )
        case choice
        when 0
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]I had my... struggles with it."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]I'm good at it now, of course."))
        when 1
        Mugshot.load("ArcyYeah")
        pbMessage(_INTL("\\tg[Arceus]It's yummy."))
        end
        Mugshot.dispose
      end
    when :BLANKPLATE
      voice("Arcy", :curious)
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Ah, this Plate... Honestly, it's rather useless to me in battle."))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]Don't get me wrong, I still appreciate you retrieving it for me."))
      Mugshot.dispose
      unownDialogue
      if $PokemonGlobal.remainingPlates.include?(pickPlate)
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Now, these three mentioned beings are <c3=1784ff>Dialga</c3>, <c3=e147f1>Palkia</c3>, and <c3=f93d3d>Giratina</c3>."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]You're wondering if one of them could be behind what's happened to me and the tower?"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Well, one of them definitely wants me dead, that much is certain."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]However... to tamper with my very own domain?"))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]I wonder if anyone out there is truly capable of that."))
        voice("Arcy", :laugh)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]That only makes things even more interesting, wouldn't you agree?"))
        Mugshot.dispose
      end
    else
      # Unknown plate
    end

    $PokemonGlobal.remainingPlates.delete(pickPlate)
    if $PokemonGlobal.remainingPlates.empty?
      pbWait(0.8)
      voice("Arcy", :nod)
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]And with this, every Plate has been returned to me."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]You have my sincerest gratitude, \\PN."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]However, I cannot send you back just yet. The Destiny Tower remains unstable."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]Let us reach the top together, so that I can stabilize everything."))
      Mugshot.dispose
    end

    arcyTeDaSuBola
end
