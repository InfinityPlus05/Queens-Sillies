SMODS.Joker{ --Apricot
    name = "Apricot",
    key = "apricot",
    config = {
        extra = {
			chosenenhance = 'c_base'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chosenenhance}}
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and #context.full_hand == 2 then
            if G.GAME.current_round.hands_played == 0 then
				G.E_MANAGER:add_event(Event({
                    delay = 0.8,
                    func = (function()
                        context.full_hand[1]:set_ability(G.P_CENTERS[context.full_hand[2].config.center.key])
                        return true
                    end)
                }))
                return {
                    message = "Our pact!",
					colour = G.C.GREEN
                }
            end
        end
    end
}
