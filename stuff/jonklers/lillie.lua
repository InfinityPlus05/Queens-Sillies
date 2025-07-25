SMODS.Joker{ --Queen
    name = "Lillie",
    key = "lillie",
    config = {
        extra = {
            slots = 1
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
	
    loc_vars = function(self, info_queue, center)
    return {
      vars = { center.ability.extra.slots }
    }
  end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
	end
	
}