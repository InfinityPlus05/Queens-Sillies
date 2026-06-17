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
  "glitch",
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

local function reset_qsilly_wonder_cards()
  G.GAME.current_round.qsilly_wonder_card1 = { rank = 'Ace', suit = 'Spades' }
  G.GAME.current_round.qsilly_wonder_card2 = { rank = 'Queen', suit = 'Hearts' }
  local valid_wonder_cards = {}
  for _, playing_card in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
      valid_wonder_cards[#valid_wonder_cards + 1] = playing_card
    end
  end
  local wonder_card = pseudorandom_element(valid_wonder_cards, 'qsilly_wonder1' .. G.GAME.round_resets.ante)
  if wonder_card then
    G.GAME.current_round.qsilly_wonder_card1.rank = wonder_card.base.value
    G.GAME.current_round.qsilly_wonder_card1.suit = wonder_card.base.suit
    G.GAME.current_round.qsilly_wonder_card1.id = wonder_card.base.id
  end
  wonder_card = pseudorandom_element(valid_wonder_cards, 'qsilly_wonder2' .. G.GAME.round_resets.ante)
  if wonder_card then
    G.GAME.current_round.qsilly_wonder_card2.rank = wonder_card.base.value
    G.GAME.current_round.qsilly_wonder_card2.suit = wonder_card.base.suit
    G.GAME.current_round.qsilly_wonder_card2.id = wonder_card.base.id
  end
end

local function reset_qsilly_glitch_card()
  G.GAME.current_round.qsilly_castle_card = { suit = 'Spades' }
    local valid_castle_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
      if not SMODS.has_no_suit(playing_card) then
        valid_castle_cards[#valid_castle_cards + 1] = playing_card
      end
    end
    local castle_card = pseudorandom_element(valid_castle_cards,
        'vremade_castle' .. G.GAME.round_resets.ante)
    if castle_card then
      G.GAME.current_round.qsilly_castle_card.suit = castle_card.base.suit
    end
end

function SMODS.current_mod.reset_game_globals(run_start)
  reset_qsilly_glitch_card()
  reset_qsilly_wonder_cards()
end
