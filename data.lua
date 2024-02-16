data:extend({
  {
    type = "shortcut",
    name = "export-researched-technologies",
    order = "d[quickbar]-b[export]",
    action = "lua",
    localised_name = {"export-researched-technogies_shortcut.title"},
    icon = {
      filename = "__core__/graphics/export.png",
      priority = "extra-high-no-scale",
      size = 64,
      scale = 1,
      flags = {"icon"}
    }
  }
})