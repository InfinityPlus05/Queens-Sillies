SMODS.Joker{ --Nevanya
    name = "Nevanya",
    key = "nevanya",
    config = {
        extra = {
            timetoretrigger = false,
            repetitions = 1
        }
    },
    
    pos = {
        x = 9,
        y = 2
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        -- Card repetition context for held cards
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
            if (SMODS.get_enhancements(context.other_card)["m_steel"] == true) and card.ability.extra.timetoretrigger then
				card.ability.extra.timetoretrigger = false
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
			else
				card.ability.extra.timetoretrigger = true
            end
        end
    end
}