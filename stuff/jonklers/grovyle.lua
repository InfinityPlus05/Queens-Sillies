SMODS.Joker{ --Gro-vee-lae
    name = "Groveelae",
    key = "groveelae",
    config = {
        extra = {
			currentmult = 1,
			extramult = 0.5
        }
    },
    pos = {
        x = 1,
        y = 2
    },
	
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.extramult, card.ability.extra.currentmult}}
		
    end,
	
	
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
		if G.jokers.cards[1].ability.eternal and G.jokers.cards[1] ~= card then
				G.jokers.cards[1].ability.eternal = false
				card.ability.extra.currentmult = card.ability.extra.extramult + card.ability.extra.currentmult
				return {
                    message = "Time Gear Returned!",
                    colour = G.C.GREEN
                }
			end
		end
		
		if context.cardarea == G.jokers and context.joker_main and card.ability.extra.currentmult ~= 1 then
			return {
                mult_mod = card.ability.extra.currentmult,
                message = "X"..card.ability.extra.currentmult.." Mult",
                colour = G.C.MULT
            }
		end
	end,
}