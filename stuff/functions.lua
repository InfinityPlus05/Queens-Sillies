SMODS.current_mod.optional_features = {
  quantum_enhancements = true,
}

QSILLY.jokers = {
    "bubble"
}

function QSILLY.register_items(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end