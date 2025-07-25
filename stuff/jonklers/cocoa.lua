SMODS.Joker{ --Cocoa
    name = "Cocoa",
    key = "cocoa",
    config = {
        extra = {
            oddsholo = 4,
			oddsdie = 10,
            numerator = 1
        }
    },
    
    pos = {
        x = 6,
        y = 2
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
	
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominatorholo = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.oddsholo, 'cocoholo')
        local new_numerator, new_denominatordie = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.oddsdie, 'cocodie')
        return {vars = {new_numerator, new_denominatorholo, new_denominatordie}}
    end,
	
    calculate = function(self, card, context)
    if context.before and context.main_eval and not context.blueprint then
            local seals = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(card, 'makeupppppp', card.ability.extra.numerator, card.ability.extra.oddsholo, 'cocoholo') and not scored_card.edition and not scored_card.debuff then
                    seals = seals + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:set_edition("e_holo", true)
                            scored_card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
            end
            if seals > 0 then
                return {
                message = "Stylish!",
                colour = G.C.BLUE
                }
            end
        end
	if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and SMODS.pseudorandom_probability(card, 'makeuppppppbutsadface', card.ability.extra.numerator, card.ability.extra.oddsdie, 'cocodie')  then
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
