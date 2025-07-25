SMODS.Joker{ --Constant
    name = "Constant",
    key = "constant",
    config = {
        extra = {
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
	

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = {key = 'eternal', set = 'Other'}
		info_queue[#info_queue + 1] = {key = 'qsilly_perishinfo', set = 'Other'}
        return {vars = {}}
    end,
	
	calculate = function(self, card, context)
        if context.selling_self and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit + 1 then
				G.GAME.joker_buffer = G.GAME.joker_buffer + 1
				G.E_MANAGER:add_event(Event({
                            func = function() 
                                SMODS.add_card{set = 'Joker', legendary = true, stickers = {"perishable", "eternal"}}
                                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                                return true
                            end
                        }))
			return nil, true -- This is for Joker retrigger purposes
		end
    end,
}