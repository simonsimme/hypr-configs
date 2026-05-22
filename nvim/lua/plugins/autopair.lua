return{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    npairs.setup({
      check_ts = true,
    })

    -- integrate with blink.cmp
    local ok, blink = pcall(require, "blink.cmp")
    if ok then
      blink.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}
