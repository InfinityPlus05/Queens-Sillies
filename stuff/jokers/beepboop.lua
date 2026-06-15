SMODS.Joker{ 
    name = "Beep Boop",
    key = "beepboop",
    config = {
        extra = {
            
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_atlas',
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
	calculate = function(self, card, context)
        if context.joker_main then
            local binary_string = ""
            for i = 1, #context.scoring_hand do
                local id = context.scoring_hand[i]:get_id()
                if id <= 10 and id >= 0 then
                    if id % 2 == 0 then
                        binary_string = binary_string .. "1"
                    else
                        binary_string = binary_string .. "0"
                    end
                else
                    binary_string = binary_string .. "0"
                end
            end
            local mult = tonumber(binary_string, 2)
            SMODS.calculate_effect({
                message = "["..binary_string.."]",
                colour = G.C.RED,
                card = card,
            })
            return {
                mult = mult}
        end
    end
}