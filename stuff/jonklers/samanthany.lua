SMODS.Joker{ --Samanthany
    name = "Samanthany",
    key = "samanthany",
    config = {
        extra = {
            type = 'Straight'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize(card.ability.extra.type, 'poker_hands')}}
    end,

    calculate = function(self, card, context)
    if context.before and context.main_eval and next(context.poker_hands[card.ability.extra.type]) and not context.blueprint then
			for _, scored_card in ipairs(context.scoring_hand) do
            scored_card:set_ability('m_lucky', nil, true)
            G.E_MANAGER:add_event(Event({
                func = function()
                    scored_card:juice_up()
                    return true
                end
            }))
			end

            return {
                message = 'Bingo!',
                colour = G.C.MONEY
            }
    end
end
}