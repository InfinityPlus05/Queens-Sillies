SMODS.Joker{ --Dex
    name = "Dex",
    key = "dex",
    config = {
        extra = {
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		info_queue[#info_queue + 1] = {key = 'qsilly_perishinfo', set = 'Other'}
        info_queue[#info_queue + 1] = G.P_CENTERS.j_oops
    end,

    calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
            if G.GAME.current_round.hands_played <= 1 and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
				G.GAME.joker_buffer = G.GAME.joker_buffer + 1
				G.E_MANAGER:add_event(Event({
                            func = function() 
                                SMODS.add_card{set = 'Joker', key ='j_oops', edition = "e_negative", stickers = {"perishable"}}
                                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                                return true
                            end
                        }))
				return {
						message ='Critical Hit!',
						colour = G.C.GREEN,
						card = self
						}
					end
				end
    end
}