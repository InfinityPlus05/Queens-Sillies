SMODS.Joker{ --Cobolt
    name = "Cobolt",
    key = "cobolt",
    config = {
        extra = {
            xmult = 2
        }
    },
    pos = {
        x = 4,
        y = 0
    },
	soul_pos = { x = 4, y = 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    enhancement_gate = 'm_steel',
	
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        return {vars = {card.ability.extra.xmult}}
    end,
	
	
    calculate = function(self, card, context)
    
    if context.cardarea == G.jokers and context.before then
        local polychrome_triggered = false
        for k, v in pairs(context.scoring_hand) do
            if not v.edition and SMODS.has_enhancement(v,'m_steel') then
                polychrome_triggered = true
                v:set_edition('e_polychrome')
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        return true
                    end
                }))
            end
        end
        if polychrome_triggered then 
            return {
                message = localize('qsilly_polychrome'),
                colour = G.C.DARK_EDITION,
                card = card
            }
        end
    end
    
    if context.individual and context.cardarea == G.play then
        if SMODS.has_enhancement(context.other_card,'m_steel') then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
end
}