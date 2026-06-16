SMODS.Joker {
    name = "Melody",
    key = "melody",
    config = {
        extra = {
            
        }
    },
    pos = {
        x = 10,
        y = 0
    },
    soul_pos = { x = 10, y = 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local other_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card and G.jokers.cards[i + 1]
                and not SMODS.is_eternal(G.jokers.cards[i + 1], card) then 
                    other_joker = G.jokers.cards[i + 1] end
            end
            if other_joker then
                local rarity = other_joker.config.center.rarity
                rarity = QSILLY.base_rarities[rarity] or rarity
                local edition = other_joker.edition

                G.E_MANAGER:add_event(Event({
                    func = function()
                    play_sound('tarot1')
                    other_joker.T.r = -0.2
                    other_joker:juice_up(0.3, 0.4)
                    other_joker.states.drag.is = true
                    other_joker.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                        G.jokers:remove_card(other_joker)
                        other_joker:remove()

                        SMODS.add_card {
                            set = 'Joker',
                            rarity = rarity,
                            edition = edition
                        }
                        return true
                        end
                    }))
                    return true
                    end
                }))
                return {
                    message = localize('qsilly_switch'),
                    colour = G.C.DARK_EDITION,
                    card = card
                }
            end
        end
    end
}