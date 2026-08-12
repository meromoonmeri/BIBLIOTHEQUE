
VOICEHASH = {

  "Arcy" => [
    ["ArcyConfused", :confused],
    ["ArcyCurious", :curious],
    ["ArcyHaha", :laugh],
    ["ArcyHahaha", :laughAlt],
    ["ArcyHeh", :happy],
    ["ArcyNod", :nod],
    ["ArcySurprise", :surprise],
  ],

  "Aus" => [
    ["AusSumimasen", :sorry],
    ["AusAre", :question],
    ["AusConfused", :confused],
    ["AusNod", :nod]
  ],

  "Remi" => [
    ["RemiHaha", :haha],
    ["RemiHey", :hey],
    ["RemiNah", :nah],
    ["RemiCough", :cough],
    ["RemiNod", :nod]
  ],

  "Cogita" => [
    ["CogitaSigh", :sigh],
    ["CogitaThink", :think]
  ],

}

def voice(chara, symbol)
    return unless chara == "Arcy" && [:laugh, :laughAlt].include?(symbol) || chara == "Remi" && [:cough].include?(symbol)
    list = VOICEHASH[chara]
    return unless list
    entry = list.find { |name, sym| sym == symbol }
    return unless entry
    filename = entry[0]
    pbSEPlay("\\Voices\\#{chara}\\#{filename}")
end