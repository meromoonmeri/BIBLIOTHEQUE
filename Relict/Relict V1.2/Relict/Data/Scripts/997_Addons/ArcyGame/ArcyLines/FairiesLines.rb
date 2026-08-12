
UXIE_DIALOGUES = [:shopdialogue0, :shopdialogue3, :shopdialogue6]
AZELF_DIALOGUES = [:shopdialogue1, :shopdialogue4, :shopdialogue7]
MESPRIT_DIALOGUES = [:shopdialogue2, :shopdialogue5, :shopdialogue8, :shopdialogue9]

def azelfRespite
    azelfEvent = $game_map.events[2]
    mespritEvent = $game_map.events[8]
    uxieEvent = $game_map.events[9]
    illusion = $game_map.events[6]
    arcy = $game_map.events[1]

    azelf_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[1]

    case azelf_dialogue
    when :shopdialogue4
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]A lot of the stuff we're offering now? Honestly, I hardly recognize half of it."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]They were pulled in from all kinds of worlds and timelines, apparently."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Not that this tower's a stranger to weird, but this is a new kind of distortion."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Back then, the place was crawling with monster houses, loaded with traps, and it wiped your level and battle smarts clean every time you walked in."))
        Mugshot.load("Azelf")
        choice = pbMessage(_INTL("\\tg[Azelf]With all that and Master's stellar marketing sense... you can guess he wasn't getting a ton of visitors."), [
        _INTL("Marketing...?")
        ], -1)
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]If you can call it that. Master scribbled the tower's location on a napkin and handed it off to a Spinda who runs a coffee shop."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]People were supposed to accidentally discover it stuck to the bottom of their cup."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]So yeah... all that power, and still no idea how to get people to show up."))
        Mugshot.dispose
    when :shopdialogue7
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]The three of us usually hang around lakes."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Guardianship and secrecy are kind of our deal, so we've hidden our spots away in some... well, let's call them \"creative\" locations."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]...But for you, I'm willing to share a bit if you're curious."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Mine's tucked away in a crystal cave. You can only get in if you solve a puzzle made of... yeah, you guessed it, crystals."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Back then, when I was guarding a Time Gear, I even rigged the lake to fill with crystal formations to make the Gear impossible to reach."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Sure, it kind of messed up the view... but if it meant doing my job right, it was totally worth it."))

        pbCameraToEvent(arcy.id)
        arcy.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Well, at least the lake you're in now didn't get completely drained by a bomb for your capture."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahaha... The sight of all those Magikarp desperately flopping around the dry lakebed... Now that was a little entertaining."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)

        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]...Excuse me? Master? What could you possibly be talking about...?"))
        Mugshot.dispose

        pbCameraToEvent(arcy.id)
        arcy.turn_toward_player
        pbWait(0.6)

        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Oh. Don't mind me."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)
    when :shopdialogue1
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Your willpower is... pretty average. Not bad, but nothing that stands out."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Now, Master? He's got the power to do quite literally anything."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]But does he do much? Nope..."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]When you can do everything, putting in effort just feels pointless."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]So yeah, he calls it boring and leaves the work to us."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Lucky us, huh?"))
        Mugshot.dispose
    end
    giveCandyItem
    $PokemonGlobal.shopDialogue.delete(azelf_dialogue)
    echoln $PokemonGlobal.shopDialogue
end

def mespritRespite
    azelfEvent = $game_map.events[2]
    mespritEvent = $game_map.events[8]
    uxieEvent = $game_map.events[9]
    illusion = $game_map.events[6]
    arcy = $game_map.events[1]

    mesprit_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[1]

    case mesprit_dialogue
    when :shopdialogue5
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]You're from another world, aren't you? How fascinating!"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]I suppose Pokémon have roles and purposes over there too, don't they?"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Here, my siblings and I were once entrusted with something called the Time Gears."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]They're mystical artifacts tied to <c3=1784ff>Dialga</c3>'s Temporal Tower, and just like their name suggests, they keep time from falling apart."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]There was this dreadful incident once, you see... A whole catastrophe nearly plunged our world into stillness and shadow."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]The \"World paralysis\"... A calamity that could've frozen every breeze, every sunrise... every feeling."))
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]But thanks to some brave, courageous Pokémon, the disaster was narrowly averted!"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Oh! And whisper this part... but some rumors say Master had something to do with it, right at the very end. Isn't that mysteriooous?"))
        
        pbCameraToEvent(arcy.id)
        arcy.turn_toward_player
        pbWait(0.6)

        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]What I can say is this... I quite enjoy watching the stories of this world unfold."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]And it would be very disappointing if suddenly everyone vanished and left me with nothing to watch. Hahahaha..."))
        
        pbCameraReset
        pbWait(0.6)

        Mugshot.load("MespritFunny")
        pbMessage(_INTL("\\tg[Mesprit]...Well! You heard it."))
        Mugshot.load("MespritYeah")
        pbMessage(_INTL("\\tg[Mesprit]His honesty is not exactly comforting, but... I'll take it."))
        Mugshot.dispose
    when :shopdialogue8
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]Oh! Did Uxie and Azelf already tell you about their little secrets?"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Well then, I suppose it's only fair I share something about myself too!"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Let's see... Should I talk about my lake?"))
        Mugshot.load("MespritAngery")
        pbMessage(_INTL("\\tg[Mesprit]Mine lies underground. To reach it, you have to let the shifting sands of the desert swallow you."))
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]Only the truly desperate would jump into moving sands expecting anything beneath!"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit](...)"))
        Mugshot.load("MespritFunny")
        pbMessage(_INTL("\\tg[Mesprit]...And yet, somehow, people still manage to find it."))
        Mugshot.dispose

        pbCameraToEvent(uxieEvent.id)
        uxieEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]A proper entrance should challenge the mind."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Puzzles, for instance, ensure only those with the knowledge to proceed can do so."))
        Mugshot.dispose

        pbCameraToEvent(azelfEvent.id)
        azelfEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Well... knowledge may open the door, but only sheer will can carry you through it."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Still, even determination won't help if you're clueless about what you're doing."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)

        Mugshot.load("MespritAngery")
        pbMessage(_INTL("\\tg[Mesprit]And none of that matters if you don't feel why it's worth it."))
        Mugshot.load("MespritAngery")
        pbMessage(_INTL("\\tg[Mesprit]If someone lacks heart... they'll never make it to the end."))
        Mugshot.dispose

        pbCameraToEvent(uxieEvent.id)
        uxieEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]In the end, all three aspects are essential: willpower, emotion, and knowledge."))
        Mugshot.dispose

        pbCameraToEvent(azelfEvent.id)
        azelfEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]To neglect any one of them..."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)

        Mugshot.load("MespritYeah")
        pbMessage(_INTL("\\tg[Mesprit]...Can lead to trouble, don't you think, Master?"))
        Mugshot.dispose

        pbCameraToEvent(arcy.id)
        arcy.turn_toward_player
        pbWait(0.6)

        Mugshot.load("ArcyYeah")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]...You're having quite a lot of fun with this, is what I think."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)
    when :shopdialogue9
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]So... you'll probably be leaving soon, huh? The summit's just up ahead."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]You don't look too thrilled, though."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Let me guess... it feels like none of this really gave you answers, right?"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Dragged into all this weirdness, put through trial after trial... and for what?"))

        pbCameraToEvent(uxieEvent.id)
        uxieEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]I suspect Master does know what this was all about."))
        Mugshot.dispose

        pbCameraToEvent(azelfEvent.id)
        azelfEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]But, as usual, he's not willing to say a thing."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)

        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]Yeah, we're in the dark too. Just like you, we were called here to do... something, apparently."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Still... I'm really glad I got to meet you. You've got a good heart!"))
        Mugshot.load("Mesprit", false, true)
        pbMessage(_INTL("\\tg[Mesprit](So hey... whatever happens next...)"))

        pbCameraToEvent(uxieEvent.id)
        uxieEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Uxie", false, false)
        pbMessage(_INTL("\\tg[Uxie](Please remember; you hold emotion, wisdom, and will.)"))
        Mugshot.dispose

        pbCameraToEvent(azelfEvent.id)
        azelfEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Azelf", false, false)
        pbMessage(_INTL("\\tg[Azelf](And with those, you can do anything.)"))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)

        Mugshot.load("MespritSmile", false, false)
        pbMessage(_INTL("\\tg[Mesprit](So don't let anyone take that from you, okay?)"))
        Mugshot.load("Mesprit", false, false)
        pbMessage(_INTL("\\tg[Mesprit](Even if the truth hurts, even if it feels like everything you did was pointless...)"))
        Mugshot.dispose

        pbCameraToEvent(azelfEvent.id)
        azelfEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Azelf", false, false)
        pbMessage(_INTL("\\tg[Azelf](You kept going, even when none of it made sense. That says more than anything else.)"))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)

        Mugshot.load("Mesprit", false, false)
        pbMessage(_INTL("\\tg[Mesprit](So don't let anyone erase that. Don't let them tell you nothing matters.)"))
        Mugshot.load("MespritSmile", false, false)
        pbMessage(_INTL("\\tg[Mesprit](Keep moving forward... on your terms, this time.)"))
        Mugshot.dispose
    when :shopdialogue2
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]Hmm... your emotions are perfectly average. Nothing spicy."))
        Mugshot.load("MespritFunny")
        pbMessage(_INTL("\\tg[Mesprit]Unlike someone I know... the one who created the entire universe, our Master hardly ever shows any emotion."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]He's as expressive as those old Plates of his, buuut... He's not really emotionless, you see."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]The feelings are still there... It's just that they've just gone quiet over the millennia."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]At the moment, he's feeling a little sad."))
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]Ah, let me strengthen it for you so you can really feel it!"))
        Mugshot.dispose

        pbCameraToEvent(arcy.id)
        pbWait(0.6)

        Mugshot.load("MespritFunny")
        pbMessage(_INTL("\\tg[Mesprit]\"Ah, the human's chatting with the fairies instead of me, even though I was the one to arrange all this for them... So unfair... so unfair!\""))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)
        
        Mugshot.load("MespritYeah")
        pbMessage(_INTL("\\tg[Mesprit]Poor thing. You should wave at him later or something."))
        Mugshot.dispose
    end
    giveCandyItem
    echoln $PokemonGlobal.shopDialogue
    $PokemonGlobal.shopDialogue.delete(mesprit_dialogue)
    echoln $PokemonGlobal.shopDialogue
end

def uxieRespite
    azelfEvent = $game_map.events[2]
    mespritEvent = $game_map.events[8]
    uxieEvent = $game_map.events[9]
    illusion = $game_map.events[6]
    arcy = $game_map.events[1]

    uxie_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[1]

    case uxie_dialogue
    when :shopdialogue3
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Master has instructed us to adopt these illusionary forms in order to better communicate with you."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]In our realm, society is composed primarily of Pokémon."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]To facilitate understanding, and perhaps your comfort, we were asked to emulate your mannerisms."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie](...)"))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]...Though if I may be candid, I suspect this directive stemmed less from necessity and more from Master's... recreational whims."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Truly, our natural forms would have sufficed. We are quite capable of telepathy, after all."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Still, I must admit... the robes we now wear do flow nicely."))

        pbCameraToEvent(mespritEvent.id)
        mespritEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Heehee! You look adorable in those robes, Uxie!"))

        pbCameraToEvent(azelfEvent.id)
        azelfEvent.turn_toward_player
        pbWait(0.6)

        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]You only say that because we're all wearing the same clothes..."))
        Mugshot.dispose

        pbCameraReset
        pbWait(0.6)
    when :shopdialogue6
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]I can't erase entire memories, despite what people think. Knowledge should be shared, but some truths are best kept private."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]This world isn't always kind. In the wrong hands, knowledge becomes a weapon, and controlling it influences will."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]That's why I sometimes erase only dangerous memories, though I find that extreme. Usually, illusions do the trick to discourage."))
        Mugshot.load("Uxie")
        choice = pbMessage(_INTL("\\tg[Uxie]Illusions of formidable Pokémon often suffice."), [
        _INTL("Can you show me a very scary Pokémon?")
        ], -1)
        Mugshot.load("Uxie")
        choicePoke = pbMessage(_INTL("\\tg[Uxie]Certainly. Have a preference?"), [
        _INTL("Groudon..."),
        _INTL("Darkrai..."),
        _INTL("Giratina..."),
        _INTL("Enamorus...")
        ], -1)

        case choicePoke
        when 0
            species = :GROUDON
        when 1
            species = :DARKRAI
        when 2
            species = :GIRATINA
        when 3
            species = :ENAMORUS
        end

        fname = ow_sprite_filename(illusion.x, illusion.y, species.to_s)
        fname.gsub!("Graphics/Characters/","")
        illusion.character_name = fname
        $scene.spriteset.addUserAnimation(12, illusion.x, illusion.y - 1, true)
        pbCameraToEvent(illusion.id)
        if choicePoke == 2
            $scene.spriteset.addUserAnimation(3, arcy.x, arcy.y - 2, true)
            arcy.turn_left
            arcy.move_backward
            while arcy.moving?
                Graphics.update
                Input.update
                pbUpdateSceneMap
            end
        end
        pbWait(0.6)

        Mugshot.load("Uxie")
        choice = pbMessage(_INTL("\\tg[Uxie]There. Are you suitably unnerved?"), [
        _INTL("Yes, I am!")
        ], -1)
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]I see. Though I suspect your lack of fear stems from prior awareness..."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Expectation blunts the edge of surprise, after all."))
        Mugshot.dispose

        illusion.character_name = ""
        $scene.spriteset.addUserAnimation(12, illusion.x, illusion.y - 1, true)
        pbCameraReset

        if choicePoke == 2
            $scene.spriteset.addUserAnimation(8, arcy.x, arcy.y - 2, true)
            pbWait(0.6)
            arcy.move_left
            arcy.turn_down
            while arcy.moving?
                Graphics.update
                Input.update
                pbUpdateSceneMap
            end
        end

        pbWait(0.6)
    when :shopdialogue0
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Your knowledge is... adequate. Neither remarkable nor lacking."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Master, however, knows all. Every secret, every truth..."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Yet, he shares little. He views others as fragile playthings, destined to break."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Why waste precious wisdom on those who will inevitably falter?"))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]If Master chooses to reveal something to you, consider it a rare gift. It's an indication of your value in his eyes."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Use it well. Knowledge is only as powerful as it is shared."))
        Mugshot.dispose
    end
    giveCandyItem
    $PokemonGlobal.shopDialogue.delete(uxie_dialogue)
    echoln $PokemonGlobal.shopDialogue
end