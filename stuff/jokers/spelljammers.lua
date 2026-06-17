SMODS.Joker{ --Spelljamming Mercenaries
    name = "Spelljammers",
    key = "adventuringparty",
    config = {
        extra = {
			chips = 25,
			mult = 5
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {
		card.ability.extra.chips, card.ability.extra.mult
            }}
    end,

    calculate = function(self, card, context)
		if context.joker_main then
			local unique_ranks = {}
				for i, v in pairs(context.scoring_hand) do
					if not (SMODS.has_no_rank(v) and not v.vampired) then
						local not_unique = false
						for i = 1, #unique_ranks do
							if unique_ranks[i] == v:get_id() then
								not_unique = true
							end
						end
						if not not_unique then
							unique_ranks[#unique_ranks + 1] = v:get_id()
						end
					end
				end

			return {
				chips = card.ability.extra.chips * #unique_ranks,
				mult = card.ability.extra.mult * #unique_ranks
			}
		end
	end
}