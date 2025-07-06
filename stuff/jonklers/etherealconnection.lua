SMODS.Joker{ --Ethereal Connection
    name = "Ethereal Connection",
    key = "etherealconnection",
    config = {
        extra = {
			hand_size_gain = 1,
			count = 0,
			in_build = false
        }
    },
    
    pos = {
        x = 5,
        y = 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
		if G.consumeables ~= nil and G.consumeables.config ~= nil then
			card.ability.extra.count = 0
			for _, consumable in ipairs(G.consumeables.cards) do
				if consumable.ability.set == "Tarot" then
					card.ability.extra.count = card.ability.extra.count + 1
				end
			end
			return { vars = { card.ability.extra.hand_size_gain, card.ability.extra.count * card.ability.extra.hand_size_gain } }
		else
			return { vars = { card.ability.extra.hand_size_gain, 0} }
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.count = 0
		for _, consumable in ipairs(G.consumeables.cards) do
				if consumable.ability.set == "Tarot" then
					card.ability.extra.count = card.ability.extra.count + 1
				end
			end
		card.ability.extra.in_build = true
		G.hand:change_size((card.ability.extra.count * card.ability.extra.hand_size_gain))
	end,
	update = function(self, card, dt)
		if card.ability.extra.in_build then
			local doublecheck = 0
			for _, consumable in ipairs(G.consumeables.cards) do
				if consumable.ability.set == "Tarot" then
					doublecheck = doublecheck + 1
				end
			end
			if card.ability.extra.count ~= doublecheck then
				G.hand:change_size(doublecheck - card.ability.extra.count)
				card.ability.extra.count = doublecheck
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		card.ability.extra.count = 0
		for _, consumable in ipairs(G.consumeables.cards) do
				if consumable.ability.set == "Tarot" then
					card.ability.extra.count = card.ability.extra.count + 1
				end
			end
		G.hand:change_size(-(card.ability.extra.count * card.ability.extra.hand_size_gain))
		card.ability.extra.in_build = false
	end,
}
