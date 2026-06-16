SMODS.current_mod.optional_features = {
  quantum_enhancements = true,
}

QSILLY.base_rarities = {
  "Common",
  "Uncommon",
  "Rare",
  "Legendary"
}

QSILLY.jokers = {
  "bubble", -- Family
  "wisp",
  "hemlock",
  "cobolt",
  "calla",
  "ruko",
  "melody", -- Headmates
  "beepboop",
  "hollo",
	"etherealconnection",
  "byte",
  "argon",
  --"glitch",
  --"torpedo",
  --"loop",
  --"niko",
  --"attente",
  --"james",
  --"aegis",
  --"daedalus",
  --"alexis",
  --"mouse",
  --"unusualArtistic", -- Friends
  --"clarefey",
  --"mollystars",
  --"moisty_mcmoisterson",
  --"girlmario",
  --"spelljammingmercenaries", -- TTRPG Jokers
  --"uncharted_explorers",
  --"knives_of_justice",
  --"lobotomy_hires",
  --"saystone_hunters",
	--"boiwattson", -- PMD Jokers
	--"bootandheel",
	--"brittanyandfraisey",
	--"grovyle",
  --"guildmaster",
  --"dusknoir",
  --"primal_dialga",
  --"mystery_dungeon",
  --"rescue_team",
  --"time_gear",
  --"magnagate",
  --"connection_orb",
  --"personality_quiz",
	--"samanthany", -- PMDND Jokers
	--"carl",
	--"dex",
  --"espa",
	--"snacky", 
	--"apricot",
	--"cocoa",
	--"nevanya",
	--"wonder",
	--"potato", 
	--"moose", -- Misc Jokers
	--"wontbereplaced",
	--"e",
	--"constant",
	--"followed"
	--"dapperslime",
  --"interloper",
	--"emperorcatfish",
}

QSILLY.tags = {
  "front",
}

function QSILLY.register_items(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end

-- why are people still using talisman
to_big = to_big or function(num)
  return num
end
to_number = to_number or function(num)
  return num
end