SMODS.Joker{ --Cobalt
    name = "Cobalt",
    key = "cobalt",
    config = {
        extra = {
            
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
    discovered = true,
    atlas = 'CustomJokers',
	
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return {vars = {}}
    end,
	
	in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_gold'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end,
	
    calculate = function(self, card, context)
    -- Individual card scoring
    if context.individual and context.cardarea == G.play then
        -- Check conditions for this rule
        if (SMODS.get_enhancements(context.other_card)["m_steel"] == true) then
            -- Pre-return code execution
            -- Set new seal
			local x = math.random(1, 4)
			if (x == 1) then
                context.other_card:set_seal("Red", true)
			elseif (x == 2) then
				context.other_card:set_seal("Blue", true)
			elseif (x == 3) then
				context.other_card:set_seal("Gold", true)
			else
				context.other_card:set_seal("Purple", true)
			end
                -- Set new edition
			x = math.random(1, 4)
			if (x == 1) then
                context.other_card:set_edition("e_negative", true)
			elseif (x == 2) then
				context.other_card:set_edition("e_foil", true)
			elseif (x == 3) then
				context.other_card:set_edition("e_holo", true)
			else
				context.other_card:set_edition("e_polychrome", true)
			end
            
            return {
                message = "Upgrade!",
                colour = G.C.BLUE
            }
        end
    end
end
}