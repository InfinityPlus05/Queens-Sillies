SMODS.Joker{ --Boi and Wattson
    name = "Boi and Wattson",
    key = "boiandwattson",
    config = {
        extra = {
            mult = 20
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
    -- Main scoring time for jokers
    if context.cardarea == G.jokers and context.joker_main then
        -- Check conditions for this rule
        if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 11 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) and ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 13 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                colour = G.C.MULT
            }
        end
    end
end
}