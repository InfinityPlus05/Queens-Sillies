SMODS.Joker{ --Wonder
    name = "Wonder",
    key = "wonder",
    config = {
        extra = {
			has_first = false,
			has_second = false
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_photograph
		local wonder_card1 = G.GAME.current_round.wonder_card1 or { rank = 'Ace', suit = 'Spades' }
		local wonder_card2 = G.GAME.current_round.wonder_card2 or { rank = 'Queen', suit = 'Hearts' }
        return { vars = {localize(wonder_card1.rank, 'ranks'), localize(wonder_card1.suit, 'suits_plural'), localize(wonder_card2.rank, 'ranks'), localize(wonder_card2.suit, 'suits_plural'), colours = { G.C.SUITS[wonder_card1.suit], G.C.SUITS[wonder_card2.suit]}, card.ability.extra.has_first, card.ability.extra.has_second } }
    end,
	
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == G.GAME.current_round.wonder_card1.id and context.other_card:is_suit(G.GAME.current_round.wonder_card1.suit) then
				card.ability.extra.has_first = true
			end
			if context.other_card:get_id() == G.GAME.current_round.wonder_card2.id and context.other_card:is_suit(G.GAME.current_round.wonder_card2.suit) then
				card.ability.extra.has_second = true
			end
		end
		
		if context.end_of_round and context.cardarea == G.jokers then
			if card.ability.extra.has_first and card.ability.extra.has_second and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
				G.GAME.joker_buffer = G.GAME.joker_buffer + 1
				G.E_MANAGER:add_event(Event({
                            func = function() 
                                SMODS.add_card{set = 'Joker', key ='j_photograph'}
                                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                                return true
                            end
                        }))
				card.ability.extra.has_first = false
				card.ability.extra.has_second = false
				return {
						message ='Smile for the camera!',
						colour = G.C.BLUE,
						card = self
						}
					end
				
		end
    end,
}

local function reset_wonder_cards()
    G.GAME.current_round.wonder_card1 = { rank = 'Ace', suit = 'Spades' }
	G.GAME.current_round.wonder_card2 = { rank = 'Queen', suit = 'Hearts' }
    local valid_wonder_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_wonder_cards[#valid_wonder_cards + 1] = playing_card
        end
    end
    local wonder_card = pseudorandom_element(valid_wonder_cards, 'smileforthecamera' .. G.GAME.round_resets.ante)
    if wonder_card then
        G.GAME.current_round.wonder_card1.rank = wonder_card.base.value
        G.GAME.current_round.wonder_card1.suit = wonder_card.base.suit
        G.GAME.current_round.wonder_card1.id = wonder_card.base.id
    end
	wonder_card = pseudorandom_element(valid_wonder_cards, 'orelseimgonnagetyouteehee:3' .. G.GAME.round_resets.ante)
    if wonder_card then
        G.GAME.current_round.wonder_card2.rank = wonder_card.base.value
        G.GAME.current_round.wonder_card2.suit = wonder_card.base.suit
        G.GAME.current_round.wonder_card2.id = wonder_card.base.id
    end
end
function SMODS.current_mod.reset_game_globals(run_start)
    reset_wonder_cards()
end