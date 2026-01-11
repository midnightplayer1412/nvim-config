return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- Detect default browser and add incognito flag
    local function setup_incognito_preview()
      if vim.fn.has("wsl") == 1 then
        -- WSL: Detect Windows browser
        local browsers = {
          { path = [[/mnt/c/Program Files/Google/Chrome/Application/chrome.exe]],              flag = "--incognito" },
          { path = [[/mnt/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe]], flag = "--incognito" },
          { path = [[/mnt/c/Program Files/Mozilla Firefox/firefox.exe]],                       flag = "-private-window" },
        }
        for _, browser in ipairs(browsers) do
          if vim.fn.executable(browser.path) == 1 then
            vim.cmd(string.format([[
              function! OpenMarkdownPreview(url)
                let cmd = "%s %s " . shellescape(a:url) . " &"
                silent call system(cmd)
              endfunction
            ]], vim.fn.shellescape(browser.path), browser.flag))
            vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
            return
          end
        end
      elseif vim.fn.has("mac") == 1 then
        -- macOS: Use default browser with private mode
        vim.cmd([[
          function! OpenMarkdownPreview(url)
            silent call system('open -na "Google Chrome" --args --incognito ' . shellescape(a:url) . ' &')
          endfunction
        ]])
        vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
      elseif vim.fn.has("unix") == 1 then
        -- Linux: Try common browsers
        local browsers = {
          { cmd = "google-chrome", flag = "--incognito" },
          { cmd = "brave-browser", flag = "--incognito" },
          { cmd = "firefox",       flag = "--private-window" },
        }
        for _, browser in ipairs(browsers) do
          if vim.fn.executable(browser.cmd) == 1 then
            vim.cmd(string.format([[
              function! OpenMarkdownPreview(url)
                silent call system('%s %s ' . shellescape(a:url) . ' &')
              endfunction
            ]], browser.cmd, browser.flag))
            vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
            return
          end
        end
      end
    end
    setup_incognito_preview()
  end,

}
