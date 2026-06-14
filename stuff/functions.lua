SMODS.current_mod.optional_features = {
  quantum_enhancements = true,
}

QSILLY.jokers = {
    "bubble", -- Family
    "wisp",
    "hemlock",
}

function QSILLY.register_items(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end

-- why are people still using talisman
to_big = to_big or function(num)
  return num
end
to_number = to_number or function(num)
  return num
end