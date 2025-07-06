SMODS.Joker{ --Hemlock
    name = "Hemlock",
    key = "hemlock",
    
    pos = {
        x = 2,
        y = 0
    },
	soul_pos = { x = 2, y = 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
	config = {
        extra = {
            xmult = 1.25,
			xmult_increase = 0.25,
			total_increase = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.xmult_increase, card.ability.extra.total_increase}}
    end,

	update = function(self, card, dt)
    if not card.area or card.area ~= G.jokers then
        return
    end
    if not (G.GAME and G.hand and G.hand.cards) then
        return
    end

    local handcount = 0
    for i = 1, #G.hand.cards do
        if G.hand.cards[i] then
            handcount = handcount + 1
        end
    end
	
	local cards = {}
            for i = 1, #G.hand.highlighted do
                table.insert(cards, G.hand.highlighted[i])
            end

    card.ability.extra.total_increase = (handcount - #cards) * card.ability.extra.xmult_increase
end,


    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card and (
        context.other_card:get_id() == 2 or
        context.other_card:get_id() == 3 or
        context.other_card:get_id() == 4 or
        context.other_card:get_id() == 5
    ) then
        return {
            xmult = card.ability.extra.xmult + (card.ability.extra.total_increase or 0)
        }
    end
end
}