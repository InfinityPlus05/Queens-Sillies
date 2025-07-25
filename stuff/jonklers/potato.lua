SMODS.Joker{ --Potato
    name = "Potato",
    key = "potato",
    config = {
        extra = {
            basechips = 5,
            addchips = 5,
			numrankscored = -1,
			currentrank = nil
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.basechips, card.ability.extra.addchips, card.ability.extra.numrankscored, card.ability.extra.currentrank}}
    end,

    calculate = function(self, card, context)
        -- Individual card scoring
        if context.individual and context.cardarea == G.play then--[[
			if not context.other_card:get_id() == (card.ability.extra.currentrank) then
				card.ability.extra.numrankscored = -1
			end]]--
			card.ability.extra.currentrank = context.other_card:get_id()
			if not context.blueprint then
				card.ability.extra.numrankscored = card.ability.extra.numrankscored + 1
			end
			return { chips = card.ability.extra.basechips + card.ability.extra.addchips * card.ability.extra.numrankscored }
        end
		
		if context.after and not context.blueprint then
			card.ability.extra.numrankscored = -1
		end
    end
}