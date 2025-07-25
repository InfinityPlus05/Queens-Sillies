SMODS.Joker{ --Cocoa
    name = "Cocoa",
    key = "cocoa",
    config = {
        extra = {
            oddsholo = 4,
			oddsdie = 10
        }
    },
    
    pos = {
        x = 6,
        y = 2
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
	
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.oddsholo, card.ability.extra.oddsdie } }
    end,
	
    calculate = function(self, card, context)
    -- Individual card scoring
    if context.individual and context.cardarea == G.play and pseudorandom('makeupppppp') < G.GAME.probabilities.normal / card.ability.extra.oddsholo then
        -- Check conditions for this rule
				context.other_card:set_edition("e_holo", true)
            
            return {
                message = "Stylish!",
                colour = G.C.BLUE
            }
        end
	if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and pseudorandom('makeupppppp') < G.GAME.probabilities.normal / card.ability.extra.oddsdie then
		G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card:start_dissolve()
                        return true
                    end
                }))
			return {
                    message ='Beauty is pain...',
                    colour = G.C.BLUE
                }
		
	end
end
}
