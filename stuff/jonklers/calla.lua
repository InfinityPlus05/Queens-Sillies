SMODS.Joker{ --Calla
    name = "Calla",
    key = "calla",
    config = {
        extra = {
        }
    },
    
    pos = {
        x = 1,
        y = 0
    },
	soul_pos = { x = 1, y = 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        -- Main scoring time for jokers
        if context.cardarea == G.jokers and context.joker_main then
            -- Check conditions for this rule
            local has_nine = false
            for i, c in ipairs(context.scoring_hand) do
                if c:get_id() == 9 then
                    has_nine = true
                    break
                end
            end

			-- thank you paperback for the balance code
            if has_nine then
                -- Actually balance the chips and mult
                local tot = hand_chips + mult
                hand_chips = mod_chips(math.floor(tot / 2))
                mult = mod_mult(math.floor(tot / 2))
                update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })

                -- Cosmetic effects
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        -- Play sounds and change colors
                        play_sound('gong', 0.94, 0.3)
                        play_sound('gong', 0.94 * 1.5, 0.2)
                        play_sound('tarot1', 1.5)
                        ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
                        ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })

                        -- Show balanced message on card
                        SMODS.calculate_effect({
                            message = localize('k_balanced'),
                            colour = { 0.8, 0.45, 0.85, 1 },
                            instant = true
                        }, card)

                        -- Return UI colors to normal
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            blockable = false,
                            blocking = false,
                            delay = 4.3,
                            func = (function()
                                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                                return true
                            end)
                        }))

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            blockable = false,
                            blocking = false,
                            no_delete = true,
                            delay = 6.3,
                            func = (function()
                                for i = 1, 4 do
                                    G.C.UI_CHIPS[i] = G.C.BLUE[i]
                                    G.C.UI_MULT[i] = G.C.RED[i]
                                end
                                return true
                            end)
                        }))

                        return true
                    end)
                }))

                return {
                    message = localize('k_balanced'),
                    colour = { 0.8, 0.45, 0.85, 1 }
                }
            end
        end
    end
}