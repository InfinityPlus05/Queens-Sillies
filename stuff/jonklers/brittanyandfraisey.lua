SMODS.Joker{ --Brittany and Fraisey
    name = "Brittany and Fraisey",
    key = "brittanyandfraisey",
    config = {
        extra = {
            chips = 15
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        -- Individual card held in hand
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            if (context.other_card:is_suit("Diamonds") or context.other_card:is_suit("Spades")) then
                return {
                    chips = card.ability.extra.chips--,
                    --message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}
                }
            end
        end
    end
}