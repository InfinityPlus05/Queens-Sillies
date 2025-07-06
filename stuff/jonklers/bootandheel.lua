SMODS.Joker{ --Boot and Heel
    name = "Boot and Heel",
    key = "bootandheel",
    config = {
        extra = {
            mult = 5
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        -- Individual card held in hand
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            if (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Clubs")) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}