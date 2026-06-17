SMODS.Joker{ 
    name = "GLITCH",
    key = "glitch",
    config = {
        extra = {
            minChips = 1,
            minMult = 1,
            minXMult = 1,
            minDollars = 1,
            maxChips = 25,
            maxMult = 5,
            maxXMult = 1.25,
            maxDollars = 3
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.qsilly_castle_card or {}).suit or 'Spades'
        local fake1 = pseudorandom('GLITCH', card.ability.extra.minChips, card.ability.extra.maxChips)
        local fake2 = pseudorandom('GLITCH', card.ability.extra.minMult, card.ability.extra.maxMult)
        local fake3 = pseudorandom('GLITCH', card.ability.extra.minXMult * 100, card.ability.extra.maxXMult * 100) / 100
        local fake4 = pseudorandom('GLITCH', card.ability.extra.minDollars, card.ability.extra.maxDollars)
        return {vars = {localize(suit, 'suits_plural'):upper(), fake1, fake2, fake3, fake4, colours = { G.C.SUITS[(G.GAME.current_round.qsilly_castle_card or {}).suit or 'Spades'] }}}
    end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit((G.GAME.current_round.qsilly_castle_card or {}).suit or 'Spades') then
            local choice = pseudorandom('GLITCH!!!!!!!!!!', 1, 4)
            if choice <= 1 then
                return {
                    chips = pseudorandom('GLITCH', card.ability.extra.minChips, card.ability.extra.maxChips)
                }
            elseif choice <= 2 then
                return {
                    mult = pseudorandom('GLITCH', card.ability.extra.minMult, card.ability.extra.maxMult)
                }
            elseif choice <= 3 then
                return {
                    Xmult = pseudorandom('GLITCH', card.ability.extra.minXMult * 100, card.ability.extra.maxXMult * 100) / 100
                }
            else 
                return {
                    dollars = pseudorandom('GLITCH', card.ability.extra.minDollars, card.ability.extra.maxDollars)
                }
            end
            
        end
    end
}