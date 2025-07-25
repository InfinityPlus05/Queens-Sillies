SMODS.Joker{ --Queen
    name = "Queen",
    key = "queen",
    config = {
        extra = {
            
        }
    },
    pos = {
        x = 0,
        y = 1
    },
	soul_pos = { x = 0, y = 2 },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = {}}
    end,
	calculate = function(self, card, context)
    -- When hand is drawn
    if context.debuff_card and context.debuff_card:get_id() == 12 then
     return {prevent_debuff = true}
end    
	
		if context.check_enhancement and context.other_card.base.id == 12 then
			return {m_wild = true, m_lucky = true}
		end
	end
}