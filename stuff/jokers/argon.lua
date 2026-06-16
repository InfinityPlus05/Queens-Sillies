SMODS.Joker{ 
    name = "Argon",
    key = "argon",
    config = {
        extra = {
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS.tag_qsilly_front
        return {vars = {localize { type = 'name_text', set = 'Tag', key = 'tag_qsilly_front' }}}
    end,
	calculate = function(self, card, context)
        if context.selling_card then
            if context.card.ability.set == 'Joker' then
                G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag({ key = 'tag_qsilly_front' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
            end
        end
    end
}