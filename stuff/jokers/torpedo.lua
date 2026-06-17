SMODS.Joker{ 
    name = "Torpedo",
    key = "torpedo",
    config = {
        extra = {
            xmult = 2,
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, G.playing_cards and G.GAME.starting_deck_size or 52}}
    end,
	calculate = function(self, card, context)
        if context.joker_main and G.GAME.starting_deck_size == #G.playing_cards then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}