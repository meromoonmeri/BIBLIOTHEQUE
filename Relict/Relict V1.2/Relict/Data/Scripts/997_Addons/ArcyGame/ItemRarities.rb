# common, normal, rare, super rare, legendary,
# add manually -> any MT, any evolution stone item, berries, gems, megastones
# ITEM_ARRAY_FULL = COMMON_ITEMS + NORMAL_ITEMS + RARE_ITEMS + SUPERRARE_ITEMS + LEGENDARY_ITEMS + EVOLUTION_ITEMS + NICHE_ITEMS + ULTRA_NICHE_ITEMS
#ITEM_ARRAY_FULL

def getInitialItemArrays
  $items_TM = []
  $items_berries = []
  $items_evolution = []
  $items_megastones = []
  $items_gems = []
  $items_balls = []
  $items_battle_use = []
  $items_healing = []
  $items_hold = []
  GameData::Item.each do |i|
    $items_TM.push(i.id) if i.is_TM? || i.is_TR?
    $items_berries.push(i.id) if i.is_berry?
    $items_evolution.push(i.id) if i.is_evolution_stone?
    $items_megastones.push(i.id) if i.is_mega_stone?
    $items_gems.push(i.id) if i.is_gem?
    $items_balls.push(i.id) if i.is_poke_ball? && ITEM_ARRAY_FULL.include?(i.id)
    $items_battle_use.push(i.id) if i.pocket == 7 && ITEM_ARRAY_FULL.include?(i.id)
    $items_healing.push(i.id) if i.pocket == 2 && ITEM_ARRAY_FULL.include?(i.id)
  end
  $items_hold = ITEM_ARRAY_FULL - ($items_TM + $items_berries + $items_evolution + $items_megastones + $items_gems + $items_balls + $items_battle_use + $items_healing)
  echoln "Items were loaded."
end

def getSampleItem(array)
  rarities = {
    COMMON_ITEMS => 40,
    NORMAL_ITEMS => 30,
    RARE_ITEMS => 20,
    SUPERRARE_ITEMS => 9,
    LEGENDARY_ITEMS => 1,
  }

  maxFloor = 100
  floor = [$PokemonGlobal.dungeonFloor.clone, maxFloor].min

  weighted_items = []

  array.each do |item|
    matched = false

    rarities.each do |rarity_array, base_weight|
      if rarity_array.include?(item)
        weight = case rarity_array
                 when COMMON_ITEMS then base_weight - (floor * 0.1)
                 when NORMAL_ITEMS then base_weight
                 when RARE_ITEMS then base_weight + (floor * 0.1)
                 when SUPERRARE_ITEMS then base_weight + (floor * 0.2)
                 when LEGENDARY_ITEMS then base_weight + (floor * 0.3)
                 end

        weight = [weight, 0.1].max # Avoid zero or negative weights
        weighted_items << [item, weight]
        matched = true
        break
      end
    end

    # If item is not in any rarity array, treat it as common with low weight
    unless matched
      weighted_items << [item, 5] # fallback weight
    end
  end

  total_weight = weighted_items.sum { |item, weight| weight }

  # Guaranteed to not return nil now
  target = rand * total_weight
  sum = 0

  weighted_items.each do |item, weight|
    sum += weight
    return item if target < sum
  end

  # Fallback (shouldn't be hit, but just in case)
  return array.sample
end

COMMON_ITEMS = [
  :POKEBALL,
  :HISUIANPOKEBALL,
  :NETBALL,
  :HEALBALL,
  :LOVEBALL,
  :DREAMBALL,
  :SITRUSBERRY,
  :LUMBERRY,
  :TINYMUSHROOM,
  :AIRBALLOON,
  :FLOATSTONE,
  :DESTINYKNOT,
  :SMOKEBALL,
  :SOOTHEBELL,
  :HEATROCK,
  :DAMPROCK,
  :SMOOTHROCK,
  :ICYROCK,
  :GRIPCLAW,
  :BINDINGBAND,
  :LAGGINGTAIL,
  :SEAINCENSE,
  :WAVEINCENSE,
  :ROSEINCENSE,
  :ODDINCENSE,
  :ROCKINCENSE,
  :CHARCOAL,
  :MYSTICWATER,
  :MAGNET,
  :MIRACLESEED,
  :NEVERMELTICE,
  :BLACKBELT,
  :POISONBARB,
  :SOFTSAND,
  :SHARPBEAK,
  :TWISTEDSPOON,
  :SILVERPOWDER,
  :HARDSTONE,
  :SPELLTAG,
  :DRAGONFANG,
  :BLACKGLASSES,
  :METALCOAT,
  :SILKSCARF,
  :FAIRYFEATHER,
  :POTION,
  :SUPERPOTION,
  :AWAKENING,
  :ANTIDOTE,
  :BURNHEAL,
  :PARALYZEHEAL,
  :ICEHEAL,
  :ETHER,
  :MAXETHER,
  :EXPCANDYXS
]

NORMAL_ITEMS = [
  :GREATBALL,
  :HISUIANGREATBALL,
  :TIMERBALL,
  :FASTBALL,
  :LEVELBALL,
  :HEAVYBALL,
  :XATTACK,
  :XDEFENSE,
  :XSPATK,
  :XSPDEF,
  :XSPEED,
  :XACCURACY,
  :DIREHIT,
  :GUARDSPEC,
  # :RESETURGE,
  # :ABILITYURGE,
  # :ITEMURGE,
  # :ITEMDROP,
  :POKETOY,
  :BLUEFLUTE,
  :REDFLUTE,
  :YELLOWFLUTE,
  :EJECTPACK,
  :REDCARD,
  :SHEDSHELL,
  :TERRAINEXTENDER,
  :LIGHTCLAY,
  :SNOWBALL,
  :ADRENALINEORB,
  :WIDELENS,
  :ZOOMLENS,
  :FLAMEORB,
  :TOXICORB,
  :STICKYBARB,
  :IRONBALL,
  :FULLINCENSE,
  :LUCKINCENSE,
  :MIRRORHERB,
  :PUNCHINGGLOVE,
  :SUPERPOTION,
  :FULLHEAL,
  :LAVACOOKIE,
  :PEWTERCRUNCHIES,
  :RAGECANDYBAR,
  :OLDGATEAU,
  :CASTELIACONE,
  :LUMIOSEGALETTE,
  :SHALOURSABLE,
  :BIGMALASADA,
  :MOOMOOMILK,
  :ENERGYROOT,
  :ELIXIR,
  :MAXELIXIR,
  :EXPCANDYS,
  :EXPCANDYM
]

RARE_ITEMS = [
  :ULTRABALL,
  :HISUIANULTRABALL,
  :QUICKBALL,
  :REDSHARD,
  :BLUESHARD,
  :YELLOWSHARD,
  :GREENSHARD,
  :BIGMUSHROOM,
  :PEARL,
  :NUGGET,
  :RAREBONE,
  :SLOWPOKETAIL,
  :RELICCOPPER,
  :SAFETYGOGGLES,
  :UTILITYUMBRELLA,
  :EJECTBUTTON,
  :LUCKYEGG,
  :BIGROOT,
  :BLACKSLUDGE,
  :LEFTOVERS,
  :SHELLBELL,
  :MENTALHERB,
  :WHITEHERB,
  :POWERHERB,
  :ABSORBBULB,
  :CELLBATTERY,
  :LUMINOUSMOSS,
  :WEAKNESSPOLICY,
  :BLUNDERPOLICY,
  :THROATSPRAY,
  :METRONOME,
  :MUSCLEBAND,
  :WISEGLASSES,
  :KINGSROCK,
  :RAZORFANG,
  :QUICKCLAW,
  :FOCUSSASH,
  :COVERTCLOAK,
  :LOADEDDICE,
  :GIMMIGHOULCOIN,
  :HYPERPOTION,
  :MAXPOTION,
  :FULLRESTORE,
  :REVIVE,
  :HPUP,
  :PROTEIN,
  :IRON,
  :CALCIUM,
  :ZINC,
  :CARBOS,
  :EXPCANDYL
]

SUPERRARE_ITEMS = [
  :ORIGINBALL,
  :STRANGEBALL,
  :BEASTBALL,
  :MAXMUSHROOMS,
  :BALMMUSHROOM,
  :BIGPEARL,
  :PEARLSTRING,
  :STARDUST,
  :STARPIECE,
  :COMETSHARD,
  :BIGNUGGET,
  :RELICSILVER,
  :EVIOLITE,
  :ROCKYHELMET,
  :ASSAULTVEST,
  :PROTECTIVEPADS,
  :HEAVYDUTYBOOTS,
  :CHOICEBAND,
  :CHOICESPECS,
  :CHOICESCARF,
  :ROOMSERVICE,
  :LIFEORB,
  :EXPERTBELT,
  :SCOPELENS,
  :FOCUSBAND,
  :ABILITYSHIELD,
  :CLEARAMULET,
  :SACREDASH,
  :MAXREVIVE,
  :REVIVALHERB,
  :LONELYMINT,
  :ADAMANTMINT,
  :NAUGHTYMINT,
  :BRAVEMINT,
  :BOLDMINT,
  :IMPISHMINT,
  :LAXMINT,
  :RELAXEDMINT,
  :MODESTMINT,
  :MILDMINT,
  :RASHMINT,
  :QUIETMINT,
  :CALMMINT,
  :GENTLEMINT,
  :CAREFULMINT,
  :SASSYMINT,
  :TIMIDMINT,
  :HASTYMINT,
  :JOLLYMINT,
  :NAIVEMINT,
  :SERIOUSMINT,
  :EXPCANDYXL,
  :RARECANDY,
  :HEALTHMOCHI,
  :MUSCLEMOCHI,
  :RESISTMOCHI,
  :GENIUSMOCHI,
  :CLEVERMOCHI,
  :SWIFTMOCHI
]

LEGENDARY_ITEMS = [
  :MASTERBALL,
  :AMULETCOIN,
  :RELICCROWN,
  :RELICSTATUE,
  :RELICBAND,
  :RELICVASE,
  :RELICGOLD,
  :ABILITYCAPSULE,
  :ABILITYPATCH
]

EVOLUTION_ITEMS = [
    :DEEPSEATOOTH,
    :DEEPSEASCALE,
    :DRAGONSCALE,
    :UPGRADE,
    :DUBIOUSDISC,
    :PROTECTOR,
    :ELECTIRIZER,
    :MAGMARIZER,
    :PRISMSCALE,
    :OVALSTONE,
    :WHIPPEDDREAM,
    :SACHET,
    :LEADERSCREST
]

NICHE_ITEMS = [
    :REDNECTAR,
    :YELLOWNECTAR,
    :PINKNECTAR,
    :PURPLENECTAR,
    :LIGHTBALL,
    :LUCKYPUNCH,
    :METALPOWDER,
    :QUICKPOWDER,
    :THICKCLUB,
    :LEEK,
    :SOULDEW,
    :RUSTEDSWORD,
    :RUSTEDSHIELD,
    :ADAMANTCRYSTAL,
    :LUSTROUSGLOBE,
    :GRISEOUSCORE,
    :BOOSTERENERGY,
    :WELLSPRINGMASK,
    :HEARTHFLAMEMASK,
    :CORNERSTONEMASK
]

ULTRA_NICHE_ITEMS = [
    :DOUSEDRIVE,
    :SHOCKDRIVE,
    :BURNDRIVE,
    :CHILLDRIVE,
    :FIREMEMORY,
    :WATERMEMORY,
    :ELECTRICMEMORY,
    :GRASSMEMORY,
    :ICEMEMORY,
    :FIGHTINGMEMORY,
    :POISONMEMORY,
    :GROUNDMEMORY,
    :FLYINGMEMORY,
    :PSYCHICMEMORY,
    :BUGMEMORY,
    :ROCKMEMORY,
    :GHOSTMEMORY,
    :DRAGONMEMORY,
    :DARKMEMORY,
    :STEELMEMORY,
    :FAIRYMEMORY,
    :STRAWBERRYSWEET,
    :LOVESWEET,
    :BERRYSWEET,
    :CLOVERSWEET,
    :FLOWERSWEET,
    :STARSWEET,
    :RIBBONSWEET
]

ITEM_ARRAY_FULL = COMMON_ITEMS + NORMAL_ITEMS + RARE_ITEMS + SUPERRARE_ITEMS + LEGENDARY_ITEMS + EVOLUTION_ITEMS + NICHE_ITEMS + ULTRA_NICHE_ITEMS
