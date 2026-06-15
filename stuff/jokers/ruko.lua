SMODS.Joker{ --Ruko
    name = "Ruko",
    key = "ruko",
    config = {
        extra = {
            dollars = 3,
            increase = 3
        }
    },
    pos = {
        x = 10,
        y = 2
    },
	soul_pos = { x = 10, y = 3 },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars, card.ability.extra.increase}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.increase
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MONEY
            }
        end
    end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}