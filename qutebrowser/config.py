
# Get themes
config.source('themes/gruvbox-dark.py')
# config.source('yankhoverurl.py')

# ---- Themes ---- #
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.darkmode.enabled = True

# ---- Options ---- #
c.content.javascript.enabled = True
c.content.javascript.clipboard = "access"

# Window
c.window.hide_decoration = True
# Tabs
c.tabs.last_close = "close"
# c.tabs.title.format = "{index}: {current_title}"
c.tabs.title.format = "{current_title}"
c.tabs.show = "never"
# Status Bar
# c.statusbar.show = "never"
c.statusbar.show = "always"
# Scroll Bar
c.scrolling.bar = "never"

# ---- Set Default ---- #
c.fonts.default_size = "16pt"
# Default console font
c.fonts.debug_console = "MesloLGM Nerd Font"

# Default start page
c.url.searchengines = {"DEFAULT": "https://www.google.fi/search?q={}"}
c.url.start_pages = ["https://www.google.com"] 
c.url.default_page = "https://www.google.com"

# Hỏi trước khi tắt nếu đang download.
c.confirm_quit = ["downloads"]
# Mở tệp config bằng nvim.
c.editor.command = ["kitty", "-T qutePopup", "hx", "{}"]
# Padding around text for tabs
c.tabs.padding = {
    "left": 15,
    "right": 0,
    "top": 5,
    "bottom": 5,
}
c.statusbar.padding = {
    "left": 15,
    "right": 15,
    "top": 15,
    "bottom": 15,
}
# ---- Key Binding ---- #
config.bind("gi", "hint inputs")
config.bind("yr", "hint --rapid all yank")
config.bind("yl", "hint --rapid links yank")
config.bind("em", "hint links spawn --detach mpv {hint-url}")
# config.bind("et", "spawn --userscript translate -t vi")
# config.bind("et", "set-cmd-text :open https://translate.google.com/?hl=vi&sl=auto&tl=vi&op=websites")
config.bind('et','open -t https://translate.google.com/#auto/vi/{primary}')

config.unbind("O")
config.unbind("T")
config.unbind("th")
config.unbind("tl")
config.bind("O", "set-cmd-text :open {url:pretty}")
config.bind("T", "set-cmd-text :open -t {url:pretty}")
config.bind("t", "set-cmd-text -s :open -t")

config.unbind("<ctrl+tab>")
config.bind("<ctrl+tab>", "tab-next")
config.bind("<ctrl+shift+tab>", "tab-prev")

config.unbind("ZQ")
config.unbind("ZZ")
config.unbind("<ctrl+q>")
config.bind("<ctrl+q>", "wq")

config.unbind("g0")
config.unbind("g$")
# config.unbind("gJ")
# config.unbind("gK")
config.bind("gp", "tab-focus 1")
config.bind("gn", "tab-focus -1")

# ---- Alias ---- #
c.aliases = {
    "o": "open",
    "w": "session-save",
    "wq": "quit --save",
    "mpv": "hint links spawn --detach mpv {hint-url}",
}


config.load_autoconfig()
