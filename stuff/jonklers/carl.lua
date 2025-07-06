SMODS.Joker{ --Carl
    name = "Carl",
    key = "carl",
    config = {
        extra = {
            dollars = 5
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars}}
    end,
	
	in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_gold'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end,
	
    calculate = function(self, card, context)
        -- Individual card scoring
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}