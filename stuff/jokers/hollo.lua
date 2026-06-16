SMODS.Joker{ --Hollo and Espa
    name = "Hollo",
    key = "hollo",
    config = {
        extra = {
        }
    },
    pos = {
        x = 9,
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
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        -- When consumable is used
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Spectral" then
                return {
                    func = function()local created_tarot = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_tarot = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Tarot',
                                key_append = 'hollo'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_tarot then
                        SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    end
                    return true
                end
				}
				
        end
    end
}