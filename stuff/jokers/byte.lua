SMODS.Joker{ 
    name = "Byte",
    key = "byte",
    config = {
        extra = {
            chips = 10,
            mult = 2
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,
	calculate = function(self, card, context)
        if context.other_joker and not context.other_joker.edition then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}