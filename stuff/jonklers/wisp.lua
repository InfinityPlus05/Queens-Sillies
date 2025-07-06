SMODS.Joker { -- Wisp
	name = "Wisp",
    key = "wisp",
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
	unlocked = true,
    discovered = true,
    pos = { x = 3, y = 0 },
	soul_pos = { x = 3, y = 1 },
	atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local other_other_joker
            for i = 2, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_other_joker = G.jokers.cards[i - 1] end
            end
            local compatible = other_other_joker and other_other_joker ~= card and other_other_joker.config.center.blueprint_compat
			
			local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
            end
            local compatible2 = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and compatible2 and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or compatible and not compatible2 and mix_colours(G.C.YELLOW, G.C.JOKER_GREY, 0.8) or not compatible and compatible2 and mix_colours(G.C.YELLOW, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
								{ n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible2 and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } }
                            }
                        }
                    }
                }
            }
            return { main_end = main_end }
        end
    end,
    calculate = function(self, card, context)
        local other_joker = nil
		local other_other_joker = nil
		for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_other_joker = G.jokers.cards[i - 1] end
        end
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
        end
		local x = SMODS.blueprint_effect(card, other_other_joker, context)
		local y = SMODS.blueprint_effect(card, other_joker, context)
		return SMODS.merge_effects({x, y})
    end
}