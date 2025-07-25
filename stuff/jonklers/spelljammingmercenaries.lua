SMODS.Joker{ --Spelljamming Mercenaries
    name = "Adventuring Party",
    key = "adventuringparty",
    config = {
        extra = {
			chips = 100,
			mult = 20
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    cost = 6,
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
    -- Main scoring time for jokers
		if context.joker_main then
			local crank1 = nil
			local crank2 = nil
			local crank3 = nil
			local crank4 = nil
			local allchecks = false
			for i = 1, #context.scoring_hand do
	if crank1 == nil then
		crank1 = context.scoring_hand[i]:get_id()
	elseif crank2 == nil then
		if not (crank1 == context.scoring_hand[i]:get_id()) then
			crank2 = context.scoring_hand[i]:get_id()
		end
	elseif crank3 == nil then
		if not (crank1 == context.scoring_hand[i]:get_id()) and not (crank2 == context.scoring_hand[i]:get_id()) then
			crank3 = context.scoring_hand[i]:get_id()
		end
	else
		if not (crank1 == context.scoring_hand[i]:get_id()) and not (crank2 == context.scoring_hand[i]:get_id()) and not (crank3 == context.scoring_hand[i]:get_id()) then
			crank4 = context.scoring_hand[i]:get_id()
			allchecks = true
		end
		
	end
end

		if context.joker_main and allchecks then
            return {
				chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
	end
}