SMODS.Joker{ --Snacky
    name = "Snacky",
    key = "snacky",
    config = {
        extra = {
			currentcard = 2,
			currentrank = "2"
        }
    },
    pos = {
        x = 7,
        y = 2
    },
	
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
		
        return {vars = {card.ability.extra.currentcard, card.ability.extra.currentrank}}
    end,
	
	add_to_deck = function(self, card, from_debuff)
	if not card.area or card.area ~= G.jokers then
        return
    end
    if not (G.GAME and G.hand and G.hand.cards) then
        return
    end
    local firstcard = true
    for _, c in ipairs(G.playing_cards) do
        -- Skip if no rank
        if SMODS.has_no_rank(c) then
            break
        -- First Card Check
        elseif firstcard then
            card.ability.extra.currentcard = c:get_id()
			card.ability.extra.currentrank = c.base.value
            firstcard = false
        -- Future Card Checks
        elseif c:get_id() < card.ability.extra.currentcard then
            card.ability.extra.currentcard = c:get_id()
			card.ability.extra.currentrank = c.base.value
        end
    end
end,
	
	update = function(self, card, dt)
	if not card.area or card.area ~= G.jokers then
        return
    end
    if not (G.GAME and G.hand and G.hand.cards) then
        return
    end
    local firstcard = true
    for _, c in ipairs(G.playing_cards) do
        -- Skip if no rank
        if SMODS.has_no_rank(c) then
            break
        -- First Card Check
        elseif firstcard then
            card.ability.extra.currentcard = c:get_id()
			card.ability.extra.currentrank = c.base.value
            firstcard = false
        -- Future Card Checks
        elseif c:get_id() < card.ability.extra.currentcard then
            card.ability.extra.currentcard = c:get_id()
			card.ability.extra.currentrank = c.base.value
        end
    end
end,

	
    calculate = function(self, card, context)
        if context.discard and not context.blueprint and G.GAME.current_round.discards_used <= 0 then
			--local cards = {}
            for i = 1, #G.hand.highlighted do
				if G.hand.highlighted[i]:get_id() <=  card.ability.extra.currentcard then
					return {
						remove = true
					}
					--table.insert(cards, G.hand.highlighted[i])
				end
            end
        end
    end
}
