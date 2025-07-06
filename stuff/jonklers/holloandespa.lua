SMODS.Joker{ --Hollo and Espa
    name = "Hollo and Espa",
    key = "holloandespa",
    config = {
        extra = {
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
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
                            local tarot_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, nil, 'artsandcraftsbaybeeeee')
                            tarot_card:add_to_deck()
                            G.consumeables:emplace(tarot_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_tarot then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = 'Ghostly Fortune!', colour = G.C.PURPLE})
                    end
                    return true
                end
				}
				
        end
    end
}