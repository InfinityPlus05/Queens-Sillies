return {
	descriptions = {
		Joker = {
			j_qsilly_queen = {
				name = 'Queen',
				text = {'{C:attention}Queens{} count as both',
				'{C:attention}Wild{} and {C:attention}Lucky Cards{}',
				'and cannot be debuffed'},
			},
			j_qsilly_adventuringparty = {
				name = 'Spelljamming Mercenaries',
				text = {'{C:chips}+100{} Chips and {C:mult}+20{} Mult',
				'if hand contains at least',
				'{C:attention}4{} different ranks'},
			},
			j_qsilly_samanthany = {
				name = 'Samanthany',
				text = {'Cards become {C:attention}Lucky{} when',
				'scored in a {C:attention}Straight'}
			},
			j_qsilly_moose = {
				name = 'MOOSE',
				text = {'Copies the {C:attention}Joker{} to the right {C:attention}3{} times',
				'{S:1.1,C:red,E:2}self destructs{} at the end of round'}
			},
			j_qsilly_boiandwattson = {
				name = 'Boi and Wattson',
				text = {'{C:mult}+20{} Mult if played hand contains',
				'a scoring {C:attention}King{} and {C:attention}Jack'}
			},
			j_qsilly_bootandheel = {
				name = 'Boot and Heel',
				text = {'{C:clubs}Clubs{} and {C:hearts}Hearts{} give {C:red}+#1#{} Mult',
				'when held in hand'}
			},
			j_qsilly_brittanyandfraisey = {
				name = 'Brittany and Fraisey',
				text = {'{C:diamonds}Diamonds{} and {C:spades}Spades{} give {C:blue}+#1#{} Chips',
				'when held in hand'}
			},
			j_qsilly_carl = {
				name = 'Carl',
				text = {'Played {C:attention}Steel{} cards',
				'earn {C:money}$#1#{} when scored'}
			},
			j_qsilly_cobalt = {
				name = 'Cobalt',
				text = {'{C:attention}Steel{} cards gain a random',
				'{C:dark_edition}Edition{} and a random',
				'{C:attention}Seal{} when scored'},
			},
			j_qsilly_dex = {
				name = 'Dex',
				text = {'If blind was beaten in',
				'one hand, create a {C:dark_edition}Negative{}',
				'{C:attention}Perishable {C:green}Oops! All 6s'},
			},
			j_qsilly_holloandespa = {
			['name'] = 'Hollo and Espa',
			['text'] = {
            [1] = 'Creates a {C:tarot}Tarot{} card',
			[2] = 'when a {C:spectral}Spectral{} card is used'
				}
			},
			j_qsilly_lillie = {
        ['name'] = 'Lillie',
        ['text'] = {
            [1] = 'Just here for emotional support.',
            [2] = '({C:dark_edition}+#1#{} Joker Slot)',
            [3] = '{C:inactive}"im not giving you bonuses im getting my beauty nap"',
			[4] = "{C:inactive}Art by certifiedlillie"
        }
    },
	j_qsilly_hemlock = {
        ['name'] = 'Hemlock',
        ['text'] = {
            [1] = 'Scored {C:attention}2s{}, {C:attention}3s{}, {C:attention}4s{} and {C:attention}5s{}',
            [2] = 'give {X:mult,C:white}X#1#{} Mult when scored',
            [3] = 'Increases by {X:mult,C:white}X#2#{} for',
			[4] = 'every card held in hand',
			[5] = '{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)'
        }
    },
    j_qsilly_wontbereplaced = {
        ['name'] = "Won't Be Replaced",
        ['text'] = {
            [1] = 'Destroy all other cards {C:attention}played{} in hand{}',
            [2] = 'that share the same {C:attention}rank{}',
            [3] = 'as your {C:attention}first {}played card each round'
        }
    },
	
	j_qsilly_snacky = {
        ['name'] = "Snacky",
        ['text'] = {
			[1] = "If the first {C:attention}discard{} of round",
            [2] = 'contains the lowest {C:attention}rank{} in',
            [3] = 'deck, destroy all cards on {C:attention}discard{}',
			[4] = '{C:inactive}(Currently #2#s)'
        }
    },
	j_qsilly_etherealconnection = {
        ['name'] = 'Ethereal Connection',
        ['text'] = {
            [1] = '{C:attention}+#1#{} hand size for every {C:tarot}Tarot{} card',
            [2] = 'held in consumable slots',
			[3] = '{C:inactive}(Currently {C:attention}+#2# {C:inactive}hand size)'
        }
    },
	
    j_qsilly_apricot = {
        ['name'] = 'Apricot',
        ['text'] = {
            [1] = 'If {C:attention}first hand{} of round has only',
            [2] = '{C:attention}2{} cards, copy the {C:attention}enhancement{}',
            [3] = 'of the {C:attention}right{} card onto the {C:attention}left{} card'
        }
    },
	j_qsilly_groveelae = {
        ['name'] = "Gro-vee-lae",
        ['text'] = {
			[1] = "Remove {C:attention}Eternal{} from the",
            [2] = 'leftmost {C:attention}Joker{} at end of round',
            [3] = 'Gain {X:mult,C:white}X#1#{} whenever',
			[4] = 'this {C:attention}Joker{} removes a {C:attention}Sticker{}',
			[5] = '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
        }
    },
	j_qsilly_e = {
        ['name'] = 'E',
        ['text'] = {
            [1] = '{X:dark_edition,C:white}^#1#{} Mult',
            [2] = '{C:attention}-#2#{} Hand Size'
        }
    },
	j_qsilly_constant = {
        ['name'] = 'Constant',
        ['text'] = {
            [1] = 'Sell this card to create',
            [2] = 'an {C:attention}Eternal {C:attention}Perishable',
            [3] = '{S:1.1,C:purple,E:2}Legendary {C:attention}Joker{}'
        }
    },
	j_qsilly_cocoa = {
        ['name'] = 'Cocoa',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to give cards ',
            [2] = '{C:dark_edition}Holographic{} when scored',
            [3] = '{C:green}#1# in #3#{} chance to',
			[4] = '{S:1.1,C:red,E:2}self destruct{} at end of round'
        }
    },
	j_qsilly_calla = {
        ['name'] = 'Calla',
        ['text'] = {
            [1] = 'If hand contains a scoring {C:attention}9{},',
            [2] = 'Balance {C:chips}Chips{} and {C:mult}Mult{}'
        }
    },
	j_qsilly_nevanya = {
        ['name'] = 'Nevanya',
        ['text'] = {
            [1] = 'Retrigger every other {C:attention}Steel{}',
			[2] = 'card {C:attention}held in hand{}'
        }
    },
    j_qsilly_followed = {
        ['name'] = 'Followed',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult',
            [2] = 'After {C:attention}#2#{} rounds, sell to',
            [3] = 'create {C:attention}#3#{} {C:red}Rare{} Jokers',
            [4] = '{C:inactive}(Currently {C:attention}#4#{}{C:inactive}/#2# rounds)',
			[5] = '{C:inactive}(Must have room)'
        }
    },
    j_qsilly_wonder = {
        ['name'] = 'Wonder',
        ['text'] = {
            [1] = 'If a {C:attention}#1#{} of {V:1}#2#{} and',
			[2] = 'a {C:attention}#3#{} of {V:2}#4#{} is played',
			[3] = 'during the round, create a {C:attention}Photograph',
            [4] = '{s:0.8}Cards change every round'
        }
    },
    j_qsilly_potato = {
        ['name'] = 'Potato',
        ['text'] = {
            [1] = 'Cards give {C:chips}+#1#{} Chips when scored',
			[2] = 'Increases by {C:blue}+#2#{} Chips for',
            [3] = 'every consecutive card scored',
			[4] = '{C:inactive}(Resets after each hand played)'
        }
    },
			j_qsilly_wisp = {
				name = 'Wisp',
				text = {
					'Copies the {C:attention}Jokers{}',
					'to the left and right'
				},
			}
		},
		
		Other = {
			qsilly_perishinfo = {
				name = "Perishable",
				text = {'Debuffed after',
				'{C:attention}5{} rounds'},
			}
		}
	},
	
}