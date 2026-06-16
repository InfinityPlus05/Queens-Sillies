local sell_card_hook = Card.sell_card
function Card:sell_card()
    local hook = sell_card_hook(self)
    if G.jokers and self.ability.set == 'Joker' then
        G.QSILLY_last_sold_joker = {}
        local copied_card = copy_card(self, nil, 0) -- Creates a copy with 0 scale
        G.QSILLY_last_sold_joker[1] = copied_card
    end
    return hook
end
SMODS.Tag {
    key = "front",
    pos = { x = 0, y = 0 },
    atlas = 'tag_atlas',
    min_ante = 3,
    ability = { },
    loc_vars = function(self, info_queue, tag)
        local other_joker = G.QSILLY_last_sold_joker and localize({ type = "name_text", set = "Joker", key = G.QSILLY_last_sold_joker[1].config.center.key }) or localize("qsilly_none")
        return {vars = {other_joker}}
    end,
    in_pool = function(self, args)
        
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local other_joker = G.QSILLY_last_sold_joker and G.QSILLY_last_sold_joker[1] or nil
            local card = SMODS.create_card {
                key = other_joker and other_joker.config.center.key or "j_joker"
            }
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', G.C.GREEN, function()
                card:start_materialize()
                card:set_cost()
                return true
            end)
            tag.triggered = true
            return card
        end
    end
}