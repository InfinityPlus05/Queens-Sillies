SMODS.Joker{ 
    name = "Loop",
    key = "loop",
    config = {
        extra = {
            hand_size = 2,
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.hand_size}}
    end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            G.hand:change_size(-card.ability.extra.hand_size)
            return {
                    saved = 'qsilly_saved_by_loop',
                    colour = G.C.GREY
                }
        end
    end
}