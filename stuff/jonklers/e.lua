SMODS.Joker{ -- E
	name = "E",
    key = "e",
	
	cost = 9,
    rarity = 3,
	config = {
        extra = {
			powmult = 2.5,
			handsize = 3
        }
    },
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = 'CustomJokers',
	pos = {
        x = 6,
        y = 1
    },
	
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.powmult, card.ability.extra.handsize } }
    end,
	
	add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handsize)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handsize)
    end,
	
	
	calculate = function(self, card, context)
    if context.forcetrigger or (context.cardarea == G.jokers and context.joker_main) then
      if Talisman then
        return {
          emult = card.ability.extra.powmult
        }
      else
        return {
          Xmult_mod = mult ^ (card.ability.extra.powmult - 1),
          message = "^"..card.ability.extra.powmult.." Mult",
          colour = G.C.DARK_EDITION
        }
      end
    end
  end
}