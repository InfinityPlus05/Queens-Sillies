SMODS.Joker{ --Followed
    name = "Followed",
    key = "followed",
    config = {
        extra = {
            Xmult = 0.75,
			totalrounds = 4,
			currentrounds = 0,
			numjokers = 4
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, card.ability.extra.totalrounds, card.ability.extra.numjokers, card.ability.extra.currentrounds}}
    end,

    calculate = function(self, card, context)
        -- Main scoring time for jokers
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult,
                    --message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}}
                }
        end
		
		if context.selling_self then
			local ignoreone = true
			for i = 1, card.ability.extra.numjokers do
				if (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) or ignoreone then
				G.GAME.joker_buffer = G.GAME.joker_buffer + 1
				ignoreone = false
				G.E_MANAGER:add_event(Event({
                            func = function() 
                                SMODS.add_card{set = 'Joker', rarity = 3}
                                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                                return true
                            end
                        }))
						end
					end
			return nil, true -- This is for Joker retrigger purposes
		end
		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.currentrounds = card.ability.extra.currentrounds + 1
            if card.ability.extra.currentrounds == card.ability.extra.totalrounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
			if card.ability.extra.currentrounds <= 1 then
            return {
                message = "Is this destiny?",
                colour = G.C.ORANGE
            }
			elseif card.ability.extra.currentrounds == 2 then
			return {
                message = "These endless cycles...",
                colour = G.C.BLUE
            }
			elseif card.ability.extra.currentrounds == 3 then
			return {
                message = "Dreams of watching stars...",
                colour = G.C.YELLOW
            }
			elseif card.ability.extra.currentrounds >= 4 then
			return {
                message = "NOTHING STOPS ME FROM FINISHING MY SONG!",
                colour = G.C.RED
            }
			end
        end
    end
}