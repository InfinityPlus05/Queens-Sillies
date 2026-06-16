QSILLY = {}
QSILLY.config = SMODS.current_mod.config

SMODS.load_file("stuff/atlas.lua")()
SMODS.load_file("stuff/functions.lua")()

QSILLY.register_items(QSILLY.jokers, "stuff/jokers")
QSILLY.register_items(QSILLY.tags, "stuff/consumables")