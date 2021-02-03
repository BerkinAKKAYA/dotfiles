def ApplyFonts(c):
    defaults = 'default_size default_family'
    family = 'FantasqueSansMono Nerd Font Mono'

    c.fonts.default_size = '14pt'
    c.fonts.web.size.default = 16
    c.fonts.web.size.default_fixed = 13
    c.fonts.web.size.minimum = 9

    c.fonts.contextmenu = family
    c.fonts.default_family = family
    c.fonts.web.family.cursive = family
    c.fonts.web.family.fantasy = family  
    c.fonts.web.family.fixed = family
    c.fonts.web.family.sans_serif = family
    c.fonts.web.family.serif = family
    c.fonts.web.family.standard = family

    c.fonts.completion.category = 'bold ' + defaults
    c.fonts.completion.entry = defaults
    c.fonts.debug_console = defaults
    c.fonts.downloads = defaults
    c.fonts.hints = 'bold ' + defaults
    c.fonts.keyhint = defaults
    c.fonts.messages.error = defaults
    c.fonts.messages.info = defaults
    c.fonts.messages.warning = defaults
    c.fonts.prompts = defaults
    c.fonts.statusbar = defaults
    c.fonts.tabs.selected = defaults
    c.fonts.tabs.unselected = defaults
