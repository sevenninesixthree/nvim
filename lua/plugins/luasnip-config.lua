require("luasnip").config.set_config{
  store_selection_keys=";"
}
require("luasnip.loaders.from_lua").lazy_load({paths="./luaSnip/"})
