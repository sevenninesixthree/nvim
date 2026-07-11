local au=vim.api.nvim_create_autocmd
local en="keyboard-us"
local ime=en
au("InsertLeave",{
  callback=function ()
    local fictx=io.popen("fcitx5-remote -n;fcitx5-remote -s "..en)
    if not fictx then
      return nil
    end
    ime=fictx:read("*a")
  end
})
au("InsertEnter",{
  callback=function ()
    os.execute("fcitx5-remote -s "..ime)
  end
})
