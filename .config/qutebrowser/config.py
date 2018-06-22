#┃ ~/.config/qutebrowser/config.py
#┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#┃ mjturt

### Basics

# config.load_autoconfig()
c.scrolling.smooth = True
c.url.default_page = "file:///home/mjt/cloud/homepage/index.html"
c.url.start_pages = "file:///home/mjt/cloud/homepage/index.html"
c.zoom.default = 100
c.backend = "webengine"
c.scrolling.bar = True
#c.backend = "webkit"
#c.content.pdfjs = True
c.hints.mode = "number"
c.url.searchengines = { 
        "DEFAULT" : "https://duckduckgo.com/?q={}", 
        "w" : "https://www.wikipedia.org/w/index.php?title=Special:Search&search={}",
        "a" : "https://wiki.archlinux.org/index.php?search={}",
        "g" : "https://wiki.gentoo.org/index.php?title=Special%3ASearch&search={}&go=Go",
        "gh" : "https://github.com/search?utf8=%E2%9C%93&q={}",
        "p" : "https://gpo.zugaina.org/Search?search={}",
        "y" : "https://www.youtube.com/results?search_query={}",
        "e" : "https://www.ebay.com/sch/i.html?_from=R40&_trksid=m570.l1313&_nkw={}",
        "gm" : "https://www.google.com/maps?q={}",
        }

### Appearance

c.content.user_stylesheets = "stylesheets/default.css"
# c.content.user_stylesheets = "stylesheets/wiki.css"
# c.content.user_stylesheets = "stylesheets/github.css"

config.source('themes/base16-dracula.config.py')
c.colors.hints.fg = "#ffb86c"
c.colors.hints.match.fg = "#50fa7b"
c.colors.hints.bg = "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(40, 42, 54, 0.8), stop:1 rgba(68, 71, 90, 0.8))"

c.fonts.monospace = "Hurmit NF"
c.fonts.completion.category = "bold 10pt monospace"
c.fonts.completion.entry = "10pt monospace"
c.fonts.debug_console = "10pt monospace"
c.fonts.downloads = "10pt monospace"
c.fonts.hints = "bold 9pt monospace"
c.fonts.keyhint = "10pt monospace"
c.fonts.statusbar = "10pt monospace"
c.fonts.tabs = "10pt monospace"

### Keybindings

config.bind('j', 'scroll left')         
config.bind('k', 'scroll down')         
config.bind('l', 'scroll up')         
config.bind('ö', 'scroll right')         
config.bind('J', 'back')         
config.bind('K', 'tab-next')         
config.bind('L', 'tab-prev')         
config.bind('Ö', 'forward')         
config.bind('x', 'tab-close')
config.bind('j', 'move-to-prev-char', mode='caret')         
config.bind('k', 'move-to-next-line', mode='caret')         
config.bind('l', 'move-to-prev-line', mode='caret')         
config.bind('ö', 'move-to-next-char', mode='caret')         
config.bind('J', 'scroll left', mode='caret')         
config.bind('K', 'scroll down', mode='caret')         
config.bind('L', 'scroll up', mode='caret')         
config.bind('Ö', 'scroll right', mode='caret')         
config.bind('<Ctrl-b>', 'spawn --userscript ~/.config/qutebrowser/userscripts/qute-buku-add.sh')
