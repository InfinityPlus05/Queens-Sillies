SMODS.Joker{ --Won't Be Replaced
    name = "Won't Be Replaced",
    key = "wontbereplaced",
    config = {
        extra = {
			currentrank = nil
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.currentrank}}
    end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and context.other_card == context.scoring_hand[1] and G.GAME.current_round.hands_played == 0 then
			card.ability.extra.currentrank = context.other_card:get_id()
		end
		if context.destroying_card and context.destroying_card.area == G.play and not context.blueprint then
			if (context.destroying_card:get_id() == card.ability.extra.currentrank) and context.destroying_card ~= context.scoring_hand[1] then
				return {
					message = "Faker...",
					colour = G.C.BLUE,
					delay = 0.45,
					remove = true,
					card = card
				}
			end
		end
	end
}
