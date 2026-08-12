TRAINER_0 = {
  :LEADER_Brock => [
    :ROCK,
    {
      :normal => {
        GEODUDE: { moves: [:TACKLE, :DEFENSECURL], nature: :HARDY },
        ONIX: { moves: [:TACKLE, :HARDEN, :BIND, :ROCKTOMB], nature: :HARDY }
      },
      :hard => {
        GEODUDE: { moves: [:ROCKTHROW, :DEFENSECURL, :TACKLE], nature: :ADAMANT, HP: 32, ATTACK: 32, DEFENSE: 4 },
        ONIX: { moves: [:ROCKTOMB, :HARDEN, :BIND], nature: :IMPISH, HP: 32, DEFENSE: 32, SPEED: 4 },
        LARVITAR: { moves: [:BITE, :ROCKTOMB, :SCARYFACE], nature: :JOLLY, HP: 32, ATTACK: 32, SPEED: 4 }
      },
      :unfair => {
        ONIX: { moves: [:ROCKTOMB, :HARDEN, :BIND, :SCREECH], nature: :IMPISH, HP: 32, DEFENSE: 32, SPEED: 4 },
        LARVITAR: { moves: [:BITE, :ROCKTOMB, :SCARYFACE, :SANDTOMB], nature: :JOLLY, HP: 32, ATTACK: 32, SPEED: 4 },
        ARON: { moves: [:IRONHEAD, :ROCKTOMB, :TAKEDOWN], nature: :ADAMANT, HP: 32, ATTACK: 32, DEFENSE: 4, item: :PASSHOBERRY }
      }
    }
  ],

  :LEADER_Falkner => [
    :FLYING,
    {
      :normal => {
        HOOTHOOT: { moves: [:PECK, :TACKLE], nature: :HARDY },
        PIDGEOTTO: { moves: [:TACKLE, :SANDATTACK, :GUST], nature: :HARDY }
      },
      :hard => {
        HOOTHOOT: { moves: [:PECK, :TACKLE, :ECHOEDVOICE], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        STARLY: { moves: [:TACKLE, :GROWL], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        PIDGEOTTO: { moves: [:GUST, :QUICKATTACK, :GUST, :AGILITY], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 } # replaced Air Cutter with Gust
      },
      :unfair => {
        HOOTHOOT: { moves: [:PECK, :TACKLE, :ECHOEDVOICE, :CONFUSION], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        STARLY: { moves: [:TACKLE, :GROWL, :WINGATTACK], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        PIDGEOTTO: { moves: [:WINGATTACK, :ROOST, :UTURN, :QUICKATTACK], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 } # added Quick Attack
      }
    }
  ],

  :LEADER_Roxanne => [
    :ROCK,
    {
      :normal => {
        GEODUDE: { moves: [:TACKLE, :DEFENSECURL, :ROCKTHROW, :ROCKTOMB], nature: :HARDY },
        NOSEPASS: { moves: [:BLOCK, :HARDEN, :TACKLE, :ROCKTOMB], nature: :HARDY } # removed Oran Berry
      },
      :hard => {
        ANORITH: { moves: [:FURYCUTTER, :WATERGUN, :HARDEN], nature: :ADAMANT, HP: 32, ATTACK: 32, DEFENSE: 4 },
        NOSEPASS: { moves: [:ROCKTOMB, :HARDEN, :BLOCK], nature: :IMPISH, HP: 32, DEFENSE: 32, SPEED: 4 },
        ARON: { moves: [:METALCLAW, :ROCKTOMB, :SCARYFACE], nature: :JOLLY, HP: 32, ATTACK: 32, SPEED: 4 }
      },
      :unfair => {
        NOSEPASS: { moves: [:BLOCK, :HARDEN, :ROCKTOMB, :SCREECH], nature: :IMPISH, HP: 32, DEFENSE: 32, SPEED: 4 },
        ARON: { moves: [:IRONHEAD, :ROCKTOMB, :TAKEDOWN], nature: :ADAMANT, HP: 32, ATTACK: 32, DEFENSE: 4 },
        ANORITH: { moves: [:XSCISSOR, :METALCLAW, :BRINE, :SMACKDOWN], nature: :ADAMANT, HP: 32, ATTACK: 32, DEFENSE: 4 } # updated move set
      }
    }
  ],

  :LEADER_Roark => [
    :ROCK,
    {
      :normal => {
        ONIX: { moves: [:ROCKTHROW, :SCREECH, :STEALTHROCK], nature: :HARDY },
        CRANIDOS: { moves: [:HEADBUTT, :PURSUIT, :LEER], nature: :HARDY }
      },
      :hard => {
        ONIX: { moves: [:ROCKTOMB, :STEALTHROCK, :SCREECH], nature: :IMPISH, HP: 32, DEFENSE: 32, SPEED: 4 },
        CRANIDOS: { moves: [:HEADBUTT, :PURSUIT, :LEER], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        BONSLY: { moves: [:FAKETEARS, :ROCKTHROW, :COPYCAT], nature: :HARDY, HP: 32, ATTACK: 32, DEFENSE: 4 }
      },
      :unfair => {
        ONIX: { moves: [:ROCKTOMB, :STEALTHROCK, :SCREECH, :BIND], nature: :IMPISH, HP: 32, DEFENSE: 32, SPEED: 4 },
        CRANIDOS: { moves: [:HEADBUTT, :PURSUIT, :LEER, :FOCUSENERGY], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        BONSLY: { moves: [:ROCKSLIDE, :FAKETEARS, :BRICKBREAK, :COVET], nature: :HARDY, HP: 32, ATTACK: 32, DEFENSE: 4 } # updated move set
      }
    }
  ],

  :LEADER_Cheren => [
    :NORMAL,
    {
      :normal => {
        PATRAT: { moves: [:TACKLE, :WORKUP, :BITE, :DETECT], nature: :HARDY },
        LILLIPUP: { moves: [:TACKLE, :WORKUP, :BITE, :HELPINGHAND], nature: :HARDY, item: :ORANBERRY }
      },
      :hard => {
        PATRAT: { moves: [:WORKUP, :BITE, :QUICKATTACK, :DETECT], nature: :ADAMANT, HP: 32, ATTACK: 32, SPEED: 4 },
        PIDOVE: { moves: [:QUICKATTACK, :AIRCUTTER, :WORKUP, :TAUNT], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        LILLIPUP: { moves: [:BITE, :WORKUP, :HELPINGHAND], nature: :JOLLY, HP: 32, ATTACK: 32, SPEED: 4 }
      },
      :unfair => {
        PIDOVE: { moves: [:AIRCUTTER, :ROOST, :TAILWIND, :DEFOG], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        PATRAT: { moves: [:WORKUP, :BITE, :QUICKATTACK, :DETECT], nature: :ADAMANT, HP: 32, ATTACK: 32, SPEED: 4 },
        LILLIPUP: { moves: [:BITE, :WORKUP, :HELPINGHAND, :COVET], nature: :JOLLY, HP: 32, ATTACK: 32, SPEED: 32 } # added Covet
      }
    }
  ],

  :LEADER_Cilan => [
    :GRASS,
    {
      :normal => {
        PETILIL: { moves: [:ABSORB, :AROMATHERAPY], nature: :HARDY },
        PANSAGE: { moves: [:VINEWHIP, :WORKUP], nature: :HARDY }
      },
      :hard => {
        PETILIL: { moves: [:ABSORB, :AROMATHERAPY, :STUNSPORE], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        BUDEW: { moves: [:ABSORB, :WORRYSEED], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        PANSAGE: { moves: [:RAZORLEAF, :WORKUP, :GROWL], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 } # replaced Leaf Blade with Razor Leaf
      },
      :unfair => {
        PETILIL: { moves: [:MEGADRAIN, :AROMATHERAPY, :LEECHSEED, :STUNSPORE], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 }, # updated moves
        BUDEW: { moves: [:ENERGYBALL, :ABSORB, :STUNSPORE, :VENOSHOCK], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 }, # updated moves
        PANSAGE: { moves: [:LEAFBLADE, :WORKUP, :GROWL], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 }
      }
    }
  ],

  :LEADER_Chili => [
    :FIRE,
    {
      :normal => {
        DARUMAKA: { moves: [:EMBER, :TACKLE], nature: :HARDY, ability: :INNERFOCUS },
        PANSAGE: { moves: [:VINEWHIP, :WORKUP], nature: :HARDY }
      },
      :hard => {
        PANSEAR: { moves: [:INCINERATE, :WORKUP, :SCARYFACE], nature: :MODEST, HP: 32, SPECIAL_ATTACK: 32, SPEED: 4 },
        DARUMAKA: { moves: [:EMBER, :TACKLE, :BITE], nature: :HARDY, ability: :INNERFOCUS, HP: 32, ATTACK: 32, SPEED: 4 },
        GROWLITHE: { moves: [:FLAMEWHEEL, :BITE, :LEER], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 }
      },
      :unfair => {
        PANSEAR: { moves: [:INCINERATE, :WORKUP, :SCARYFACE], nature: :MODEST, HP: 32, SPECIAL_ATTACK: 32, SPEED: 4 },
        GROWLITHE: { moves: [:FLAMEWHEEL, :BITE, :LEER, :HOWL], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32 },
        DARUMAKA: { moves: [:EMBER, :TACKLE, :BITE, :FIREFANG], nature: :HARDY, ability: :INNERFOCUS, HP: 32, ATTACK: 32, SPEED: 4 }
      }
    }
  ],

  :LEADER_Cress => [
    :WATER,
    {
      :normal => {
        TYMPOLE: { moves: [:ECHOEDVOICE, :GROWL], nature: :HARDY },
        PANPOUR: { moves: [:WATERGUN, :WORKUP], nature: :HARDY }
      },
      :hard => {
        PANPOUR: { moves: [:WATERPULSE, :FURYSWIPES, :WORKUP], nature: :MODEST, HP: 32, SPECIAL_ATTACK: 32, SPEED: 4 },
        TYMPOLE: { moves: [:ECHOEDVOICE, :GROWL, :BUBBLEBEAM], nature: :HARDY, HP: 32, SPECIAL_ATTACK: 32, SPEED: 4 },
        SLOWPOKE: { moves: [:TACKLE, :WATERGUN, :CONFUSION], nature: :RELAXED, HP: 32, DEFENSE: 32, SPECIAL_ATTACK: 4 }
      },
      :unfair => {
        PANPOUR: { moves: [:WATERPULSE, :BITE, :WORKUP], nature: :MODEST, HP: 32, SPECIAL_ATTACK: 32, SPEED: 4 },
        TYMPOLE: { moves: [:ECHOEDVOICE, :GROWL, :BUBBLEBEAM, :MUDSHOT], nature: :HARDY, HP: 32, SPECIAL_ATTACK: 32, SPEED: 4 },
        SLOWPOKE: { moves: [:SURF, :PSYBEAM, :YAWN, :TACKLE], nature: :RELAXED, HP: 32, DEFENSE: 32, SPECIAL_ATTACK: 4 } # updated move set
      }
    }
  ]
}

TRAINER_1 = {
  :LEADER_Misty => [
    :WATER,
    {
      :normal => {
        STARYU: { moves: [:TACKLE, :HARDEN, :RECOVER, :WATERPULSE], nature: :HARDY, ability: :NATURALCURE },
        STARMIE: { moves: [:RAPIDSPIN, :SWIFT, :RECOVER, :WATERPULSE], nature: :HARDY, ability: :NATURALCURE }
      },

      :hard => {
        STARYU: { moves: [:SURF, :RECOVER, :HARDEN, :PSYCHIC], nature: :TIMID, HP: 64, SPECIAL_ATTACK: 64, SPEED: 4, ability: :NATURALCURE },
        STARMIE: { moves: [:BUBBLEBEAM, :PSYBEAM, :RAPIDSPIN, :RECOVER], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 64, SPEED: 64, ability: :NATURALCURE },
        GOLDEEN: { moves: [:WATERPULSE, :HORNATTACK, :PECK], nature: :HARDY }
      },

      :unfair => {
        STARMIE: { moves: [:SURF, :PSYCHIC, :RAPIDSPIN, :THUNDERBOLT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 64, SPEED: 64, ability: :NATURALCURE, item: :WATERGEM },
        STARYU: { moves: [:SURF, :RECOVER, :HARDEN, :THUNDERWAVE], nature: :TIMID, HP: 64, SPECIAL_ATTACK: 64, SPEED: 4, ability: :NATURALCURE },
        GOLDEEN: { moves: [:WATERPULSE, :HORNATTACK, :PECK, :AGILITY], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 64, SPEED: 64 }
      }
    }
  ],

  :LEADER_Bugsy => [
    :BUG,
    {
      :normal => {
        SCYTHER: { moves: [:UTURN, :QUICKATTACK, :LEER, :FOCUSENERGY], nature: :HARDY, ability: :TECHNICIAN },
        SPINARAK: { moves: [:POISONSTING, :INFESTATION], nature: :HARDY }
      },

      :hard => {
        SCYTHER: { moves: [:UTURN, :AERIALACE, :ROOST, :STEELWING], nature: :JOLLY, HP: 4, ATTACK: 64, SPEED: 64, ability: :TECHNICIAN, item: :LEFTOVERS },
        BEEDRILL: { moves: [:VENOSHOCK, :ASSURANCE, :SWORDSDANCE, :AGILITY], nature: :JOLLY, HP: 4, ATTACK: 64, SPEED: 64, ability: :SWARM },
        SPINARAK: { moves: [:POISONSTING, :INFESTATION, :SHADOWSNEAK], nature: :HARDY }
      },

      :unfair => {
        SCYTHER: { moves: [:UTURN, :AERIALACE, :FURYCUTTER, :STEELWING], nature: :JOLLY, HP: 4, ATTACK: 64, SPEED: 64, ability: :TECHNICIAN, item: :SITRUSBERRY },
        SPINARAK: { moves: [:POISONSTING, :INFESTATION, :LEECHLIFE], nature: :HARDY, HP: 64, ATTACK: 64, SPEED: 4, },
        HERACROSS: { moves: [:PINMISSILE, :BRICKBREAK, :ENDURE, :ROCKTOMB], nature: :JOLLY, HP: 4, ATTACK: 64, SPEED: 64, ability: :GUTS }
      }
    }
  ],

  :LEADER_Brawly => [
    :FIGHTING,
    {
      :normal => {
        MACHOP: { moves: [:LEER, :KARATECHOP, :SEISMICTOSS], nature: :HARDY, ability: :GUTS },
        MAKUHITA: { moves: [:ARMTHRUST, :SANDATTACK, :BULKUP], nature: :HARDY, ability: :GUTS }
      },

      :hard => {
        MACHOP: { moves: [:LOWSWEEP, :BULKUP, :SEISMICTOSS, :ROCKTOMB], nature: :ADAMANT, HP: 64, ATTACK: 64, SPEED: 4, ability: :GUTS },
        MAKUHITA: { moves: [:DRAINPUNCH, :BULKUP, :KNOCKOFF, :FAKETEARS], nature: :ADAMANT, HP: 64, ATTACK: 64, SPEED: 4, ability: :GUTS },
        MEDITITE: { moves: [:PSYBEAM, :FORCEPALM, :POUND], nature: :HARDY }
      },

      :unfair => {
        MAKUHITA: { moves: [:DRAINPUNCH, :BULKUP, :KNOCKOFF, :COUNTER], nature: :ADAMANT, HP: 64, ATTACK: 64, SPEED: 4, ability: :GUTS },
        MEDITITE: { moves: [:ZENHEADBUTT, :BRICKBREAK, :FEINT, :DETECT], nature: :HARDY, ATTACK: 64, SPEED: 64, ability: :PUREPOWER },
        BRELOOM: { moves: [:MACHPUNCH, :TOXIC, :MEGADRAIN, :HEADBUTT], nature: :HARDY, HP: 64, ATTACK: 64, ability: :TECHNICIAN }
      }
    }
  ],

  :LEADER_Gardenia => [
    :GRASS,
    {
      :normal => {
        TURTWIG: { moves: [:GRASSKNOT, :RAZORLEAF, :SUNNYDAY, :REFLECT], nature: :HARDY, ability: :OVERGROW },
        CHERRIM: { moves: [:GRASSKNOT, :MAGICALLEAF, :LEECHSEED, :SAFEGUARD], nature: :HARDY, ability: :FLOWERGIFT }
      },

      :hard => {
        TURTWIG: { moves: [:RAZORLEAF, :SYNTHESIS, :SUNNYDAY], nature: :ADAMANT, HP: 64, ATTACK: 64, DEFENSE: 4, ability: :OVERGROW },
        CHERRIM: { moves: [:MAGICALLEAF, :LEECHSEED, :SAFEGUARD], nature: :MODEST, HP: 64, SPECIAL_ATTACK: 64, SPEED: 4, ability: :FLOWERGIFT },
        ROSERADE: { moves: [:MAGICALLEAF, :VENOSHOCK, :STUNSPORE, :TOXIC], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 64, SPEED: 64, ability: :NATURALCURE }
      },

      :unfair => {
        ROSERADE: { moves: [:SLUDGEBOMB, :ENERGYBALL, :STUNSPORE, :SLEEPPOWDER], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 64, SPEED: 64, ability: :NATURALCURE },
        CHERRIM: { moves: [:MAGICALLEAF, :LEECHSEED, :TOXIC], nature: :MODEST, HP: 64, SPECIAL_ATTACK: 64, SPEED: 4, ability: :FLOWERGIFT },
        GROTLE: { moves: [:LEAFBLADE, :EARTHQUAKE, :LEECHSEED, :SYNTHESIS], nature: :ADAMANT, HP: 64, ATTACK: 64, DEFENSE: 4, ability: :OVERGROW }
      }
    }
  ],

  :LEADER_Lenora => [
    :NORMAL,
    {
      :normal => {
        WATCHOG: { moves: [:LEER, :CRUNCH, :RETALIATE, :HYPNOSIS], nature: :HARDY, ability: :ILLUMINATE },
        MINCCINO: { moves: [:POUND, :CHARM], nature: :HARDY, ability: :CUTECHARM }
      },

      :hard => {
        WATCHOG: { moves: [:BITE, :RETALIATE, :HYPNOSIS, :TOXIC], nature: :ADAMANT, HP: 64, ATTACK: 64, SPEED: 4, ability: :ILLUMINATE },
        HERDIER: { moves: [:TAKEDOWN, :BITE, :RETALIATE, :LEER], nature: :JOLLY, HP: 4, ATTACK: 64, SPEED: 64, ability: :INTIMIDATE },
        MINCCINO: { moves: [:POUND, :CHARM, :SWIFT], nature: :HARDY, ability: :TECHNICIAN }
      },

      :unfair => {
        WATCHOG: { moves: [:BITE, :RETALIATE, :HYPNOSIS, :TOXIC], nature: :ADAMANT, HP: 64, ATTACK: 64, SPEED: 4, ability: :ILLUMINATE },
        HERDIER: { moves: [:TAKEDOWN, :BITE, :RETALIATE, :LEER], nature: :JOLLY, HP: 4, ATTACK: 64, SPEED: 64, ability: :INTIMIDATE, item: :NORMALGEM },
        MINCCINO: { moves: [:POUND, :CHARM, :TAILSLAP], nature: :HARDY, ability: :CUTECHARM }
      }
    }
  ]
}

TRAINER_2 = {
  :LEADER_Lt_Surge => [
    :ELECTRIC,
    {
      :normal => {
        VOLTORB: { moves: [:SHOCKWAVE, :TACKLE, :SCREECH, :SONICBOOM], nature: :HARDY, ability: :SOUNDPROOF },
        PIKACHU: { moves: [:SHOCKWAVE, :THUNDERWAVE, :QUICKATTACK, :DOUBLETEAM], nature: :HARDY, ability: :STATIC },
        RAICHU: { moves: [:SHOCKWAVE, :THUNDERWAVE, :QUICKATTACK, :DOUBLETEAM], nature: :HARDY, ability: :STATIC },
        ELEKID: { moves: [:THUNDERPUNCH, :LOWKICK, :LIGHTSCREEN], nature: :HARDY, ability: :VITALSPIRIT }
      },
      :hard => {
        VOLTORB: { moves: [:THUNDERBOLT, :ROLLOUT, :SCREECH, :SONICBOOM], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :SOUNDPROOF },
        PIKACHU: { moves: [:THUNDERBOLT, :THUNDERWAVE, :QUICKATTACK, :IRONTAIL], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :STATIC },
        RAICHU: { moves: [:THUNDERBOLT, :THUNDERWAVE, :QUICKATTACK, :NASTYPLOT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :STATIC },
        ELEKID: { moves: [:THUNDERPUNCH, :LOWKICK, :LIGHTSCREEN], nature: :HARDY, ability: :VITALSPIRIT }
      },
      :unfair => {
        RAICHU: { moves: [:THUNDERBOLT, :NASTYPLOT, :PSYCHIC], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :STATIC },
        PIKACHU: { moves: [:THUNDERBOLT, :VOLTTACKLE, :IRONTAIL, :NASTYPLOT], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :STATIC, item: :LIGHTBALL },
        ELECTRODE: { moves: [:THUNDERBOLT, :ROLLOUT, :SONICBOOM, :EXPLOSION], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :SOUNDPROOF, item: :LEFTOVERS },
        ELECTABUZZ: { moves: [:THUNDERBOLT, :BRICKBREAK, :LIGHTSCREEN], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :MAGNETPULL, item: :LEFTOVERS },
        PACHIRISU: { moves: [:DISCHARGE, :SUPERFANG, :NUZZLE, :CHARM], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32, ability: :VOLTABSORB } # added Pachirisu
      }
    }
  ],

  :LEADER_Whitney => [
    :NORMAL,
    {
      :normal => {
        CLEFAIRY: { moves: [:MIMIC, :ENCORE, :DOUBLESLAP, :METRONOME], nature: :HARDY, ability: :CUTECHARM },
        MILTANK: { moves: [:STOMP, :ROLLOUT, :ATTRACT, :MILKDRINK], nature: :HARDY, ability: :SCRAPPY },
        SKITTY: { moves: [:COVET, :FAKEOUT, :SING], nature: :HARDY, ability: :CUTECHARM }
      },
      :hard => {
        CLEFAIRY: { moves: [:MOONBLAST, :CALMMIND, :METRONOME, :SOFTBOILED], nature: :CALM, HP: 98, SPECIAL_DEFENSE: 98, SPEED: 4, ability: :CUTECHARM },
        MILTANK: { moves: [:BODYSLAM, :ROLLOUT, :ATTRACT, :MILKDRINK], nature: :ADAMANT, HP: 98, ATTACK: 98, SPEED: 4, ability: :SCRAPPY },
        SKITTY: { moves: [:COVET, :FAKEOUT, :PLAYROUGH, :DOUBLEEDGE], nature: :HARDY, HP: 4, ATTACK: 32, SPEED: 32, ability: :CUTECHARM }, # updated move set and EVs
        TEDDIURSA: { moves: [:THRASH, :PAYBACK, :CHARM, :FURYSWIPES], nature: :ADAMANT, HP: 98, ATTACK: 98, SPEED: 4, ability: :GUTS },
        AIPOM: { moves: [:FURYSWIPES, :KNOCKOFF, :SCREECH, :UTURN], nature: :JOLLY, ability: :SKILLLINK, item: :WIDELENS } # added Aipom
      },
      :unfair => {
        TEDDIURSA: { moves: [:THRASH, :PAYBACK, :CHARM, :FURYSWIPES], nature: :ADAMANT, HP: 98, ATTACK: 98, SPEED: 4, ability: :GUTS },
        MILTANK: { moves: [:BODYSLAM, :CURSE, :ROLLOUT, :MILKDRINK], nature: :ADAMANT, HP: 98, ATTACK: 98, SPEED: 4, ability: :SCRAPPY, item: :LUMBERRY },
        CLEFAIRY: { moves: [:MOONBLAST, :CALMMIND, :METRONOME, :SOFTBOILED], nature: :CALM, HP: 98, SPECIAL_DEFENSE: 98, SPEED: 4, ability: :CUTECHARM },
        DELCATTY: { moves: [:SUCKERPUNCH, :FAKEOUT, :PLAYROUGH, :METRONOME], nature: :HARDY, ATTACK: 32, SPEED: 32, ability: :CUTECHARM, item: :CHOPLEBERRY } # updated EVs and move
      }
    }
  ],

  :LEADER_Wattson => [
    :ELECTRIC,
    {
      :normal => {
        ELECTRIKE: { moves: [:SHOCKWAVE, :FLAMETHROWER, :ROAR], nature: :HARDY, ability: :STATIC },
        VOLTORB: { moves: [:ROLLOUT, :SPARK, :SONICBOOM, :SELFDESTRUCT], nature: :HARDY, ability: :SOUNDPROOF },
        MAGNETON: { moves: [:SHOCKWAVE, :SUPERSONIC, :SONICBOOM, :THUNDERWAVE], nature: :HARDY, ability: :MAGNETPULL }
      },
      :hard => {
        ELECTRIKE: { moves: [:SHOCKWAVE, :FLAMETHROWER, :ROAR], nature: :HARDY, ability: :STATIC },
        VOLTORB: { moves: [:THUNDERBOLT, :ROLLOUT, :SONICBOOM, :EXPLOSION], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :SOUNDPROOF },
        MAGNETON: { moves: [:THUNDERBOLT, :FLASHCANNON, :THUNDERWAVE, :TOXIC], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :MAGNETPULL },
        PLUSLE: { moves: [:DISCHARGE, :NASTYPLOT, :GRASSKNOT], nature: :JOLLY, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :PLUS }
      },
      :unfair => {
        ELECTRIKE: { moves: [:SHOCKWAVE, :FLAMETHROWER, :ROAR], nature: :HARDY, ability: :STATIC, item: :FOCUSSASH },
        PLUSLE: { moves: [:DISCHARGE, :NASTYPLOT, :GRASSKNOT], nature: :JOLLY, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :PLUS },
        MAGNETON: { moves: [:THUNDERBOLT, :FLASHCANNON, :THUNDERWAVE, :TOXIC], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :MAGNETPULL },
        MINUN: { moves: [:GRASSKNOT, :DISCHARGE, :NASTYPLOT, :VOLTSWITCH], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 98, SPEED: 98, ability: :PLUS },
        PAWMO: { moves: [:NUZZLE, :DIG, :BITE, :SPARK], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32, ability: :NATURALCURE } # added Pawmo
      }
    }
  ],

  :LEADER_Maylene => [
    :FIGHTING,
    {
      :normal => {
        CROAGUNK: { moves: [:REVENGE, :VENOSHOCK], nature: :HARDY, ability: :DRYSKIN },
        LUCARIO: { moves: [:DRAINPUNCH, :METALCLAW, :BONERUSH, :FORCEPALM], nature: :HARDY, ability: :STEADFAST },
        MONFERNO: { moves: [:FLAMEWHEEL, :POWERUPPUNCH, :FACADE], nature: :ADAMANT, ability: :BLAZE }
      },
      :hard => {
        MACHOKE: { moves: [:KARATECHOP, :STRENGTH, :FOCUSENERGY, :ROCKTOMB], nature: :HARDY, ability: :GUTS },
        CROAGUNK: { moves: [:REVENGE, :VENOSHOCK, :SUCKERPUNCH, :POISONJAB], nature: :HARDY, ability: :DRYSKIN },
        LUCARIO: { moves: [:CLOSECOMBAT, :METALCLAW, :BULLETPUNCH, :SWORDSDANCE], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :STEADFAST },
        MONFERNO: { moves: [:FLAMEWHEEL, :POWERUPPUNCH, :FACADE, :BLAZEKICK], nature: :ADAMANT, HP: 4, ATTACK: 98, SPEED: 98, ability: :BLAZE, item: :FIGHTINGGEM }
      },
      :unfair => {
        MACHAMP: { moves: [:KARATECHOP, :STRENGTH, :FOCUSENERGY, :ROCKTOMB], nature: :HARDY, HP: 64, ATTACK: 64, ability: :GUTS }, # added EVs
        CROAGUNK: { moves: [:REVENGE, :VENOSHOCK, :SUCKERPUNCH, :POISONJAB], nature: :HARDY, ATTACK: 64, SPEED: 64, ability: :DRYSKIN }, # added EVs
        LUCARIO: { moves: [:CLOSECOMBAT, :METALCLAW, :BULLETPUNCH, :SWORDSDANCE], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :STEADFAST },
        MONFERNO: { moves: [:FLAMEWHEEL, :POWERUPPUNCH, :FACADE, :BLAZEKICK], nature: :ADAMANT, HP: 4, ATTACK: 98, SPEED: 98, ability: :BLAZE, item: :FIGHTINGGEM },
        FARFETCHD_1: { moves: [:KNOCKOFF, :BRICKBREAK, :SWORDSDANCE, :LEAFBLADE], nature: :JOLLY, HP: 4, ATTACK: 32, SPEED: 32, ability: :SCRAPPY } # added G. Farfetched
      }
    }
  ],

  :LEADER_Burgh => [
    :BUG,
    {
      :normal => {
        DWEBBLE: { moves: [:ROCKPOLISH, :FEINTATTACK, :ROCKBLAST, :STRUGGLEBUG], nature: :HARDY, ability: :STURDY },
        KARRABLAST: { moves: [:ENDURE, :AERIALACE, :STRUGGLEBUG, :HEADBUTT], nature: :HARDY, ability: :SHEDSKIN },
        LEAVANNY: { moves: [:GRASSWHISTLE, :AERIALACE, :RAZORLEAF, :STRUGGLEBUG], nature: :HARDY, ability: :SWARM }
      },
      :hard => {
        DWEBBLE: { moves: [:ROCKPOLISH, :XSCISSOR, :ROCKBLAST, :STRUGGLEBUG], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :STURDY },
        ACCELGOR: { moves: [:ACID, :MEGADRAIN, :STRUGGLEBUG, :CURSE], nature: :CALM, HP: 98, SPECIAL_DEFENSE: 98, SPEED: 4, ability: :SHELLARMOR },
        KARRABLAST: { moves: [:XSCISSOR, :AERIALACE, :STRUGGLEBUG, :HEADBUTT], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :SHEDSKIN },
        LEAVANNY: { moves: [:LEECHSEED, :AERIALACE, :RAZORLEAF, :STRUGGLEBUG], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :SWARM }
      },
      :unfair => {
        DWEBBLE: { moves: [:ROCKPOLISH, :XSCISSOR, :ROCKBLAST, :STRUGGLEBUG], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :STURDY },
        ACCELGOR: { moves: [:ACID, :MEGADRAIN, :STRUGGLEBUG, :CURSE], nature: :CALM, HP: 98, SPECIAL_DEFENSE: 98, SPEED: 4, ability: :SHELLARMOR },
        KARRABLAST: { moves: [:XSCISSOR, :AERIALACE, :STRUGGLEBUG, :HEADBUTT], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :SHEDSKIN, item: :SITRUSBERRY },
        LEAVANNY: { moves: [:LEECHSEED, :XSCISSOR, :AERIALACE, :SWORDSDANCE], nature: :JOLLY, HP: 4, ATTACK: 98, SPEED: 98, ability: :SWARM, item: :LIFEORB },
        VIVILLON: { moves: [:SLEEPPOWDER, :BUGBUZZ, :DRAININGKISS, :PSYBEAM], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 32, SPEED: 32, ability: :COMPOUNDEYES } # added Vivillon
      }
    }
  ]
}

TRAINER_3 = {
  :LEADER_Erika => [
    :GRASS,
    {
      :normal => {
        JUMPLUFF: { moves: [:LEECHSEED, :UTURN, :GIGADRAIN, :SUNNYDAY], nature: :HARDY, ability: :CHLOROPHYLL },
        TANGELA: { moves: [:ANCIENTPOWER, :WRINGOUT, :GIGADRAIN, :SLEEPPOWDER], nature: :HARDY, ability: :CHLOROPHYLL },
        VICTREEBEL: { moves: [:SUNNYDAY, :GRASSKNOT, :LEAFSTORM, :RAZORLEAF], nature: :HARDY, ability: :CHLOROPHYLL }
      },
      :hard => {
        JUMPLUFF: { moves: [:LEECHSEED, :UTURN, :GIGADRAIN, :SUNNYDAY], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :CHLOROPHYLL, item: :HEATROCK },
        TANGROWTH: { moves: [:GIGADRAIN, :SLEEPPOWDER, :TOXIC, :WRINGOUT], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :CHLOROPHYLL, item: :SITRUSBERRY },
        VICTREEBEL: { moves: [:SOLARBEAM, :SLUDGEBOMB, :SLEEPPOWDER, :RAZORLEAF], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :CHLOROPHYLL, item: :GRASSGEM },
        BELLOSSOM: { moves: [:SOLARBEAM, :SYNTHESIS, :GIGADRAIN, :TOXIC], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :CHLOROPHYLL, item: :SITRUSBERRY }
      },
      :unfair => {
        JUMPLUFF: { moves: [:LEECHSEED, :UTURN, :GIGADRAIN, :SUNNYDAY], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :CHLOROPHYLL, item: :HEATROCK },
        VICTREEBEL: { moves: [:SOLARBEAM, :SLUDGEBOMB, :SLEEPPOWDER, :SYNTHESIS], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :CHLOROPHYLL, item: :GRASSGEM },
        BELLOSSOM: { moves: [:SOLARBEAM, :SYNTHESIS, :GIGADRAIN, :TOXIC], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :CHLOROPHYLL, item: :LEFTOVERS },
        TANGROWTH: { moves: [:GIGADRAIN, :SLEEPPOWDER, :TOXIC, :WRINGOUT], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :CHLOROPHYLL, item: :SITRUSBERRY },
        VENUSAUR: { moves: [:SYNTHESIS, :ENERGYBALL, :SLUDGEBOMB, :EARTHQUAKE, :SLEEPPOWDER], nature: :CALM, ability: :CHLOROPHYLL, item: :WIDELENS },
        EXEGGUTOR: { moves: [:GIGADRAIN, :PSYCHIC, :SYNTHESIS, :REST], nature: :CALM, ability: :HARVEST, item: :CHESTOBERRY }
      }
    }
  ],

  :LEADER_Morty => [
    :GHOST,
    {
      :normal => {
        MISDREAVUS: { moves: [:SHADOWBALL, :DAZZLINGGLEAM, :PERISHSONG, :CURSE], nature: :HARDY, ability: :LEVITATE },
        HAUNTER: { moves: [:HYPNOSIS, :DREAMEATER, :CURSE, :NIGHTMARE], nature: :HARDY, ability: :LEVITATE },
        GENGAR: { moves: [:HYPNOSIS, :SHADOWBALL, :MEANLOOK, :SUCKERPUNCH], nature: :HARDY, ability: :LEVITATE, item: :SITRUSBERRY }
      },
      :hard => {
        MISMAGIUS: { moves: [:SHADOWBALL, :DAZZLINGGLEAM, :PERISHSONG, :CURSE], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :LEVITATE },
        DUSCLOPS: { moves: [:PAINSPLIT, :WILLOWISP, :PROTECT, :NIGHTSHADE], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :FRISK, item: :EVIOLITE },
        GENGAR: { moves: [:SHADOWBALL, :FOCUSBLAST, :DESTINYBOND, :SLUDGEBOMB], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :LEVITATE, item: :BLACKSLUDGE },
        HAUNTER: { moves: [:CURSE, :MEANLOOK, :SUCKERPUNCH, :NIGHTSHADE], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :LEVITATE }
      },
      :unfair => {
        GENGAR: { moves: [:SHADOWBALL, :FOCUSBLAST, :DESTINYBOND, :SLUDGEBOMB], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :LEVITATE, item: :FOCUSSASH },
        MISMAGIUS: { moves: [:SHADOWBALL, :DAZZLINGGLEAM, :PERISHSONG, :CURSE], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :LEVITATE },
        DUSKNOIR: { moves: [:POLTERGEIST, :SUCKERPUNCH, :EARTHQUAKE, :SHADOWSNEAK], nature: :ADAMANT, HP: 124, ATTACK: 124, SPEED: 4, ability: :FRISK, item: :LEFTOVERS },
        DUSCLOPS: { moves: [:PAINSPLIT, :WILLOWISP, :PROTECT, :NIGHTSHADE], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :FRISK, item: :EVIOLITE },
        CHANDELURE: { moves: [:OVERHEAT, :SHADOWBALL, :FLAMETHROWER, :ENERGYBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :FLASHFIRE, item: :FIREGEM },
        FROSLASS: { moves: [:ICEBEAM, :SHADOWBALL, :DRAININGKISS, :THUNDERBOLT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :CUTECHARM, item: :CHOICESPECS }
      }
    }
  ],

  :LEADER_Flannery => [
    :FIRE,
    {
      :normal => {
        SLUGMA: { moves: [:OVERHEAT, :SMOG, :LIGHTSCREEN, :SUNNYDAY], nature: :HARDY, ability: :MAGMAARMOR },
        CAMERUPT: { moves: [:OVERHEAT, :TACKLE, :SUNNYDAY, :ATTRACT], nature: :HARDY, ability: :MAGMAARMOR },
        TORKOAL: { moves: [:OVERHEAT, :SUNNYDAY, :BODYSLAM, :ATTRACT], nature: :HARDY, ability: :WHITESMOKE, item: :WHITEHERB }
      },
      :hard => {
        CAMERUPT: { moves: [:OVERHEAT, :EARTHPOWER, :SUNNYDAY, :STEALTHROCK], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :MAGMAARMOR, item: :LEFTOVERS },
        MAGCARGO: { moves: [:OVERHEAT, :EARTHPOWER, :LIGHTSCREEN, :SUNNYDAY], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :MAGMAARMOR, item: :PASSHOBERRY },
        TORKOAL: { moves: [:LAVAPLUME, :SUNNYDAY, :BODYSLAM, :OVERHEAT], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :WHITESMOKE, item: :WHITEHERB },
        BLAZIKEN: { moves: [:PROTECT, :FLAREBLITZ, :CLOSECOMBAT, :EARTHQUAKE], nature: :ADAMANT, HP: 4, ATTACK: 124, SPEED: 124, ability: :BLAZE, item: :LIFEORB }
      },
      :unfair => {
        TORKOAL: { moves: [:LAVAPLUME, :SUNNYDAY, :BODYSLAM, :OVERHEAT], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :DROUGHT, item: :HEATROCK },
        CAMERUPT: { moves: [:OVERHEAT, :EARTHPOWER, :SUNNYDAY, :STEALTHROCK], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :MAGMAARMOR, item: :LEFTOVERS },
        MAGCARGO: { moves: [:OVERHEAT, :EARTHPOWER, :LIGHTSCREEN, :SUNNYDAY], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :MAGMAARMOR, item: :PASSHOBERRY },
        MAGMORTAR: { moves: [:FLAMETHROWER, :HIDDENPOWER, :FOCUSBLAST, :SCORCHINGSANDS], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :FLAMEBODY, item: :AIRBALLOON },
        HOUNDOOM: { moves: [:FLAMETHROWER, :DARKPULSE, :NASTYPLOT, :HIDDENPOWER], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :FLASHFIRE },
        BLAZIKEN: { moves: [:PROTECT, :FLAREBLITZ, :CLOSECOMBAT, :EARTHQUAKE], nature: :ADAMANT, HP: 4, ATTACK: 124, SPEED: 124, ability: :SPEEDBOOST, item: :LIFEORB }
      }
    }
  ],

  :LEADER_Wake => [
    :WATER,
    {
      :normal => {
        GYARADOS: { moves: [:BRINE, :WATERFALL, :BITE, :TWISTER], nature: :HARDY, ability: :INTIMIDATE },
        QUAGSIRE: { moves: [:WATERPULSE, :MUDSHOT, :ROCKTOMB, :YAWN], nature: :HARDY, ability: :DAMP },
        FLOATZEL: { moves: [:BRINE, :CRUNCH, :ICEFANG, :AQUAJET], nature: :HARDY, ability: :SWIFTSWIM, item: :SITRUSBERRY }
      },
      :hard => {
        PELIPPER: { moves: [:ROOST, :HURRICANE, :HYDROPUMP, :UTURN], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :DRIZZLE, item: :DAMPROCK },
        GYARADOS: { moves: [:WATERFALL, :CRUNCH, :DRAGONDANCE, :EARTHQUAKE], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :INTIMIDATE, item: :LUMBERRY },
        QUAGSIRE: { moves: [:SURF, :EARTHPOWER, :ROCKTOMB, :YAWN], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :DAMP, item: :LEFTOVERS },
        FLOATZEL: { moves: [:AQUAJET, :CRUNCH, :ICEFANG, :WATERFALL], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :SWIFTSWIM, item: :LIFEORB }
      },
      :unfair => {
        PELIPPER: { moves: [:ROOST, :HURRICANE, :HYDROPUMP, :UTURN], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :DRIZZLE, item: :DAMPROCK },
        GYARADOS: { moves: [:WATERFALL, :DRAGONDANCE, :EARTHQUAKE, :CRUNCH], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :INTIMIDATE, item: :LUMBERRY },
        FLOATZEL: { moves: [:AQUAJET, :CRUNCH, :ICEFANG, :WATERFALL], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :SWIFTSWIM, item: :LIFEORB },
        QUAGSIRE: { moves: [:SURF, :EARTHPOWER, :ROCKTOMB, :YAWN], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :DAMP, item: :LEFTOVERS },
        EMPOLEON: { moves: [:FLASHCANNON, :SURF, :ICEBEAM, :HIDDENPOWER], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :COMPETITIVE, item: :ASSAULTVEST },
        GASTRODON: { moves: [:RECOVER, :SURF, :EARTHPOWER, :RAINDANCE], nature: :CALM, HP: 124, SPECIAL_DEFENSE: 124, SPEED: 4, ability: :STORMDRAIN, item: :RINDOBERRY }
      }
    }
  ],

  :LEADER_Elesa => [
    :ELECTRIC,
    {
      :normal => {
        EMOLGA: { moves: [:QUICKATTACK, :PURSUIT, :AERIALACE, :VOLTSWITCH], nature: :HARDY, ability: :STATIC, item: :SITRUSBERRY },
        JOLTIK: { moves: [:THUNDERWAVE, :VOLTSWITCH, :ENERGYBALL, :XSCISSOR], nature: :HARDY, ability: :UNNERVE },
        ZEBSTRIKA: { moves: [:VOLTSWITCH, :PURSUIT, :FLAMECHARGE, :STOMP], nature: :HARDY, ability: :MOTORDRIVE, item: :SITRUSBERRY }
      },
      :hard => {
        EMOLGA: { moves: [:AERIALACE, :THUNDERBOLT, :VOLTSWITCH, :QUICKATTACK], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :STATIC, item: :LIFEORB },
        AMPHAROS: { moves: [:THUNDERWAVE, :THUNDERBOLT, :VOLTSWITCH, :CONFUSERAY], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :STATIC },
        GALVANTULA: { moves: [:THUNDERWAVE, :VOLTSWITCH, :ENERGYBALL, :BUGBUZZ], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :UNNERVE, item: :SITRUSBERRY },
        ZEBSTRIKA: { moves: [:THUNDERBOLT, :VOLTSWITCH, :BOUNCE, :WILDCHARGE], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :MOTORDRIVE, item: :LIFEORB }
      },
      :unfair => {
        EMOLGA: { moves: [:AERIALACE, :THUNDERBOLT, :VOLTSWITCH, :QUICKATTACK], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :STATIC, item: :LIFEORB },
        AMPHAROS: { moves: [:THUNDERWAVE, :THUNDERBOLT, :VOLTSWITCH, :CONFUSERAY], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :STATIC, item: :LIFEORB },
        GALVANTULA: { moves: [:THUNDERWAVE, :VOLTSWITCH, :ENERGYBALL, :BUGBUZZ], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :UNNERVE, item: :SITRUSBERRY },
        ZEBSTRIKA: { moves: [:THUNDERBOLT, :VOLTSWITCH, :BOUNCE, :WILDCHARGE], nature: :JOLLY, HP: 4, ATTACK: 124, SPEED: 124, ability: :MOTORDRIVE, item: :LIFEORB },
        EELEKTROSS: { moves: [:DISCHARGE, :FLAMETHROWER, :UTURN, :GRASSKNOT], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :LEVITATE, item: :ASSAULTVEST },
        STUNFISK: { moves: [:SURF, :DISCHARGE, :SLUDGEWAVE, :EARTHPOWER], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 124, SPEED: 124, ability: :STATIC, item: :CHOICESPECS }
      }
    }
  ]
}

TRAINER_4 = {
  :LEADER_Janine => [
    :POISON,
    {
      :normal => {
        WEEZING: { moves: [:TOXIC, :PROTECT, :SLUDGEBOMB, :EXPLOSION], nature: :HARDY },
        MUK: { moves: [:TOXIC, :PROTECT, :SLUDGEBOMB, :MOONBLAST], nature: :HARDY },
        GOLBAT: { moves: [:TOXIC, :PROTECT, :FLY, :LEECHLIFE], nature: :HARDY },
        VENOMOTH: { moves: [:SLUDGEBOMB, :PROTECT, :PSYCHIC, :BUGBUZZ], nature: :HARDY },
      },

      :hard => {
        WEEZING: { moves: [:TOXIC, :SLUDGEBOMB, :PROTECT, :FLAMETHROWER], nature: :CALM, HP: 160, SPECIAL_DEFENSE: 160, SPEED: 4, ability: :LEVITATE, item: :BLACKSLUDGE },
        MUK: { moves: [:VENOSHOCK, :TOXIC, :DARKPULSE, :CURSE], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :STENCH, item: :BLACKSLUDGE },
        GOLBAT: { moves: [:TOXIC, :BRAVEBIRD, :LEECHLIFE, :ROOST], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :INNERFOCUS, item: :SITRUSBERRY },
        VENOMOTH: { moves: [:BUGBUZZ, :SLUDGEBOMB, :QUIVERDANCE, :SLEEPPOWDER], nature: :MODEST, SPECIAL_ATTACK: 160, SPEED: 160, HP: 4, ability: :SYNCHRONIZE, item: :FOCUSSASH },
        BEEDRILL: { moves: [:POISONJAB, :FELLSTINGER, :UTURN, :DRILLRUN], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :SWARM, item: :BEEDRILLITE },
        POLIWRATH: { moves: [:HYPNOSIS, :SURF, :BRICKBREAK, :ICEPUNCH], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :WATERABSORB, item: :SITRUSBERRY }
      },

      :unfair => {
        WEEZING: { moves: [:TOXICSPIKES, :SLUDGEBOMB, :FLAMETHROWER, :TOXIC], nature: :CALM, HP: 160, SPECIAL_DEFENSE: 160, SPEED: 4, ability: :LEVITATE, item: :LEFTOVERS },
        TENTACRUEL: { moves: [:SURF, :SLUDGEWAVE, :HEX, :ICEBEAM], nature: :MODEST, HP: 160, SPECIAL_ATTACK: 160, SPEED: 4, ability: :CLEARBODY, item: :BLACKSLUDGE },
        VENOMOTH: { moves: [:BUGBUZZ, :SLUDGEBOMB, :QUIVERDANCE, :SLEEPPOWDER], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 160, SPEED: 160, ability: :SYNCHRONIZE, item: :WIDELENS },
        MUK_1: { moves: [:KNOCKOFF, :GUNKSHOT, :ACIDARMOR, :STONEEDGE], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :STENCH, item: :BLACKSLUDGE },
        CROBAT: { moves: [:BRAVEBIRD, :HAZE, :LEECHLIFE, :ROOST], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :INNERFOCUS, item: :SITRUSBERRY },
        BEEDRILL: { moves: [:POISONJAB, :FELLSTINGER, :UTURN, :DRILLRUN], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :SWARM, item: :BEEDRILLITE }
      }
    }
  ],

  :LEADER_Chuck => [
    :FIGHTING,
    {
      :normal => {
        PRIMEAPE: { moves: [:LEER, :DOUBLETEAM, :ROCKSLIDE, :FOCUSPUNCH], nature: :HARDY, ability: :VITALSPIRIT },
        POLIWRATH: { moves: [:HYPNOSIS, :BODYSLAM, :SURF, :FOCUSPUNCH], nature: :HARDY, ability: :WATERABSORB, item: :SITRUSBERRY },
        HITMONTOP: { moves: [:BRICKBREAK, :FAKEOUT, :SUCKERPUNCH], nature: :ADAMANT, ability: :INTIMIDATE },
        MEDICHAM: { moves: [:BRICKBREAK, :STRENGTH, :ZENHEADBUTT], nature: :JOLLY, ability: :PUREPOWER }
      },

      :hard => {
        PRIMEAPE: { moves: [:CLOSECOMBAT, :STRENGTH, :ROCKSLIDE, :FOCUSPUNCH], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :VITALSPIRIT, item: :LIFEORB },
        POLIWRATH: { moves: [:HYPNOSIS, :SURF, :BRICKBREAK, :ICEPUNCH], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :WATERABSORB, item: :SITRUSBERRY },
        HITMONTOP: { moves: [:BRICKBREAK, :FAKEOUT, :SUCKERPUNCH, :CLOSECOMBAT], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :INTIMIDATE, item: :SITRUSBERRY },
        LOPUNNY: { moves: [:TRIPLEAXEL, :CLOSECOMBAT, :UTURN, :RETURN], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :CUTECHARM, item: :LOPUNNITE },
        PANGORO: { moves: [:THUNDERPUNCH, :CRUNCH, :HAMMERARM, :DRAINPUNCH], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :IRONFIST }
      },

      :unfair => {
        PRIMEAPE: { moves: [:CLOSECOMBAT, :STRENGTH, :FOCUSPUNCH, :ROCKSLIDE], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :VITALSPIRIT, item: :LIFEORB },
        POLIWRATH: { moves: [:HYPNOSIS, :SURF, :BRICKBREAK, :ICEPUNCH], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :WATERABSORB, item: :WIDELENS },
        HITMONTOP: { moves: [:BRICKBREAK, :FAKEOUT, :SUCKERPUNCH, :CLOSECOMBAT], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :INTIMIDATE, item: :SITRUSBERRY },
        LOPUNNY: { moves: [:TRIPLEAXEL, :CLOSECOMBAT, :UTURN, :RETURN], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :CUTECHARM, item: :LOPUNNITE },
        PANGORO: { moves: [:THUNDERPUNCH, :CRUNCH, :HAMMERARM, :DRAINPUNCH], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :IRONFIST, item: :ASSAULTVEST },
        HITMONCHAN: { moves: [:MEGAPUNCH, :FIREPUNCH, :ICEPUNCH, :DRAINPUNCH], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :IRONFIST, item: :FOCUSSASH }
      }
    }
  ],

  :LEADER_Norman => [
    :NORMAL,
    {
      :normal => {
        SPINDA: { moves: [:TEETERDANCE, :PSYBEAM, :FACADE, :ENCORE], nature: :HARDY, ability: :OWNTEMPO },
        VIGOROTH: { moves: [:SLASH, :FACADE, :ENCORE, :FEINTATTACK], nature: :HARDY, ability: :VITALSPIRIT },
        LINOONE: { moves: [:SLASH, :BELLYDRUM, :FACADE, :HEADBUTT], nature: :HARDY, ability: :PICKUP },
        SLAKING: { moves: [:COUNTER, :YAWN, :FACADE, :FEINTATTACK], nature: :HARDY, ability: :TRUANT, item: :SITRUSBERRY }
      },

      :hard => {
        SPINDA: { moves: [:TEETERDANCE, :PSYBEAM, :FACADE, :ENCORE], nature: :JOLLY, SPEED: 160, ATTACK: 160, HP: 4, ability: :OWNTEMPO },
        VIGOROTH: { moves: [:RETURN, :FACADE, :ENCORE, :SUCKERPUNCH], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :VITALSPIRIT, item: :EVIOLITE },
        LINOONE: { moves: [:RETURN, :BELLYDRUM, :FACADE, :HEADBUTT], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :PICKUP, item: :SITRUSBERRY },
        SLAKING: { moves: [:COUNTER, :YAWN, :FACADE, :SUCKERPUNCH], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :TRUANT, item: :SITRUSBERRY },
        KANGASKHAN: { moves: [:POWERUPPUNCH, :SUCKERPUNCH, :RETURN, :DRAINPUNCH], nature: :ADAMANT, ATTACK: 160, SPEED: 160, HP: 4, ability: :SCRAPPY, item: :KANGASKHANITE }
      },

      :unfair => {
        KANGASKHAN: { moves: [:POWERUPPUNCH, :SUCKERPUNCH, :RETURN, :DRAINPUNCH], nature: :ADAMANT, ATTACK: 160, SPEED: 160, HP: 4, ability: :SCRAPPY, item: :KANGASKHANITE },
        SPINDA: { moves: [:TEETERDANCE, :PSYCHIC, :FACADE, :ENCORE], nature: :JOLLY, SPEED: 252, ATTACK: 252, HP: 4, ability: :OWNTEMPO, item: :FOCUSSASH },
        VIGOROTH: { moves: [:RETURN, :FACADE, :ENCORE, :SUCKERPUNCH], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :VITALSPIRIT, item: :EVIOLITE },
        LINOONE: { moves: [:RETURN, :BELLYDRUM, :FACADE, :SHADOWCLAW], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :PICKUP, item: :SITRUSBERRY },
        SLAKING: { moves: [:COUNTER, :YAWN, :FACADE, :SUCKERPUNCH], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :TRUANT, item: :FOCUSSASH },
        EXPLOUD: { moves: [:BOOMBURST, :FIREBLAST, :FOCUSBLAST, :BLIZZARD], nature: :MODEST, HP: 160, SPECIAL_ATTACK: 160, SPEED: 4, ability: :SCRAPPY, item: :WIDELENS },
      }
    }
  ],

  :LEADER_Fantina => [
    :GHOST,
    {
      :normal => {
        DRIFBLIM: { moves: [:OMINOUSWIND, :GUST, :ASTONISH, :MINIMIZE], nature: :HARDY, ability: :AFTERMATH },
        GENGAR: { moves: [:SHADOWCLAW, :POISONJAB, :CONFUSERAY, :SPITE], nature: :HARDY, ability: :LEVITATE },
        MISMAGIUS: { moves: [:SHADOWBALL, :PSYBEAM, :MAGICALLEAF, :CONFUSERAY], nature: :HARDY, ability: :LEVITATE, item: :SITRUSBERRY },
        DUSKNOIR: { moves: [:SHADOWBALL, :SUCKERPUNCH, :EARTHQUAKE, :SHADOWSNEAK], nature: :ADAMANT }
      },

      :hard => {
        DRIFBLIM: { moves: [:SHADOWBALL, :GUST, :MINIMIZE, :THUNDERBOLT], nature: :CALM, HP: 160, SPECIAL_DEFENSE: 160, SPEED: 4, ability: :AFTERMATH, item: :LEFTOVERS },
        MISMAGIUS: { moves: [:SHADOWBALL, :PSYCHIC, :DARKPULSE, :CONFUSERAY], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 160, SPEED: 160, ability: :LEVITATE, item: :SITRUSBERRY },
        BANETTE: { moves: [:WILLOWISP, :KNOCKOFF, :PHANTOMFORCE, :GUNKSHOT], nature: :ADAMANT, ATTACK: 160, SPEED: 160, HP: 4, ability: :INSOMNIA, item: :BANETTITE },
        DUSKNOIR: { moves: [:POLTERGEIST, :SUCKERPUNCH, :EARTHQUAKE, :SHADOWSNEAK], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4 },
        FROSLASS: { moves: [:ICEBEAM, :SHADOWBALL, :DRAININGKISS, :THUNDERBOLT], nature: :TIMID, SPECIAL_ATTACK: 160, SPEED: 160, HP: 4, item: :LIFEORB }
      },

      :unfair => {
        DRIFBLIM: { moves: [:SHADOWBALL, :AIRCUTTER, :MINIMIZE, :THUNDERBOLT], nature: :CALM, HP: 160, SPECIAL_DEFENSE: 160, SPEED: 4, ability: :AFTERMATH, item: :LEFTOVERS },
        GENGAR: { moves: [:SHADOWBALL, :FOCUSBLAST, :SLUDGEBOMB, :SPITE], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 160, SPEED: 160, ability: :LEVITATE, item: :BLACKSLUDGE },
        MISMAGIUS: { moves: [:SHADOWBALL, :PSYCHIC, :DARKPULSE, :WILLOWISP], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 160, SPEED: 160, ability: :LEVITATE, item: :LEFTOVERS },
        BANETTE: { moves: [:WILLOWISP, :KNOCKOFF, :PHANTOMFORCE, :GUNKSHOT], nature: :ADAMANT, ATTACK: 160, SPEED: 160, HP: 4, ability: :INSOMNIA, item: :BANETTITE },
        FROSLASS: { moves: [:ICEBEAM, :SHADOWBALL, :DRAININGKISS, :THUNDERBOLT], nature: :TIMID, SPECIAL_ATTACK: 160, SPEED: 160, HP: 4, item: :LIFEORB },
        DUSKNOIR: { moves: [:POLTERGEIST, :SUCKERPUNCH, :EARTHQUAKE, :SHADOWSNEAK], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, item: :LEFTOVERS }
      }
    }
  ],

  :LEADER_Clay => [
    :GROUND,
    {
      :normal => {
        KROKOROK: { moves: [:CRUNCH, :SANDSTORM, :TORMENT, :BULLDOZE], nature: :HARDY, ability: :INTIMIDATE, item: :SITRUSBERRY },
        SANDSLASH: { moves: [:BULLDOZE, :CRUSHCLAW, :HONECLAWS, :ROCKSLIDE], nature: :HARDY, ability: :SANDVEIL },
        ONIX: { moves: [:EXPLOSION, :BULLDOZE, :ROCKPOLISH, :ROCKSLIDE], nature: :HARDY, ability: :STURDY },
        EXCADRILL: { moves: [:SLASH, :BULLDOZE, :METALCLAW, :ROCKSLIDE], nature: :HARDY, ability: :SANDFORCE, item: :SITRUSBERRY }
      },

      :hard => {
        SWAMPERT: { moves: [:WATERFALL, :SUPERPOWER, :STONEEDGE, :EARTHQUAKE], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :TORRENT, item: :SWAMPERTITE },
        EXCADRILL: { moves: [:IRONHEAD, :EARTHQUAKE, :SWORDSDANCE, :ROCKSLIDE], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :SANDFORCE, item: :SITRUSBERRY },
        STEELIX: { moves: [:EXPLOSION, :BULLDOZE, :ROCKPOLISH, :ROCKSLIDE], nature: :IMPISH, HP: 160, DEFENSE: 160, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        SANDSLASH: { moves: [:EARTHQUAKE, :XSCISSOR, :ROCKSLIDE, :POISONJAB], nature: :JOLLY, ATTACK: 160, SPEED: 160, ability: :SANDVEIL, item: :LEFTOVERS },
        KROOKODILE: { moves: [:CRUNCH, :EARTHQUAKE, :AQUATAIL, :DRAGONCLAW], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :INTIMIDATE, item: :EXPERTBELT }
      },

      :unfair => {
        SWAMPERT: { moves: [:WATERFALL, :SUPERPOWER, :STONEEDGE, :EARTHQUAKE], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :TORRENT, item: :SWAMPERTITE },
        EXCADRILL: { moves: [:IRONHEAD, :EARTHQUAKE, :SWORDSDANCE, :ROCKSLIDE], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :SANDFORCE, item: :LIFEORB },
        STEELIX: { moves: [:EXPLOSION, :BULLDOZE, :ROCKPOLISH, :ROCKSLIDE], nature: :IMPISH, HP: 160, DEFENSE: 160, SPEED: 4, ability: :STURDY, item: :FOCUSSASH },
        SANDSLASH: { moves: [:EARTHQUAKE, :XSCISSOR, :ROCKSLIDE, :POISONJAB], nature: :JOLLY, ATTACK: 160, SPEED: 160, ability: :SANDVEIL, item: :LEFTOVERS },
        KROOKODILE: { moves: [:CRUNCH, :EARTHQUAKE, :AQUATAIL, :DRAGONCLAW], nature: :JOLLY, ATTACK: 160, SPEED: 160, HP: 4, ability: :INTIMIDATE, item: :EXPERTBELT },
        GOLURK: { moves: [:EARTHQUAKE, :PHANTOMFORCE, :DYNAMICPUNCH, :MEGAKICK], nature: :ADAMANT, HP: 160, ATTACK: 160, SPEED: 4, ability: :NOGUARD, item: :ASSAULTVEST }
      }
    }
  ]
}

TRAINER_5 = {
  :LEADER_Sabrina => [
    :PSYCHIC,
    {
      normal: {
        ESPEON: { moves: [:CALMMIND, :SHADOWBALL, :PSYCHIC, :SKILLSWAP], nature: :HARDY, ability: :SYNCHRONIZE },
        MRMIME: { moves: [:MIMIC, :LIGHTSCREEN, :PSYCHIC, :SKILLSWAP], nature: :HARDY, ability: :FILTER },
        ALAKAZAM: { moves: [:PSYCHIC, :SKILLSWAP, :REFLECT, :ENERGYBALL], nature: :HARDY, ability: :INNERFOCUS, item: :SITRUSBERRY },
        JYNX: { moves: [:PSYCHIC, :ICEBEAM, :SHADOWBALL, :LOVELYKISS], nature: :MODEST, ability: :OBLIVIOUS }
      },
      hard: {
        ESPEON: { moves: [:CALMMIND, :SHADOWBALL, :PSYCHIC, :DAZZLINGGLEAM], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :SYNCHRONIZE, item: :LEFTOVERS },
        MRMIME: { moves: [:MIMIC, :LIGHTSCREEN, :PSYCHIC, :THUNDERWAVE], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :FILTER, item: :SITRUSBERRY },
        ALAKAZAM: { moves: [:PSYCHIC, :FOCUSBLAST, :REFLECT, :ENERGYBALL], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :INNERFOCUS, item: :FOCUSSASH },
        JYNX: { moves: [:PSYCHIC, :ICEBEAM, :SHADOWBALL, :LOVELYKISS], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :OBLIVIOUS, item: :EXPERTBELT },
        SLOWKING: { moves: [:SLACKOFF, :SURF, :PSYCHIC, :YAWN], nature: :CALM, HP: 196, DEFENSE: 196, SPECIAL_DEFENSE: 4, ability: :REGENERATOR, item: :LEFTOVERS }
      },
      unfair: {
        ESPEON: { moves: [:CALMMIND, :SHADOWBALL, :PSYCHIC, :DAZZLINGGLEAM], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :SYNCHRONIZE, item: :FOCUSSASH },
        MRMIME: { moves: [:REFLECT, :LIGHTSCREEN, :PSYCHIC, :THUNDERWAVE], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :FILTER, item: :LIGHTCLAY },
        ALAKAZAM: { moves: [:PSYCHIC, :FOCUSBLAST, :REFLECT, :ENERGYBALL], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :INNERFOCUS, item: :ALAKAZITE },
        JYNX: { moves: [:PSYCHIC, :ICEBEAM, :SHADOWBALL, :LOVELYKISS], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :OBLIVIOUS, item: :EXPERTBELT },
        SLOWKING: { moves: [:SLACKOFF, :SURF, :PSYCHIC, :YAWN], nature: :CALM, HP: 196, DEFENSE: 196, SPECIAL_DEFENSE: 4, ability: :REGENERATOR, item: :LEFTOVERS },
        ESPATHRA: { moves: [:PROTECT, :STOREDPOWER, :CALMMIND, :DAZZLINGGLEAM], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :SPEEDBOOST }
      }
    }
  ],

  :LEADER_Winona => [
    :FLYING,
    {
      normal: {
        TROPIUS: { moves: [:SYNTHESIS, :SEEDBOMB, :AERIALACE, :DRAGONDANCE], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :HARVEST, item: :SITRUSBERRY },
        PELIPPER: { moves: [:ROOST, :AERIALACE, :SURF, :PROTECT], nature: :BOLD, HP: 196, DEFENSE: 196, SPEED: 4, ability: :KEENEYE, item: :SITRUSBERRY },
        SKARMORY: { moves: [:IRONHEAD, :SPIKES, :STEALTHROCK, :DUALWINGBEAT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :KEENEYE, item: :LEFTOVERS },
        ALTARIA: { moves: [:DRAGONDANCE, :DRAGONCLAW, :RETURN, :ROOST], nature: :JOLLY, ATTACK: 196, SPEED: 196, HP: 4, ability: :NATURALCURE, item: :ALTARIANITE }
      },
      hard: {
        TROPIUS: { moves: [:SYNTHESIS, :SEEDBOMB, :AERIALACE, :DRAGONDANCE], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :HARVEST, item: :SITRUSBERRY },
        PELIPPER: { moves: [:ROOST, :SURF, :PROTECT, :AERIALACE], nature: :BOLD, HP: 196, DEFENSE: 196, SPEED: 4, ability: :KEENEYE, item: :SITRUSBERRY },
        SKARMORY: { moves: [:IRONHEAD, :SPIKES, :STEALTHROCK, :DUALWINGBEAT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :KEENEYE, item: :LEFTOVERS },
        ALTARIA: { moves: [:DRAGONDANCE, :DRAGONCLAW, :RETURN, :ROOST], nature: :JOLLY, ATTACK: 196, SPEED: 196, HP: 4, ability: :NATURALCURE, item: :ALTARIANITE },
        SWELLOW: { moves: [:BOOMBURST, :UTURN], nature: :TIMID, SPECIAL_ATTACK: 196, SPEED: 196, ability: :SCRAPPY, item: :CHOICESPECS }
      },
      unfair: {
        TROPIUS: { moves: [:SYNTHESIS, :SEEDBOMB, :AERIALACE, :DRAGONDANCE], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :HARVEST, item: :SITRUSBERRY },
        PELIPPER: { moves: [:ROOST, :SURF, :PROTECT, :AERIALACE], nature: :BOLD, HP: 196, DEFENSE: 196, SPEED: 4, ability: :KEENEYE, item: :FOCUSSASH },
        SKARMORY: { moves: [:IRONHEAD, :SPIKES, :STEALTHROCK, :DUALWINGBEAT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :KEENEYE, item: :LEFTOVERS },
        ALTARIA: { moves: [:DRAGONDANCE, :DRAGONCLAW, :RETURN, :ROOST], nature: :JOLLY, ATTACK: 196, SPEED: 196, HP: 4, ability: :NATURALCURE, item: :ALTARIANITE },
        SWELLOW: { moves: [:BOOMBURST, :UTURN], nature: :TIMID, SPECIAL_ATTACK: 196, SPEED: 196, ability: :SCRAPPY, item: :CHOICESPECS },
        FLAMIGO: { moves: [:BRAVEBIRD, :CLOSECOMBAT, :THROATCHOP, :UTURN], nature: :ADAMANT, ATTACK: 196, SPEED: 196, ability: :SCRAPPY, item: :LIFEORB }
      }
    }
  ],

  :LEADER_Jasmine => [
    :STEEL,
    {
      normal: {
        MAGNEZONE: { moves: [:THUNDERBOLT, :FLASHCANNON, :VOLTSWITCH, :THUNDERWAVE], nature: :CALM, HP: 196, SPECIAL_DEFENSE: 196, SPEED: 4, ability: :MAGNETPULL, item: :LEFTOVERS },
        KLINKLANG: { moves: [:GEARGRIND, :SHIFTGEAR, :THUNDERBOLT, :THUNDERWAVE], nature: :ADAMANT, ATTACK: 196, SPEED: 196, ability: :PLUS },
        FORRETRESS: { moves: [:SPIKES, :EXPLOSION], nature: :RELAXED, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY }
      },
      hard: {
        MAGNEZONE: { moves: [:THUNDERBOLT, :FLASHCANNON, :VOLTSWITCH, :THUNDERWAVE], nature: :CALM, HP: 196, SPECIAL_DEFENSE: 196, SPEED: 4, ability: :MAGNETPULL, item: :LEFTOVERS },
        KLINKLANG: { moves: [:GEARGRIND, :SHIFTGEAR, :THUNDERBOLT, :THUNDERWAVE], nature: :ADAMANT, ATTACK: 196, SPEED: 196, ability: :PLUS },
        FORRETRESS: { moves: [:SPIKES, :EXPLOSION], nature: :RELAXED, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY },
        TINKATON: { moves: [:GIGATONHAMMER, :STEALTHROCK, :THUNDERWAVE, :PLAYROUGH], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :MOLDBREAKER, item: :AIRBALLOON },
        STEELIX: { moves: [:IRONTAIL, :ROCKSLIDE, :EARTHQUAKE, :SCREECH], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :STEELIXITE }
      },
      unfair: {
        FORRETRESS: { moves: [:SPIKES, :EXPLOSION], nature: :RELAXED, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY },
        MAGNEZONE: { moves: [:THUNDERBOLT, :FLASHCANNON, :VOLTSWITCH, :THUNDERWAVE], nature: :CALM, HP: 196, SPECIAL_DEFENSE: 196, SPEED: 4, ability: :MAGNETPULL, item: :LEFTOVERS },
        KLINKLANG: { moves: [:GEARGRIND, :SHIFTGEAR, :THUNDERBOLT, :THUNDERWAVE], nature: :ADAMANT, ATTACK: 196, SPEED: 196, ability: :PLUS },
        TINKATON: { moves: [:GIGATONHAMMER, :STEALTHROCK, :THUNDERWAVE, :PLAYROUGH], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :MOLDBREAKER, item: :AIRBALLOON },
        CORVIKNIGHT: { moves: [:IRONDEFENSE, :IRONHEAD, :ROOST, :BODYPRESS], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :MIRRORARMOR, item: :LEFTOVERS },
        STEELIX: { moves: [:IRONTAIL, :ROCKSLIDE, :EARTHQUAKE, :SCREECH], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :STEELIXITE }
      }
    }
  ],

  :LEADER_Byron => [
    :STEEL,
    {
      normal: {
        MAGNETON: { moves: [:FLASHCANNON, :THUNDERBOLT, :TRIATTACK, :METALSOUND], nature: :CALM, HP: 196, SPECIAL_DEFENSE: 196, SPEED: 4, ability: :MAGNETPULL },
        STEELIX: { moves: [:IRONHEAD, :EARTHQUAKE, :STONEEDGE, :ROCKSLIDE], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :ROCKHEAD, item: :SITRUSBERRY },
        BASTIODON: { moves: [:BODYPRESS, :STONEEDGE, :IRONDEFENSE, :TAUNT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        AGGRON: { moves: [:IRONHEAD, :ROCKSLIDE, :SUPERPOWER, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 196, DEFENSE: 196, ability: :ROCKHEAD, item: :AGGRONITE },
        EMPOLEON: { moves: [:FLASHCANNON, :SURF, :ICEBEAM, :HIDDENPOWER], nature: :MODEST, HP: 196, SPECIAL_ATTACK: 196, SPEED: 4, ability: :COMPETITIVE, item: :ASSAULTVEST }
      },
      hard: {
        TOGEDEMARU: { moves: [:WILDCHARGE, :IRONHEAD, :UTURN, :ZENHEADBUTT], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :IRONBARBS, item: :ASSAULTVEST },
        STEELIX: { moves: [:IRONHEAD, :EARTHQUAKE, :STONEEDGE, :ROCKSLIDE], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :ROCKHEAD, item: :SITRUSBERRY },
        BASTIODON: { moves: [:BODYPRESS, :STONEEDGE, :IRONDEFENSE, :TAUNT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        AGGRON: { moves: [:IRONHEAD, :ROCKSLIDE, :SUPERPOWER, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 196, DEFENSE: 196, ability: :ROCKHEAD, item: :AGGRONITE },
        EMPOLEON: { moves: [:FLASHCANNON, :SURF, :ICEBEAM, :HIDDENPOWER], nature: :MODEST, HP: 196, SPECIAL_ATTACK: 196, SPEED: 4, ability: :COMPETITIVE, item: :ASSAULTVEST }
      },
      unfair: {
        REVAVROOM: { moves: [:IRONHEAD, :POISONJAB, :HIGHHORSEPOWER, :TAUNT], nature: :ADAMANT, ATTACK: 196, SPEED: 196, ability: :FILTER, item: :LIFEORB },
        TOGEDEMARU: { moves: [:WILDCHARGE, :IRONHEAD, :UTURN, :ZENHEADBUTT], nature: :JOLLY, ATTACK: 196, SPEED: 196, ability: :IRONBARBS, item: :ASSAULTVEST },
        STEELIX: { moves: [:IRONHEAD, :EARTHQUAKE, :STONEEDGE, :ROCKSLIDE], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :ROCKHEAD, item: :SITRUSBERRY },
        BASTIODON: { moves: [:BODYPRESS, :STONEEDGE, :IRONDEFENSE, :TAUNT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        AGGRON: { moves: [:IRONHEAD, :ROCKSLIDE, :SUPERPOWER, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 196, DEFENSE: 196, ability: :ROCKHEAD, item: :AGGRONITE },
        EMPOLEON: { moves: [:FLASHCANNON, :SURF, :ICEBEAM, :HIDDENPOWER], nature: :MODEST, HP: 196, SPECIAL_ATTACK: 196, SPEED: 4, ability: :COMPETITIVE, item: :ASSAULTVEST }
      }
    }
  ],

  :LEADER_Skyla => [
    :FLYING,
    {
      normal: {
        SWOOBAT: { moves: [:PSYCHIC, :AIRSLASH, :ENERGYBALL, :ATTRACT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :UNAWARE },
        SKARMORY: { moves: [:IRONHEAD, :SPIKES, :STEALTHROCK, :DUALWINGBEAT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        SIGILYPH: { moves: [:PSYCHIC, :HYPNOSIS, :AIRCUTTER, :ENERGYBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :MAGICGUARD },
        BRAVIARY: { moves: [:BRAVEBIRD, :RETURN, :SHADOWCLAW, :STEELWING], nature: :HARDY, ATTACK: 196, SPEED: 196, HP: 4, ability: :DEFIANT, item: :LIFEORB }
      },
      hard: {
        PIDGEOT: { moves: [:HURRICANE, :UTURN, :HEATWAVE, :ROOST], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :KEENEYE, item: :PIDGEOTITE },
        SWOOBAT: { moves: [:PSYCHIC, :AIRSLASH, :ENERGYBALL, :ATTRACT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :UNAWARE },
        SKARMORY: { moves: [:IRONHEAD, :SPIKES, :STEALTHROCK, :DUALWINGBEAT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        SIGILYPH: { moves: [:PSYCHIC, :HYPNOSIS, :AIRCUTTER, :ENERGYBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :MAGICGUARD },
        BRAVIARY: { moves: [:BRAVEBIRD, :RETURN, :SHADOWCLAW, :STEELWING], nature: :HARDY, ATTACK: 196, SPEED: 196, HP: 4, ability: :DEFIANT, item: :LIFEORB }
      },
      unfair: {
        PIDGEOT: { moves: [:HURRICANE, :UTURN, :HEATWAVE, :ROOST], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :KEENEYE, item: :PIDGEOTITE },
        SWOOBAT: { moves: [:PSYCHIC, :AIRSLASH, :ENERGYBALL, :ATTRACT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :UNAWARE },
        SKARMORY: { moves: [:IRONHEAD, :SPIKES, :STEALTHROCK, :DUALWINGBEAT], nature: :IMPISH, HP: 196, DEFENSE: 196, SPEED: 4, ability: :STURDY, item: :LEFTOVERS },
        SIGILYPH: { moves: [:PSYCHIC, :HYPNOSIS, :AIRCUTTER, :ENERGYBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 196, SPEED: 196, ability: :MAGICGUARD },
        ARCHEOPS: { moves: [:ROCKSLIDE, :UTURN, :ACROBATICS, :AQUATAIL], nature: :JOLLY, ATTACK: 196, SPEED: 196, HP: 4, ability: :DEFEATIST, item: :SITRUSBERRY },
        BRAVIARY: { moves: [:BRAVEBIRD, :RETURN, :SHADOWCLAW, :STEELWING], nature: :HARDY, ATTACK: 196, SPEED: 196, HP: 4, ability: :DEFIANT, item: :LIFEORB },
      }
    }
  ]
}

TRAINER_6 = {
  :LEADER_Blaine => [:FIRE,
    {
      normal: {
        NINETALES: { moves: [:WILLOWISP, :MYSTICALFIRE, :SOLARBEAM, :NASTYPLOT], nature: :HARDY, ability: :DROUGHT, item: :HEATROCK },
        MAGCARGO: { moves: [:OVERHEAT, :SUNNYDAY, :EARTHPOWER, :ROCKSLIDE], nature: :HARDY, ability: :FLAMEBODY, item: :WHITEHERB },
        MAGMORTAR: { moves: [:THUNDERPUNCH, :CONFUSERAY, :OVERHEAT, :SUNNYDAY], nature: :HARDY, ability: :FLAMEBODY, item: :WHITEHERB },
        RAPIDASH: { moves: [:HIGHHORSEPOWER, :BOUNCE, :OVERHEAT, :FLAREBLITZ], nature: :HARDY, ability: :FLASHFIRE, item: :WHITEHERB },
        CHARIZARD: { moves: [:FLAREBLITZ, :SWORDSDANCE, :OUTRAGE, :EARTHQUAKE], nature: :HARDY, ability: :BLAZE, item: :CHARIZARDITEX },
        ARCANINE: { moves: [:PLAYROUGH, :EXTREMESPEED, :FLAREBLITZ, :BODYSLAM], nature: :HARDY, ability: :INTIMIDATE, item: :LEFTOVERS }
      },

      hard: {
        NINETALES: { moves: [:WILLOWISP, :MYSTICALFIRE, :SOLARBEAM, :NASTYPLOT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, ability: :DROUGHT, item: :HEATROCK },
        MAGCARGO: { moves: [:LAVAPLUME, :SUNNYDAY, :ROCKSLIDE, :EARTHPOWER], nature: :CALM, HP: 252, SPECIAL_ATTACK: 252, SPEED: 4, ability: :FLAMEBODY, item: :LEFTOVERS },
        MAGMORTAR: { moves: [:THUNDERPUNCH, :CONFUSERAY, :FLAMETHROWER, :SUNNYDAY], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, ability: :FLAMEBODY, item: :SITRUSBERRY },
        RAPIDASH: { moves: [:FLAREBLITZ, :BOUNCE, :IRONTAIL, :HIGHHORSEPOWER], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :FLASHFIRE, item: :LEFTOVERS },
        CHARIZARD: { moves: [:FLAREBLITZ, :SWORDSDANCE, :OUTRAGE, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :BLAZE, item: :CHARIZARDITEX },
        ARCANINE: { moves: [:PLAYROUGH, :EXTREMESPEED, :FLAREBLITZ, :BODYSLAM], nature: :ADAMANT, HP: 252, ATTACK: 252, SPEED: 4, ability: :INTIMIDATE, item: :LEFTOVERS }
      },

      unfair: {
        NINETALES: { moves: [:WILLOWISP, :MYSTICALFIRE, :SOLARBEAM, :NASTYPLOT], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, ability: :DROUGHT, item: :HEATROCK },
        MAGCARGO: { moves: [:LAVAPLUME, :SUNNYDAY, :ROCKSLIDE, :EARTHPOWER], nature: :CALM, HP: 252, SPECIAL_ATTACK: 252, SPEED: 4, ability: :FLAMEBODY, item: :FOCUSSASH },
        MAGMORTAR: { moves: [:THUNDERPUNCH, :CONFUSERAY, :FLAMETHROWER, :SUNNYDAY], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, ability: :FLAMEBODY, item: :LIFEORB },
        RAPIDASH: { moves: [:FLAREBLITZ, :BOUNCE, :IRONTAIL, :HIGHHORSEPOWER], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :FLASHFIRE, item: :LIFEORB },
        CHARIZARD: { moves: [:FLAREBLITZ, :SWORDSDANCE, :OUTRAGE, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :BLAZE, item: :CHARIZARDITEX },
        ARCANINE: { moves: [:PLAYROUGH, :EXTREMESPEED, :FLAREBLITZ, :BODYSLAM], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :LEFTOVERS }
      }
    }
  ],

  :LEADER_Pryce => [:ICE,
    {
      normal: {
        DEWGONG: { moves: [:ICEBEAM, :REST, :SLEEPTALK, :SURF], nature: :HARDY, ability: :THICKFAT, item: :CHESTOBERRY },
        MAMOSWINE: { moves: [:ICICLECRASH, :ICESHARD, :EARTHQUAKE, :ROCKSLIDE], nature: :HARDY, ability: :SNOWCLOAK, item: :ASSAULTVEST },
        WEAVILE: { moves: [:TRIPLEAXEL, :THROATCHOP, :TAUNT, :KNOCKOFF], nature: :HARDY, ability: :PRESSURE, item: :LIFEORB },
        DARMANITAN_2: { moves: [:ICICLECRASH, :FLAREBLITZ, :UTURN, :EARTHQUAKE], nature: :HARDY, ability: :GORILLATACTICS, item: :CHOICEBAND }
      },

      hard: {
        DEWGONG: { moves: [:ICEBEAM, :REST, :SLEEPTALK, :SURF], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :THICKFAT, item: :CHESTOBERRY },
        MAMOSWINE: { moves: [:ICICLECRASH, :ICESHARD, :EARTHQUAKE, :ROCKSLIDE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :SNOWCLOAK, item: :ASSAULTVEST },
        WEAVILE: { moves: [:TRIPLEAXEL, :THROATCHOP, :TAUNT, :KNOCKOFF], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :PRESSURE, item: :LIFEORB },
        DARMANITAN_2: { moves: [:ICICLECRASH, :FLAREBLITZ, :UTURN, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :GORILLATACTICS, item: :CHOICEBAND },
        GLALIE: { moves: [:CRUNCH, :RETURN, :EXPLOSION, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, item: :GLALITITE }
      },

      unfair: {
        DEWGONG: { moves: [:ICEBEAM, :REST, :SLEEPTALK, :SURF], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :THICKFAT, item: :CHESTOBERRY },
        MAMOSWINE: { moves: [:ICICLECRASH, :ICESHARD, :EARTHQUAKE, :ROCKSLIDE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :SNOWCLOAK, item: :ASSAULTVEST },
        WEAVILE: { moves: [:TRIPLEAXEL, :THROATCHOP, :TAUNT, :KNOCKOFF], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :PRESSURE, item: :LIFEORB },
        DARMANITAN_2: { moves: [:ICICLECRASH, :FLAREBLITZ, :UTURN, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :GORILLATACTICS, item: :CHOICEBAND },
        GLALIE: { moves: [:CRUNCH, :RETURN, :EXPLOSION, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, item: :GLALITITE },
        BAXCALIBUR: { moves: [:SCALESHOT, :ICICLESPEAR, :DRAGONDANCE, :STOMPINGTANTRUM], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :THERMALEXCHANGE, item: :LOADEDDICE }
      }
    }
  ],

  :LEADER_Tate => [:PSYCHIC,
    {
      normal: {
        CLAYDOL: { moves: [:EARTHQUAKE, :PSYCHIC, :REFLECT, :LIGHTSCREEN], nature: :HARDY, ability: :LEVITATE },
        XATU: { moves: [:PSYCHIC, :SUNNYDAY, :CONFUSERAY, :CALMMIND], nature: :HARDY, ability: :SYNCHRONIZE },
        LUNATONE: { moves: [:LIGHTSCREEN, :PSYCHIC, :HYPNOSIS, :CALMMIND], nature: :HARDY, ability: :LEVITATE, item: :SITRUSBERRY },
        GRUMPIG: { moves: [:PSYCHIC, :POWERGEM, :NASTYPLOT, :REST], nature: :HARDY, ability: :THICKFAT, item: :CHESTOBERRY }
      },

      hard: {
        CLAYDOL: { moves: [:EARTHQUAKE, :PSYCHIC, :REFLECT, :LIGHTSCREEN], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :LEVITATE, item: :LIGHTCLAY },
        XATU: { moves: [:PSYCHIC, :SUNNYDAY, :CONFUSERAY, :CALMMIND], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :SYNCHRONIZE, item: :LEFTOVERS },
        LUNATONE: { moves: [:LIGHTSCREEN, :PSYCHIC, :HYPNOSIS, :CALMMIND], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :LEVITATE, item: :SITRUSBERRY },
        GRUMPIG: { moves: [:PSYCHIC, :POWERGEM, :NASTYPLOT, :REST], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :THICKFAT, item: :CHESTOBERRY },
        CHIMECHO: { moves: [:PSYCHIC, :SHADOWBALL, :RECOVER, :PERISHSONG], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, item: :LEFTOVERS }
      },

      unfair: {
        CLAYDOL: { moves: [:EARTHQUAKE, :PSYCHIC, :REFLECT, :LIGHTSCREEN], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :LEVITATE, item: :LIGHTCLAY },
        XATU: { moves: [:PSYCHIC, :SUNNYDAY, :CONFUSERAY, :CALMMIND], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :SYNCHRONIZE, item: :FOCUSSASH },
        LUNATONE: { moves: [:LIGHTSCREEN, :PSYCHIC, :CALMMIND, :ICEBEAM], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :LEVITATE, item: :LIFEORB },
        GRUMPIG: { moves: [:PSYCHIC, :POWERGEM, :NASTYPLOT, :REST], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :THICKFAT, item: :CHESTOBERRY },
        CHIMECHO: { moves: [:PSYCHIC, :SHADOWBALL, :RECOVER, :PERISHSONG], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, item: :LEFTOVERS },
        GARDEVOIR: { moves: [:PSYCHIC, :CALMMIND, :HYPERVOICE, :SHADOWBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, ability: :SYNCHRONIZE, item: :GARDEVOIRITE }
      }
    }
  ],

  :LEADER_Liza => [:PSYCHIC,
    {
      normal: {
        CLAYDOL: { moves: [:EARTHQUAKE, :ANCIENTPOWER, :PSYCHIC, :LIGHTSCREEN], nature: :HARDY, ability: :LEVITATE },
        XATU: { moves: [:PSYCHIC, :SUNNYDAY, :CONFUSERAY, :CALMMIND], nature: :HARDY, ability: :SYNCHRONIZE },
        SOLROCK: { moves: [:SUNNYDAY, :SOLARBEAM, :PSYCHIC, :FLAMETHROWER], nature: :HARDY, ability: :LEVITATE },
        GOTHITELLE: { moves: [:PSYCHIC, :CALMMIND, :HYPNOSIS, :TOXIC], nature: :HARDY, ability: :SHADOWTAG, item: :LEFTOVERS }
      },

      hard: {
        CLAYDOL: { moves: [:EARTHQUAKE, :PSYCHIC, :REFLECT, :LIGHTSCREEN], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :LEVITATE, item: :LIGHTCLAY },
        XATU: { moves: [:PSYCHIC, :SUNNYDAY, :CONFUSERAY, :CALMMIND], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, item: :LEFTOVERS },
        SOLROCK: { moves: [:SUNNYDAY, :SOLARBEAM, :PSYCHIC, :FLAMETHROWER], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252 },
        GOTHITELLE: { moves: [:PSYCHIC, :CALMMIND, :HYPNOSIS, :TOXIC], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :SHADOWTAG, item: :LEFTOVERS },
        GARDEVOIR: { moves: [:PSYCHIC, :CALMMIND, :HYPERVOICE, :SHADOWBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, item: :GARDEVOIRITE }
      },

      unfair: {
        CLAYDOL: { moves: [:EARTHQUAKE, :PSYCHIC, :REFLECT, :LIGHTSCREEN], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, item: :LIGHTCLAY },
        XATU: { moves: [:PSYCHIC, :SUNNYDAY, :CONFUSERAY, :CALMMIND], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4 },
        SOLROCK: { moves: [:SUNNYDAY, :SOLARBEAM, :PSYCHIC, :FLAMETHROWER], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252 },
        GOTHITELLE: { moves: [:PSYCHIC, :CALMMIND, :HYPNOSIS, :TOXIC], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, item: :LEFTOVERS },
        GARDEVOIR: { moves: [:PSYCHIC, :CALMMIND, :HYPERVOICE, :SHADOWBALL], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, item: :GARDEVOIRITE },
        FARIGIRAF: { moves: [:PSYCHIC, :TWINBEAM, :DAZZLINGGLEAM, :TRICKROOM], nature: :QUIET, HP: 252, SPECIAL_ATTACK: 252, SPECIAL_DEFENSE: 4, ability: :CUDCHEW, item: :SITRUSBERRY }
      }
    }
  ],

  :LEADER_Candice => [:ICE,
    {
      normal: {
        SNEASEL: { moves: [:FEINTATTACK, :ICESHARD, :SLASH, :AERIALACE], nature: :HARDY, ability: :KEENEYE },
        PILOSWINE: { moves: [:HAIL, :EARTHQUAKE, :STONEEDGE, :AVALANCHE], nature: :HARDY, ability: :OBLIVIOUS },
        ABOMASNOW: { moves: [:WOODHAMMER, :FOCUSBLAST, :WATERPULSE, :AVALANCHE], nature: :HARDY, ability: :SNOWWARNING },
        FROSLASS: { moves: [:SHADOWBALL, :DOUBLETEAM, :PSYCHIC, :BLIZZARD], nature: :HARDY, ability: :SNOWCLOAK }
      },

      hard: {
        WEAVILE: { moves: [:TRIPLEAXEL, :THROATCHOP, :TAUNT, :KNOCKOFF], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, item: :LIFEORB },
        BEARTIC: { moves: [:ICICLECRASH, :SUPERPOWER, :SLASH, :PLAYROUGH], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4 },
        AVALUGG: { moves: [:AVALANCHE, :CRUNCH, :RECOVER, :EARTHQUAKE], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :ICEBODY, item: :LEFTOVERS },
        ABOMASNOW: { moves: [:WOODHAMMER, :FOCUSBLAST, :WATERPULSE, :AVALANCHE], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, ability: :SNOWWARNING, item: :ABOMASITE },
        ROTOM_2: { moves: [:THUNDERBOLT, :BLIZZARD, :HIDDENPOWER, :VOLTSWITCH], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252 }
      },

      unfair: {
        WEAVILE: { moves: [:TRIPLEAXEL, :THROATCHOP, :TAUNT, :KNOCKOFF], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, item: :LIFEORB },
        BEARTIC: { moves: [:ICICLECRASH, :SUPERPOWER, :THROATCHOP, :PLAYROUGH], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4 },
        AVALUGG: { moves: [:AVALANCHE, :CRUNCH, :RECOVER, :EARTHQUAKE], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :ICEBODY, item: :LEFTOVERS },
        ABOMASNOW: { moves: [:WOODHAMMER, :FOCUSBLAST, :WATERPULSE, :AVALANCHE], nature: :MODEST, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252, item: :ABOMASITE },
        CETITAN: { moves: [:ICESPINNER, :LIQUIDATION, :KNOCKOFF, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :THICKFAT, item: :ASSAULTVEST },
        FROSLASS: { moves: [:SHADOWBALL, :DOUBLETEAM, :PSYCHIC, :BLIZZARD], nature: :TIMID, HP: 4, SPECIAL_ATTACK: 252, SPEED: 252 }
      }
    }
  ],

  :LEADER_Brycen => [:ICE,
    {
      normal: {
        VANILLISH: { moves: [:ACIDARMOR, :ASTONISH, :MIRRORSHOT, :FROSTBREATH], nature: :HARDY },
        CRYOGONAL: { moves: [:REFLECT, :RAPIDSPIN, :AURORABEAM, :FROSTBREATH], nature: :HARDY },
        BEARTIC: { moves: [:SWAGGER, :BRINE, :SLASH, :ICICLECRASH], nature: :HARDY },
        ARCTOVISH: { moves: [:SURF, :FREEZEDRY, :METEORBEAM, :ICEBEAM], ability: :WATERABSORB, item: :POWERHERB }
      },

      hard: {
        VANILLUXE: { moves: [:FROSTBREATH, :ACIDARMOR, :FREEZEDRY, :FLASHCANNON], nature: :BOLD, HP: 252, DEFENSE: 252, ability: :ICEBODY, item: :ASSAULTVEST },
        CRYOGONAL: { moves: [:REFLECT, :RAPIDSPIN, :AURORABEAM, :FROSTBREATH], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252 },
        BEARTIC: { moves: [:ICICLECRASH, :SUPERPOWER, :THROATCHOP, :PLAYROUGH], nature: :JOLLY, ATTACK: 252, SPEED: 252 },
        ARCTOVISH: { moves: [:SURF, :FREEZEDRY, :METEORBEAM, :ICEBEAM], ability: :WATERABSORB, item: :POWERHERB },
        GLALIE: { moves: [:CRUNCH, :RETURN, :EXPLOSION, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, item: :GLALITITE }
      },

      unfair: {
        VANILLUXE: { moves: [:FROSTBREATH, :ACIDARMOR, :FREEZEDRY, :FLASHCANNON], nature: :BOLD, HP: 252, DEFENSE: 252, item: :ASSAULTVEST },
        CRYOGONAL: { moves: [:REFLECT, :RAPIDSPIN, :AURORABEAM, :FROSTBREATH], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252 },
        BEARTIC: { moves: [:ICICLECRASH, :SUPERPOWER, :THROATCHOP, :PLAYROUGH], nature: :JOLLY, ATTACK: 252, SPEED: 252 },
        ARCTOVISH: { moves: [:SURF, :FREEZEDRY, :METEORBEAM, :ICEBEAM], item: :POWERHERB },
        GLALIE: { moves: [:CRUNCH, :RETURN, :EXPLOSION, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, item: :GLALITITE },
        MAMOSWINE: { moves: [:ICICLECRASH, :ICESHARD, :EARTHQUAKE, :ROCKSLIDE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, item: :ASSAULTVEST }
      }
    }
  ]

}

TRAINER_7 = {
  # BLUE
  :LEADER_Blue => [:FLYING,
    {
      normal: {
        EXEGGUTOR: { moves: [:LEAFSTORM, :PSYCHIC, :HYPNOSIS, :TRICKROOM], nature: :CALM, ability: :CHLOROPHYLL },
        ARCANINE:  { moves: [:ROAR, :DRAGONPULSE, :FLAREBLITZ, :EXTREMESPEED], nature: :JOLLY, ability: :INTIMIDATE },
        RHYDON:    { moves: [:MEGAHORN, :STONEEDGE, :THUNDERFANG, :EARTHQUAKE], nature: :IMPISH, ability: :ROCKHEAD },
        GYARADOS:  { moves: [:ICEFANG, :WATERFALL, :DRAGONDANCE, :RETURN], nature: :JOLLY, ability: :INTIMIDATE },
        MACHAMP:   { moves: [:DYNAMICPUNCH, :EARTHQUAKE, :STONEEDGE, :THUNDERPUNCH], nature: :ADAMANT, ability: :NOGUARD }
      },
      hard: {
        EXEGGUTOR: { moves: [:LEAFSTORM, :PSYCHIC, :SLEEPPOWDER, :EXPLOSION], nature: :MODEST, HP: 160, SPECIAL_ATTACK: 252, SPEED: 96, ability: :CHLOROPHYLL, item: :LIFEORB },
        ARCANINE:  { moves: [:FLAREBLITZ, :WILDCHARGE, :EXTREMESPEED, :MORNINGSUN], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :CHOICEBAND },
        RHYPERIOR: { moves: [:STONEEDGE, :EARTHQUAKE, :MEGAHORN, :FIREPUNCH], nature: :ADAMANT, ATTACK: 252, HP: 252, SPECIAL_DEFENSE: 4, ability: :SOLIDROCK, item: :ASSAULTVEST },
        GYARADOS:  { moves: [:WATERFALL, :EARTHQUAKE, :DRAGONDANCE, :ICEFANG], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :LUMBERRY },
        MACHAMP:   { moves: [:CLOSECOMBAT, :KNOCKOFF, :BULLETPUNCH, :STONEEDGE], nature: :ADAMANT, ATTACK: 252, HP: 248, SPECIAL_DEFENSE: 8, ability: :GUTS, item: :FLAMEORB },
        PIDGEOT:   { moves: [:HURRICANE, :HEATWAVE, :UTURN, :ROOST], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :TANGLEDFEET, item: :CHOICESPECS }
      },
      unfair: {
        EXEGGUTOR:     { moves: [:LEAFSTORM, :PSYSHOCK, :SLEEPPOWDER, :EXPLOSION], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :CHLOROPHYLL, item: :FOCUSSASH },
        ARCANINE:      { moves: [:FLAREBLITZ, :CLOSECOMBAT, :EXTREMESPEED, :WILDCHARGE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :CHOICESCARF },
        RHYPERIOR:     { moves: [:STONEEDGE, :EARTHQUAKE, :MEGAHORN, :ICEPUNCH], nature: :ADAMANT, ATTACK: 252, HP: 252, SPECIAL_DEFENSE: 4, ability: :SOLIDROCK, item: :WEAKNESSPOLICY },
        GYARADOS:      { moves: [:WATERFALL, :CRUNCH, :EARTHQUAKE, :DRAGONDANCE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :GYARADOSITE },
        MACHAMP:       { moves: [:DYNAMICPUNCH, :STONEEDGE, :BULLETPUNCH, :KNOCKOFF], nature: :ADAMANT, ATTACK: 252, HP: 248, SPECIAL_DEFENSE: 8, ability: :NOGUARD, item: :LEFTOVERS },
        ZAPDOS:        { moves: [:THUNDERBOLT, :VOLTSWITCH, :ROOST, :HURRICANE, :THUNDERWAVE], nature: :TIMID, ability: :PRESSURE, item: :LEFTOVERS }
      }
    }
  ],

  # CLAIR
  :LEADER_Clair => [:DRAGON,
    {
      normal: {
        GYARADOS:    { moves: [:BITE, :TWISTER, :DRAGONRAGE, :DRAGONPULSE], nature: :JOLLY, ability: :INTIMIDATE, item: :LEFTOVERS },
        KINGDRA:     { moves: [:HYDROPUMP, :SMOKESCREEN, :HYPERBEAM, :DRAGONPULSE], nature: :MODEST, ability: :SNIPER, item: :SITRUSBERRY },
        TYRANTRUM:   { moves: [:HEADSMASH, :EARTHQUAKE, :DRAGONCLAW, :CRUNCH], nature: :ADAMANT, ability: :ROCKHEAD, item: :ASSAULTVEST },
        GOODRA:      { moves: [:DRAGONPULSE, :SLUDGEBOMB, :ICEBEAM, :FLAMETHROWER], nature: :CALM, ability: :SAPSIPPER, item: :LEFTOVERS }
      },
      hard: {
        GYARADOS:    { moves: [:WATERFALL, :ICEBEAM, :DRAGONDANCE, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOXIE, item: :LUMBERRY },
        DRAGONITE:   { moves: [:OUTRAGE, :EXTREMESPEED, :FIREPUNCH, :DRAGONDANCE], nature: :ADAMANT, ATTACK: 252, HP: 252, DEFENSE: 4, ability: :MULTISCALE, item: :LEFTOVERS },
        KINGDRA:     { moves: [:HYDROPUMP, :DRAGONPULSE, :ICEBEAM, :RAINDANCE], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SWIFTSWIM, item: :LIFEORB },
        HYDRAPPLE:   { moves: [:RECOVER, :ENERGYBALL, :DRAGONPULSE, :EARTHPOWER], nature: :BOLD, ability: :REGENERATOR, item: :HEAVYDUTYBOOTS },
        TYRANTRUM:   { moves: [:HEADSMASH, :EARTHQUAKE, :DRAGONCLAW, :CRUNCH], nature: :ADAMANT, ability: :ROCKHEAD, item: :ASSAULTVEST },
        GOODRA:      { moves: [:DRAGONPULSE, :SLUDGEBOMB, :ICEBEAM, :FLAMETHROWER], nature: :CALM, ability: :SAPSIPPER, item: :LEFTOVERS }
      },
      unfair: {
        GYARADOS:    { moves: [:WATERFALL, :CRUNCH, :ICEFANG, :DRAGONDANCE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOXIE, item: :WACANBERRY },
        DRAGONITE:   { moves: [:OUTRAGE, :EXTREMESPEED, :FIREPUNCH, :DRAGONDANCE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MULTISCALE, item: :WEAKNESSPOLICY },
        SALAMENCE:   { moves: [:DRAGONCLAW, :EARTHQUAKE, :FIREBLAST, :ROOST], nature: :NAIVE, ATTACK: 252, SPEED: 252, SPECIAL_ATTACK: 4, ability: :INTIMIDATE, item: :CHOICESCARF },
        KINGDRA:     { moves: [:HYDROPUMP, :DRAGONPULSE, :ICEBEAM, :FOCUSBLAST], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SWIFTSWIM, item: :LIFEORB },
        TYRANTRUM:   { moves: [:HEADSMASH, :EARTHQUAKE, :DRAGONCLAW, :CRUNCH], nature: :ADAMANT, ability: :ROCKHEAD, item: :ASSAULTVEST },
        LATIAS:      { moves: [:DRAGONPULSE, :PSYCHIC, :WISH, :PROTECT], nature: :TIMID, ability: :LEVITATE, item: :LATIASITE }
      }
    }
  ],

  # JUAN
  :LEADER_Juan => [:WATER,
    {
      normal: {
        LUVDISC: { moves: [:DRAININGKISS, :ATTRACT, :SWEETKISS, :WATERPULSE], nature: :CALM, ability: :SWIFTSWIM, item: :SITRUSBERRY },
        WHISCASH:{ moves: [:EARTHQUAKE, :ZENHEADBUTT, :WATERFALL, :MUDSPORT], nature: :IMPISH, ability: :OBLIVIOUS, item: :LEFTOVERS },
        WALREIN:  { moves: [:SURF, :ICEBEAM, :REST, :SLEEPTALK], nature: :BOLD, ability: :THICKFAT, item: :LEFTOVERS },
        SEAKING: { moves: [:WATERFALL, :RAINDANCE, :AQUARING, :HORNDRILL], nature: :JOLLY, ability: :SWIFTSWIM, item: :LEFTOVERS },
        MILOTIC: { moves: [:HYDROPUMP, :RECOVER, :ICEBEAM, :DISARMINGVOICE], nature: :CALM, ability: :MARVELSCALE, item: :LEFTOVERS }
      },
      hard: {
        WHISCASH:{ moves: [:EARTHQUAKE, :WATERFALL, :ZENHEADBUTT, :MUDDYWATER], nature: :ADAMANT, ATTACK: 252, HP: 252, SPEED: 4, ability: :OBLIVIOUS, item: :LEFTOVERS },
        WALREIN:  { moves: [:SURF, :ICEBEAM, :REST, :SLEEPTALK], nature: :BOLD, HP: 252, DEFENSE: 252, SPEED: 4, ability: :THICKFAT, item: :LEFTOVERS },
        SEAKING: { moves: [:WATERFALL, :DRILLRUN, :AQUAJET, :RAINDANCE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :SWIFTSWIM, item: :SITRUSBERRY },
        MILOTIC: { moves: [:SCALD, :RECOVER, :ICEBEAM, :TOXIC], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :MARVELSCALE, item: :LEFTOVERS },
        SLOWBRO: { moves: [:SCALD, :PSYCHIC, :SLACKOFF, :ICEBEAM], nature: :BOLD, ability: :REGENERATOR, item: :LEFTOVERS },
        LUDICOLO:{ moves: [:ENERGYBALL, :SURF, :ICEBEAM, :LEAFSTORM], nature: :MODEST, ability: :SWIFTSWIM, item: :LIFEORB }
      },
      unfair: {
        WHISCASH:{ moves: [:EARTHQUAKE, :WATERFALL, :ZENHEADBUTT, :MUDDYWATER], nature: :ADAMANT, ATTACK: 252, HP: 252, SPEED: 4, ability: :OBLIVIOUS, item: :LEFTOVERS },
        WALREIN:  { moves: [:SURF, :ICEBEAM, :REST, :SLEEPTALK], nature: :BOLD, HP: 252, DEFENSE: 252, SPEED: 4, ability: :THICKFAT, item: :LEFTOVERS },
        SEAKING: { moves: [:WATERFALL, :DRILLRUN, :AQUAJET, :MEGAHORN], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :SWIFTSWIM, item: :ASSAULTVEST },
        MILOTIC: { moves: [:SCALD, :HYDROPUMP, :ICEBEAM, :RECOVER], nature: :CALM, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :COMPETITIVE, item: :LIFEORB },
        KYOGRE:  { moves: [:WATERSPOUT, :ICEBEAM, :SURF, :THUNDERBOLT], nature: :MODEST, ability: :DRIZZLE, item: :BLUEORB, shiny: true },
        SLOWBRO: { moves: [:SCALD, :PSYCHIC, :SLACKOFF, :ICEBEAM], nature: :BOLD, ability: :REGENERATOR, item: :LEFTOVERS }
      }
    }
  ],

  # VOLKNER
  :LEADER_Volkner => [:ELECTRIC,
    {
      normal: {
        JOLTEON:    { moves: [:CHARGEBEAM, :THUNDERWAVE, :IRONTAIL, :QUICKATTACK], nature: :TIMID, ability: :VOLTABSORB, item: :LEFTOVERS },
        RAICHU:     { moves: [:CHARGEBEAM, :SIGNALBEAM, :FOCUSBLAST, :QUICKATTACK], nature: :MODEST, ability: :STATIC, item: :LEFTOVERS },
        LUXRAY:     { moves: [:THUNDERFANG, :ICEFANG, :FIREFANG, :CRUNCH], nature: :JOLLY, ability: :RIVALRY, item: :LEFTOVERS },
        ELECTIVIRE: { moves: [:THUNDERPUNCH, :FIREPUNCH, :GIGAIMPACT, :QUICKATTACK], nature: :ADAMANT, ability: :MOTORDRIVE, item: :SITRUSBERRY },
        AMPHAROS:   { moves: [:THUNDERBOLT, :DRAGONPULSE, :POWERGEM, :VOLTSWITCH], nature: :MODEST, ability: :STATIC }
      },
      hard: {
        JOLTEON:    { moves: [:THUNDERBOLT, :SHADOWBALL, :VOLTSWITCH, :THUNDERWAVE], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :VOLTABSORB, item: :CHOICESPECS },
        RAICHU:     { moves: [:THUNDERBOLT, :FOCUSBLAST, :NASTYPLOT, :SURF], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :STATIC, item: :LIFEORB },
        LUXRAY:     { moves: [:THUNDERFANG, :ICEFANG, :FIREFANG, :CRUNCH], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :RIVALRY, item: :LEFTOVERS },
        ELECTIVIRE: { moves: [:WILDCHARGE, :EARTHQUAKE, :ICEPUNCH, :ROCKSLIDE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOTORDRIVE, item: :CHOICEBAND },
        AMPHAROS:   { moves: [:THUNDERBOLT, :DRAGONPULSE, :POWERGEM, :VOLTSWITCH], nature: :MODEST, ability: :STATIC },
        ROTOM_1:     { moves: [:THUNDERBOLT, :HYDROPUMP, :NASTYPLOT, :WILLOWISP], nature: :TIMID, ability: :LEVITATE, item: :LEFTOVERS }
      },
      unfair: {
        JOLTEON:    { moves: [:THUNDERBOLT, :SHADOWBALL, :VOLTSWITCH, :HIDDENPOWER], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :VOLTABSORB, item: :CHOICESPECS },
        RAICHU:     { moves: [:THUNDERBOLT, :FOCUSBLAST, :NASTYPLOT, :PSYCHIC], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :STATIC, item: :LIGHTBALL },
        LUXRAY:     { moves: [:THUNDERFANG, :ICEFANG, :FIREFANG, :CRUNCH], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :RIVALRY, item: :LEFTOVERS },
        ELECTIVIRE: { moves: [:WILDCHARGE, :GIGAIMPACT, :EARTHQUAKE, :ICEPUNCH], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOTORDRIVE, item: :CHOICESCARF },
        AMPHAROS:   { moves: [:THUNDERBOLT, :DRAGONPULSE, :POWERGEM, :VOLTSWITCH], nature: :MODEST, ability: :STATIC, item: :AMPHAROSITE },
        REGIELEKI:  { moves: [:HIDDENPOWER, :THUNDERBOLT, :VOLTSWITCH, :HYPERBEAM], nature: :TIMID, ability: :TRANSISTOR, item: :FOCUSSASH }
      }
    }
  ],

  # IRIS
  :LEADER_Iris => [:DRAGON,
    {
      normal: {
        DRUDDIGON:{ moves: [:DRAGONTAIL, :REVENGE, :NIGHTSLASH, :CHIPAWAY], nature: :ADAMANT, ability: :SHEERFORCE, item: :LEFTOVERS },
        HAXORUS:  { moves: [:DRAGONTAIL, :DRAGONDANCE, :SLASH, :ASSURANCE], nature: :JOLLY, ability: :MOLDBREAKER, item: :LEFTOVERS },
        ARCHALUDON:{ moves: [:DRAGONPULSE, :BODYPRESS, :FLASHCANNON, :THUNDERWAVE], nature: :BOLD, ability: :STAMINA, item: :LEFTOVERS },
        HYDREIGON:{ moves: [:DRACOMETEOR, :DARKPULSE, :FIREBLAST, :FLASHCANNON], nature: :MODEST, ability: :LEVITATE, item: :LEFTOVERS },
        KOMMOO:   { moves: [:CLANGOROUSSOUL, :CLOSECOMBAT, :DRAGONCLAW, :POISONJAB], nature: :ADAMANT, ability: :BULLETPROOF }
      },
      hard: {
        DRUDDIGON:{ moves: [:OUTRAGE, :REVENGE, :NIGHTSLASH, :EARTHQUAKE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :SHEERFORCE, item: :CHOICEBAND },
        HAXORUS:  { moves: [:SWORDSDANCE, :OUTRAGE, :EARTHQUAKE, :POISONJAB], nature: :ADAMANT, ATTACK: 252, HP: 252, SPECIAL_DEFENSE: 4, ability: :MOLDBREAKER, item: :ASSAULTVEST },
        TURTONATOR:{ moves: [:OVERHEAT, :SHELLTRAP, :FLASHCANNON, :FOCUSBLAST], nature: :MODEST, ability: :SHELLARMOR, item: :LEFTOVERS },
        KOMMOO:   { moves: [:CLANGOROUSSOUL, :CLOSECOMBAT, :DRAGONCLAW, :POISONJAB], nature: :ADAMANT, ability: :BULLETPROOF },
        ARCHALUDON:{ moves: [:DRAGONPULSE, :BODYPRESS, :FLASHCANNON, :THUNDERWAVE], nature: :BOLD, ability: :STAMINA, item: :LEFTOVERS },
        HYDREIGON:{ moves: [:DRACOMETEOR, :DARKPULSE, :FIREBLAST, :FLASHCANNON], nature: :MODEST, ability: :LEVITATE, item: :LEFTOVERS }
      },
      unfair: {
        DRUDDIGON:{ moves: [:OUTRAGE, :REVENGE, :NIGHTSLASH, :EARTHQUAKE], nature: :ADAMANT, ability: :SHEERFORCE, item: :LEFTOVERS },
        HAXORUS:  { moves: [:SWORDSDANCE, :OUTRAGE, :EARTHQUAKE, :POISONJAB], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOLDBREAKER, item: :LIFEORB },
        KOMMOO:   { moves: [:CLANGOROUSSOUL, :CLOSECOMBAT, :DRAGONCLAW, :POISONJAB], nature: :ADAMANT, ability: :BULLETPROOF },
        ARCHALUDON:{ moves: [:DRAGONPULSE, :BODYPRESS, :FLASHCANNON, :THUNDERWAVE], nature: :BOLD, ability: :STAMINA, item: :LEFTOVERS },
        HYDREIGON:{ moves: [:DRACOMETEOR, :DARKPULSE, :FIREBLAST, :EARTHPOWER], nature: :MODEST, ability: :LEVITATE, item: :CHOICESPECS },
        RAYQUAZA:{ moves: [:DRAGONDANCE, :EXTREMESPEED, :DRAGONCLAW, :DRAGONASCENT], nature: :JOLLY, ability: :AIRLOCK, item: :LIFEORB }
      }
    }
  ]
}


CHAMPION = {
  :CHAMPION_Blue => [:FLYING,
    {
      normal: {
        AERODACTYL: { moves: [:STONEEDGE, :EARTHQUAKE, :ICEFANG, :FIREBLAST], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :ROCKHEAD },
        EXEGGUTOR:  { moves: [:LEAFSTORM, :WOODHAMMER, :ZENHEADBUTT, :LEECHSEED], nature: :CALM, HP: 126, SPECIAL_ATTACK: 126, SPEED: 4, ability: :CHLOROPHYLL },
        GYARADOS:   { moves: [:WATERFALL, :EARTHQUAKE, :ICEFANG, :OUTRAGE], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :INTIMIDATE },
        ALAKAZAM:   { moves: [:PSYCHIC, :FOCUSBLAST, :SHADOWBALL, :REFLECT], nature: :TIMID, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :SYNCHRONIZE, item: :FOCUSSASH },
        ARCANINE:   { moves: [:FLAREBLITZ, :CLOSECOMBAT, :WILDCHARGE, :EXTREMESPEED], nature: :ADAMANT, ATTACK: 126, SPEED: 126, HP: 4, ability: :INTIMIDATE, item: :EXPERTBELT },
        MACHAMP:    { moves: [:SUPERPOWER, :STONEEDGE, :FIREPUNCH, :BULLETPUNCH], nature: :ADAMANT, ATTACK: 126, HP: 126, SPEED: 4, ability: :GUTS, item: :WHITEHERB }
      },
      hard: {
        AERODACTYL: { moves: [:STONEEDGE, :EARTHQUAKE, :ICEFANG, :FIREBLAST], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :ROCKHEAD, item: :CHOICESCARF },
        EXEGGUTOR:  { moves: [:LEAFSTORM, :WOODHAMMER, :ZENHEADBUTT, :LEECHSEED], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :CHLOROPHYLL, item: :LIFEORB },
        GYARADOS:   { moves: [:WATERFALL, :EARTHQUAKE, :ICEFANG, :OUTRAGE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :EXPERTBELT },
        ALAKAZAM:   { moves: [:PSYCHIC, :FOCUSBLAST, :SHADOWBALL, :REFLECT], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SYNCHRONIZE, item: :FOCUSSASH },
        ARCANINE:   { moves: [:FLAREBLITZ, :CLOSECOMBAT, :WILDCHARGE, :EXTREMESPEED], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :CHOICEBAND },
        MACHAMP:    { moves: [:SUPERPOWER, :STONEEDGE, :FIREPUNCH, :BULLETPUNCH], nature: :ADAMANT, ATTACK: 252, HP: 248, SPEED: 8, ability: :GUTS, item: :FLAMEORB }
      },
      unfair: {
        AERODACTYL: { moves: [:IRONHEAD, :CRUNCH, :STONEEDGE, :PSYCHICFANGS], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :ROCKHEAD, item: :AERODACTYLITE },
        EXEGGUTOR:  { moves: [:LEAFSTORM, :PSYCHIC, :HYPNOSIS, :LEECHSEED], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :CHLOROPHYLL, item: :FOCUSSASH },
        GYARADOS:   { moves: [:WATERFALL, :EARTHQUAKE, :CRUNCH, :OUTRAGE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOXIE, item: :GYARADOSITE },
        MEWTWO:     { moves: [:RECOVER, :PSYCHIC, :AURASPHERE, :THUNDERBOLT, :SHADOWBALL].first(4), nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SYNCHRONIZE, item: :SITRUSBERRY },
        ARCANINE:   { moves: [:FLAREBLITZ, :CLOSECOMBAT, :WILDCHARGE, :EXTREMESPEED], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :LIFEORB },
        MACHAMP:    { moves: [:DYNAMICPUNCH, :STONEEDGE, :KNOCKOFF, :BULLETPUNCH], nature: :ADAMANT, ATTACK: 252, HP: 248, SPEED: 8, ability: :NOGUARD, item: :LEFTOVERS }
      }
    }
  ],

  :CHAMPION_Lance => [:DRAGON,
    {
      normal: {
        DRAGONITE:  { moves: [:EXTREMESPEED, :ICEPUNCH, :FIREPUNCH, :DRACOMETEOR], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :INNERFOCUS },
        SALAMENCE:  { moves: [:DRAGONCLAW, :CRUNCH, :EARTHQUAKE, :STONEEDGE], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 2, ability: :INTIMIDATE },
        KINGDRA:    { moves: [:SURF, :ICEBEAM, :DRAGONPULSE, :FLASHCANNON], nature: :MODEST, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :SWIFTSWIM },
        HYDREIGON:  { moves: [:DRACOMETEOR, :FIREBLAST, :EARTHPOWER, :DARKPULSE], nature: :MODEST, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :LEVITATE, item: :WHITEHERB },
        HAXORUS:    { moves: [:OUTRAGE, :SUPERPOWER, :EARTHQUAKE, :ROCKSLIDE], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :MOLDBREAKER, item: :CHOICESCARF },
        FLYGON:     { moves: [:SOLARBEAM, :DRACOMETEOR, :EARTHPOWER, :UTURN], nature: :TIMID, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :LEVITATE, item: :POWERHERB }
      },
      hard: {
        DRAGONITE:  { moves: [:EXTREMESPEED, :IRONTAIL, :FIREPUNCH, :DRACOMETEOR], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MULTISCALE, item: :WEAKNESSPOLICY },
        SALAMENCE:  { moves: [:WATERFALL, :DRAGONDANCE, :OUTRAGE, :EARTHQUAKE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :INTIMIDATE, item: :LUMBERRY },
        KINGDRA:    { moves: [:HYDROPUMP, :DRAGONPULSE, :ICEBEAM, :RAINDANCE], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SWIFTSWIM, item: :LIFEORB },
        HYDREIGON:  { moves: [:DRACOMETEOR, :DARKPULSE, :FIREBLAST, :EARTHPOWER], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :LEVITATE, item: :CHOICESPECS },
        HAXORUS:    { moves: [:SWORDSDANCE, :OUTRAGE, :EARTHQUAKE, :POISONJAB], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOLDBREAKER, item: :LIFEORB },
        FLYGON:     { moves: [:DRACOMETEOR, :EARTHPOWER, :UTURN, :ROOST], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :LEVITATE, item: :CHOICESPECS }
      },
      unfair: {
        DRAGONITE:  { moves: [:OUTRAGE, :EXTREMESPEED, :FIREPUNCH, :ROOST], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MULTISCALE, item: :WEAKNESSPOLICY },
        SALAMENCE:  { moves: [:RETURN, :DRAGONDANCE, :EARTHQUAKE, :DRAGONCLAW], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :AERILATE, item: :SALAMENCITE },
        KINGDRA:    { moves: [:DRACOMETEOR, :HYDROPUMP, :ICEBEAM, :RAINDANCE], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SWIFTSWIM, item: :LIFEORB },
        HYDREIGON:  { moves: [:DRACOMETEOR, :DARKPULSE, :FIREBLAST, :EARTHPOWER], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :LEVITATE, item: :CHOICESPECS },
        HAXORUS:    { moves: [:SWORDSDANCE, :OUTRAGE, :EARTHQUAKE, :POISONJAB], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOLDBREAKER, item: :ASSAULTVEST },
        REGIDRAGO:  { moves: [:DRAGONENERGY], nature: :BRAVE, ATTACK: 252, HP: 252, SPEED: 4, ability: :TOUGHCLAWS, item: :CHOICESPECS }
      }
    }
  ],

  :CHAMPION_Steven => [:STEEL,
    {
      normal: {
        METAGROSS:  { moves: [:ZENHEADBUTT, :HAMMERARM, :EARTHQUAKE, :BULLETPUNCH], nature: :ADAMANT, ATTACK: 126, HP: 126, SPEED: 4, ability: :CLEARBODY },
        AGGRON:     { moves: [:HEADSMASH, :AVALANCHE, :EARTHQUAKE, :METALBURST], nature: :IMPISH, HP: 126, DEFENSE: 126, SPEED: 4, ability: :STURDY },
        EXCADRILL:  { moves: [:EARTHQUAKE, :ROCKSLIDE, :XSCISSOR, :SANDSTORM], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :SANDRUSH },
        ARCHEOPS:   { moves: [:HEADSMASH, :ACROBATICS, :EARTHQUAKE, :QUICKATTACK], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :DEFEATIST, item: :SITRUSBERRY },
        CRADILY:    { moves: [:STONEEDGE, :SEEDBOMB, :EARTHQUAKE, :SANDSTORM], nature: :CALM, HP: 126, SPECIAL_DEFENSE: 126, SPEED: 4, ability: :SUCTIONCUPS, item: :EXPERTBELT },
        ARMALDO:    { moves: [:XSCISSOR, :ROCKBLAST, :EARTHQUAKE, :SUPERPOWER], nature: :ADAMANT, ATTACK: 126, HP: 126, SPEED: 4, ability: :BATTLEARMOR, item: :WHITEHERB }
      },
      hard: {
        METAGROSS:  { moves: [:ZENHEADBUTT, :HAMMERARM, :EARTHQUAKE, :BULLETPUNCH], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :CLEARBODY, item: :METAGROSSITE },
        AGGRON:     { moves: [:HEADSMASH, :AVALANCHE, :EARTHQUAKE, :METALBURST], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :FILTER, item: :ASSAULTVEST },
        EXCADRILL:  { moves: [:EARTHQUAKE, :ROCKSLIDE, :XSCISSOR, :SANDSTORM], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :SANDRUSH, item: :CHOICEBAND },
        ARCHEOPS:   { moves: [:HEADSMASH, :ACROBATICS, :EARTHQUAKE, :QUICKATTACK], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :DEFEATIST, item: :CHOICEBAND },
        CRADILY:    { moves: [:STONEEDGE, :SEEDBOMB, :EARTHQUAKE, :SANDSTORM], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :SUCTIONCUPS, item: :LEFTOVERS },
        ARMALDO:    { moves: [:XSCISSOR, :ROCKBLAST, :EARTHQUAKE, :SUPERPOWER], nature: :ADAMANT, ATTACK: 252, HP: 252, SPEED: 4, ability: :BATTLEARMOR, item: :LIFEORB }
      },
      unfair: {
        METAGROSS:  { moves: [:ZENHEADBUTT, :HAMMERARM, :EARTHQUAKE, :BULLETPUNCH], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :CLEARBODY, item: :METAGROSSITE },
        AGGRON:     { moves: [:HEADSMASH, :AVALANCHE, :EARTHQUAKE, :METALBURST], nature: :IMPISH, HP: 252, DEFENSE: 252, SPEED: 4, ability: :ROCKHEAD, item: :FOCUSSASH },
        EXCADRILL:  { moves: [:EARTHQUAKE, :ROCKSLIDE, :XSCISSOR, :IRONHEAD], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOLDBREAKER },
        ARCHEOPS:   { moves: [:HEADSMASH, :ACROBATICS, :EARTHQUAKE, :QUICKATTACK], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :DEFEATIST, item: :SITRUSBERRY },
        CRADILY:    { moves: [:STONEEDGE, :SEEDBOMB, :EARTHQUAKE, :SANDSTORM], nature: :MODEST, HP: 252, SPECIAL_ATTACK: 252, SPEED: 4, ability: :SUCTIONCUPS, item: :LIFEORB },
        HEATRAN:    { moves: [:MAGMASTORM, :FLASHCANNON, :FLAMETHROWER, :SCORCHINGSANDS], nature: :ADAMANT, ATTACK: 252, HP: 252, SPEED: 4, ability: :FLASHFIRE, item: :AIRBALLOON }
      }
    }
  ],

  :CHAMPION_Cynthia => [:DRAGON,
    {
      normal: {
        GARCHOMP:  { moves: [:OUTRAGE, :EARTHQUAKE, :STONEEDGE, :SWORDSDANCE], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :SANDVEIL, item: :FOCUSSASH },
        SPIRITOMB: { moves: [:SUCKERPUNCH, :PROTECT, :WILLOWISP, :PAINSPLIT], nature: :CALM, HP: 126, SPECIAL_DEFENSE: 126, SPEED: 4, ability: :PRESSURE },
        ROSERADE:  { moves: [:LEAFSTORM, :SLUDGEBOMB, :SHADOWBALL, :SLEEPPOWDER], nature: :MODEST, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :NATURALCURE, item: :WHITEHERB },
        TOGEKISS:  { moves: [:AIRSLASH, :AURASPHERE, :SHADOWBALL, :MOONBLAST], nature: :CALM, HP: 126, SPECIAL_DEFENSE: 126, SPEED: 4, ability: :SERENEGRACE },
        LUCARIO:   { moves: [:CLOSECOMBAT, :DARKPULSE, :STONEEDGE, :EXTREMESPEED], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 4, ability: :STEADFAST, item: :LIFEORB },
        GLACEON:   { moves: [:ICEBEAM, :SHADOWBALL, :SIGNALBEAM, :WATERPULSE], nature: :MODEST, SPECIAL_ATTACK: 126, HP: 126, SPEED: 4, ability: :SNOWCLOAK }
      },
      hard: {
        GARCHOMP:  { moves: [:OUTRAGE, :EARTHQUAKE, :STONEEDGE, :SWORDSDANCE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :ROCKHEAD, item: :CHOICEBAND },
        SPIRITOMB: { moves: [:SUCKERPUNCH, :PROTECT, :WILLOWISP, :PAINSPLIT], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :PRESSURE, item: :LEFTOVERS },
        ROSERADE:  { moves: [:LEAFSTORM, :SLUDGEBOMB, :SHADOWBALL, :SLEEPPOWDER], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :NATURALCURE, item: :CHOICESPECS },
        TOGEKISS:  { moves: [:AIRSLASH, :AURASPHERE, :SHADOWBALL, :GRASSKNOT], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :SERENEGRACE, item: :SITRUSBERRY },
        LUCARIO:   { moves: [:CLOSECOMBAT, :DARKPULSE, :STONEEDGE, :EXTREMESPEED], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :STEADFAST, item: :CHOICEBAND },
        GLACEON:   { moves: [:ICEBEAM, :SHADOWBALL, :SIGNALBEAM, :WATERPULSE], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SNOWCLOAK, item: :CHOICESCARF }
      },
      unfair: {
        GARCHOMP:  { moves: [:OUTRAGE, :EARTHQUAKE, :STONEEDGE, :SWORDSDANCE], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :ROUGHSKIN, item: :GARCHOMPITE },
        SPIRITOMB: { moves: [:SUCKERPUNCH, :PROTECT, :WILLOWISP, :PAINSPLIT], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :PRESSURE, item: :FOCUSSASH },
        ROSERADE:  { moves: [:LEAFSTORM, :SLUDGEBOMB, :SHADOWBALL, :SLEEPPOWDER], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :NATURALCURE, item: :LIFEORB },
        TOGEKISS:  { moves: [:AIRSLASH, :AURASPHERE, :SHADOWBALL, :MOONBLAST], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :SERENEGRACE, item: :CHOICESPECS },
        LUCARIO:   { moves: [:CLOSECOMBAT, :DARKPULSE, :STONEEDGE, :EXTREMESPEED], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :STEADFAST, item: :LIFEORB },
        GIRATINA:  { moves: [:SHADOWFORCE, :DRAGONCLAW, :AQUATAIL, :IRONHEAD], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :LEVITATE, item: :LEFTOVERS }
      }
    }
  ],

  :CHAMPION_Alder => [:BUG,
    {
      normal: {
        VOLCARONA:   { moves: [:QUIVERDANCE, :HEATWAVE, :BUGBUZZ, :PSYCHIC], nature: :MODEST, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :FLAMEBODY },
        CONKELDURR:  { moves: [:HAMMERARM, :MACHPUNCH, :PAYBACK, :STONEEDGE], nature: :ADAMANT, ATTACK: 126, HP: 126, SPEED: 4, ability: :GUTS },
        REUNICLUS:   { moves: [:LIGHTSCREEN, :REFLECT, :TOXIC, :PSYCHIC], nature: :CALM, HP: 126, SPECIAL_DEFENSE: 126, SPEED: 4, ability: :MAGICGUARD, item: :LEFTOVERS },
        KROOKODILE:  { moves: [:EARTHQUAKE, :CRUNCH, :STONEEDGE, :OUTRAGE], nature: :JOLLY, ATTACK: 126, SPEED: 126, HP: 2, ability: :MOXIE, item: :EXPERTBELT },
        CHANDELURE:  { moves: [:FLAMETHROWER, :SHADOWBALL, :ENERGYBALL, :PSYCHIC], nature: :MODEST, SPECIAL_ATTACK: 126, SPEED: 126, HP: 4, ability: :FLASHFIRE, item: :CHOICESCARF },
        BRAVIARY:    { moves: [:BRAVEBIRD, :SUPERPOWER, :ROCKSLIDE, :UTURN], nature: :ADAMANT, ATTACK: 126, HP: 126, SPEED: 4, ability: :SHEERFORCE }
      },
      hard: {
        VOLCARONA:   { moves: [:QUIVERDANCE, :HEATWAVE, :BUGBUZZ, :PSYCHIC], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :FLAMEBODY, item: :LIFEORB },
        CONKELDURR:  { moves: [:HAMMERARM, :MACHPUNCH, :PAYBACK, :STONEEDGE], nature: :ADAMANT, ATTACK: 252, HP: 252, SPEED: 4, ability: :GUTS, item: :ASSAULTVEST },
        REUNICLUS:   { moves: [:LIGHTSCREEN, :REFLECT, :TOXIC, :PSYCHIC], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :MAGICGUARD, item: :LEFTOVERS },
        KROOKODILE:  { moves: [:EARTHQUAKE, :CRUNCH, :STONEEDGE, :OUTRAGE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOXIE, item: :CHOICEBAND },
        CHANDELURE:  { moves: [:FLAMETHROWER, :SHADOWBALL, :ENERGYBALL, :PSYCHIC], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :FLASHFIRE, item: :CHOICESPECS },
        BRAVIARY:    { moves: [:BRAVEBIRD, :SUPERPOWER, :ROCKSLIDE, :UTURN], nature: :ADAMANT, ATTACK: 252, SPEED: 252, HP: 4, ability: :SHEERFORCE, item: :CHOICEBAND }
      },
      unfair: {
        VOLCARONA:   { moves: [:QUIVERDANCE, :HEATWAVE, :BUGBUZZ, :FIERYDANCE], nature: :TIMID, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :FLAMEBODY, item: :LIFEORB },
        LANDORUS_1:   { moves: [:EARTHQUAKE, :ROCKSLIDE, :KNOCKOFF, :UTURN], nature: :ADAMANT, ATTACK: 252, HP: 252, SPEED: 4, ability: :INTIMIDATE, item: :ASSAULTVEST },
        REUNICLUS:   { moves: [:CALMMIND, :PSYCHIC, :SHADOWBALL, :TRICKROOM], nature: :CALM, HP: 252, SPECIAL_DEFENSE: 252, SPEED: 4, ability: :MAGICGUARD, item: :FOCUSSASH },
        KROOKODILE:  { moves: [:EARTHQUAKE, :CRUNCH, :STONEEDGE, :OUTRAGE], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :MOXIE, item: :LIFEORB },
        CHANDELURE:  { moves: [:SHADOWBALL, :HEATWAVE, :ENERGYBALL, :PSYCHIC], nature: :MODEST, SPECIAL_ATTACK: 252, SPEED: 252, HP: 4, ability: :FLASHFIRE, item: :CHOICESPECS },
        BRAVIARY:    { moves: [:BRAVEBIRD, :SUPERPOWER, :ROCKSLIDE, :UTURN], nature: :JOLLY, ATTACK: 252, SPEED: 252, HP: 4, ability: :SHEERFORCE, item: :CHOICEBAND }
      }
    }
  ]
}

TRAINERS_ALL = [TRAINER_0, TRAINER_1, TRAINER_2, TRAINER_3, TRAINER_4, TRAINER_5, TRAINER_6, TRAINER_7, CHAMPION]

def valid_species?(symbol)
  return false if symbol.nil?
  return false if !symbol.is_a?(Symbol)
  return false if !PBSpecies.constants.include?(symbol)
  true
rescue
  false
end

def valid_move?(symbol)
  return false if symbol.nil?
  return false if !symbol.is_a?(Symbol)
  return false if !PBMoves.constants.include?(symbol)
  true
rescue
  false
end

def valid_ability?(symbol)
  return false if symbol.nil?
  return false if !symbol.is_a?(Symbol)
  return false if !PBAbilities.constants.include?(symbol)
  true
rescue
  false
end

def valid_item?(symbol)
  return false if symbol.nil?
  return false if !symbol.is_a?(Symbol)
  return false if !PBItems.constants.include?(symbol)
  true
rescue
  false
end

def valid_nature?(symbol)
  return false if symbol.nil?
  return false if !symbol.is_a?(Symbol)
  return false if !PBNatures.constants.include?(symbol)
  true
rescue
  false
end

def check_trainer_teams
  return if !$DEBUG
  TRAINERS_ALL.each_with_index do |trainer_hash, idx|
    trainer_hash.each do |trainer, data|
      type, difficulty_hash = data
      difficulty_hash.each do |difficulty, team|
        team.each do |species, details|

          # Check species
          unless GameData::Species.exists?(species)
            puts "[Trainer #{idx}] Invalid species: #{species} (#{trainer}, #{difficulty})"
          end

          # Check moves
          if details[:moves]
            details[:moves].each do |move|
              unless GameData::Move.exists?(move)
                puts "[Trainer #{idx}] Invalid move: #{move} (#{species}, #{trainer}, #{difficulty})"
              end
            end
          end

          # Check ability
          if details[:ability]
            unless GameData::Ability.exists?(details[:ability])
              puts "[Trainer #{idx}] Invalid ability: #{details[:ability]} (#{species}, #{trainer}, #{difficulty})"
            end
          end

          # Check item
          if details[:item] && details[:item] != :NONE
            unless GameData::Item.exists?(details[:item])
              puts "[Trainer #{idx}] Invalid item: #{details[:item]} (#{species}, #{trainer}, #{difficulty})"
            end
          end

          # Check nature
          if details[:nature]
            unless GameData::Nature.exists?(details[:nature])
              puts "[Trainer #{idx}] Invalid nature: #{details[:nature]} (#{species}, #{trainer}, #{difficulty})"
            end
          end

          # Optional: Check EVs are numbers and within 0-255
          [:HP, :ATTACK, :DEFENSE, :SPECIAL_ATTACK, :SPECIAL_DEFENSE, :SPEED].each do |stat|
            ev_val = details[stat] || details["#{stat}_ev".to_sym]
            if ev_val && !(0..255).include?(ev_val)
              puts "[Trainer #{idx}] Invalid EV #{stat}: #{ev_val} (#{species}, #{trainer}, #{difficulty})"
            end
          end

        end
      end
    end
  end

end