return {
  'mattn/emmet-vim',
  event = 'InsertEnter', -- Load the plugin when entering insert mode
  config = function ()
    vim.g.user_emmet_install_global = 0
    vim.g.user_emmet_settings = {
        html = {
            snippet_type = 'sublime',
            default_attributes = {
                id = "my_id",
                class = "my_class",
            },
        },
        css = {
            default_attributes = {
                class = "my_css_class",
            },
        },
        javascript = {
            default_attributes = {
                class = "my_js_class",
            },
        },
    }
  end
}
