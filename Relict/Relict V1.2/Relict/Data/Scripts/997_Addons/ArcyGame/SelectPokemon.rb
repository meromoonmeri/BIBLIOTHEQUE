MAX_DIFFICULTY = 100
CHANCE_SPAWN = [30, 30, 30]

def get_base_stat_total(species)
  base_stats = GameData::Species.get(species).base_stats
  return base_stats.values.sum
end

def generate_encounters(difficulty, pools = nil)
  raise "Difficulty must be between 1 and #{MAX_DIFFICULTY}" if difficulty < 1 || difficulty > MAX_DIFFICULTY

  pools ||= $dungeon_pools
  encounters = []

  available_pokemon = pools[difficulty]
  raise "No Pokémon available for difficulty #{difficulty}" if available_pokemon.nil? || available_pokemon.empty?

  level_range0 = rand(getLevelCap - 8..getLevelCap - 5)
  level_range1 = level_range0 + 2

  common_weight = CHANCE_SPAWN[0]

  available_pokemon.sample(5).each do |pokemon|
    encounters << [common_weight, pokemon, level_range0, level_range1]
  end

  echoln available_pokemon
  return { :Land => encounters }
end

def generate_single_encounter_species(difficulty, pools = nil)
  raise "Difficulty must be between 1 and #{MAX_DIFFICULTY}" if difficulty < 1 || difficulty > MAX_DIFFICULTY

  pools ||= $dungeon_pools
  available_pokemon = pools[difficulty]

  raise "No available Pokémon for difficulty #{difficulty}" if available_pokemon.nil? || available_pokemon.empty?

  return available_pokemon.sample
end

def build_full_difficulty_pools(min_size = 20)
  $dungeon_pools = nil
  pokemon_stats = {}

  GameData::Species.each do |species|
    next unless species.form == 0 || (
      species.form_name && ["Alolan", "Hisuian", "Paldean", "Galarian"].any? { |r| species.form_name.include?(r) }
    )
    next if LEGEND_BLACKLIST.include?(species.id)
    bst = get_base_stat_total(species.id)
    pokemon_stats[species.id] = bst
  end

  sorted = pokemon_stats.sort_by { |_, bst| bst }
  max_index = sorted.length - 1

  pools = {}

  (1..MAX_DIFFICULTY).each do |difficulty|
    slice_index = ((difficulty.to_f / MAX_DIFFICULTY) * max_index).to_i
    half = min_size / 2

    start_index = slice_index
    end_index = slice_index
    while (end_index - start_index + 1) < min_size
      start_index -= 1 if start_index > 0
      end_index += 1 if end_index < max_index
      break if start_index == 0 && end_index == max_index
    end

    pool = sorted[start_index..end_index].map { |pair| pair[0] }
    pool = sorted.map { |pair| pair[0] } if pool.empty?
    pools[difficulty] = pool
  end

  echoln "Encounter pools were loaded."
  $dungeon_pools = pools
end

def pokemon_difficulty_distribution(target_pokemon, min_pool_size = 20)
  distribution = {}

  weight_available = CHANCE_SPAWN[0]
  pools = $dungeon_pools

  (1..MAX_DIFFICULTY).each do |difficulty|
    available = pools[difficulty]
    next if available.nil? || available.empty?

    count_available = available.size
    total_weight = 4 * weight_available

    weight = 0
    weight += 4 * weight_available.to_f / count_available if available.include?(target_pokemon)

    chance = (weight / total_weight) * 100
    distribution[difficulty] = chance.round(3)
  end

  distribution
end

  LEGEND_BLACKLIST = [
  :MELTAN,
  :KUBFU,
  :SHEDINJA,
  :NINCADA,
  :PECHARUNT,
  :GOUGINGFIRE,
  :RAGINGBOLT,
  :IRONBOULDER,
  :IRONCROWN,
  :TERAPAGOS,
  :OKIDOGI,
  :MUNKIDORI,
  :FEZANDIPITI,
  :OGERPON,
  :MELMETAL,
  :MEWTWO,
  :MEW,
  :ARTICUNO,
  :MOLTRES,
  :ZAPDOS,
  :ENTEI,
  :RAIKOU,
  :SUICUNE,
  :HOOH,
  :LUGIA,
  :REGICE,
  :REGISTEEL,
  :REGIROCK,
  :LATIAS,
  :LATIOS,
  :ROTOM,
  :KYOGRE,
  :GROUDON,
  :RAYQUAZA,
  :UXIE,
  :MESPRIT,
  :AZELF,
  :DARKRAI,
  :CRESSELIA,
  :HEATRAN,
  :PALKIA,
  :DIALGA,
  :GIRATINA,
  :REGIGIGAS,
  :MANAPHY,
  :PHIONE,
  :SHAYMIN,
  :VICTINI,
  :COBALION,
  :TERRAKION,
  :VIRIZION,
  :KELDEO,
  :ENAMORUS,
  :RESHIRAM,
  :ZEKROM,
  :KYUREM,
  :LANDORUS,
  :TORNADUS,
  :THUNDURUS,
  :MELOETTA,
  :XERNEAS,
  :YVELTAL,
  :ZYGARDE,
  :MAGEARNA,
  :TAPUBULU,
  :TAPULELE,
  :VOLCANION,
  :MARSHADOW,
  :TAPUFINI,
  :TAPUKOKO,
  :TYPENULL,
  :DIANCIE,
  :ZERAORA,
  :SILVALLY,
  :HOOPA,
  :CELESTEELA,
  :PHEROMOSA,
  :LUNALA,
  :SOLGALEO,
  :NIHILEGO,
  :COSMOG,
  :COSMOEM,
  :NECROZMA,
  :GUZZLORD,
  :BUZZWOLE,
  :XURKITREE,
  :POIPOLE,
  :NAGANADEL,
  :CELEBI,
  :JIRACHI,
  :DEOXYS,
  :ARCEUS,
  :GENESECT,
  :KARTANA,
  :STAKATAKA,
  :BLACEPHALON,
  :ZACIAN,
  :ZAMAZENTA,
  :ETERNATUS,
  :ZARUDE,
  :URSHIFU,
  :REGIELEKI,
  :REGIDRAGO,
  :CALYREX,
  :SPECTRIER,
  :GLASTRIER,
  :GREATTUSK,
  :SCREAMTAIL,
  :BRUTEBONNET,
  :FLUTTERMANE,
  :SLITHERWING,
  :SANDYSHOCKS,
  :IRONTREADS,
  :IRONBUNDLE,
  :IRONHANDS,
  :IRONJUGULIS,
  :IRONMOTH,
  :IRONTHORNS,
  :WOCHIEN,
  :TINGLU,
  :CHIYU,
  :CHIENPAO,
  :ROARINGMOON,
  :IRONVALIANT,
  :KORAIDON,
  :MIRAIDON,
  :IRONLEAVES,
  :WALKINGWAKE
]