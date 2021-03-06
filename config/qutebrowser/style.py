def ApplyColors(c):
    palette = {
        'background': '#282828',
        'selection': '#504945',
        'foreground': '#ffffff',
        'foregroundDim': '#665c54',
        'input-foreground': '#928374',
        'infoForeground': '#076678',
        'success': '#427b58',
        'warn': '#076678',
        'hintBackground': "#282828",
        'hintForegroundDim': "#928374",
        'hintForeground': "#ffffff"
    }

    c.hints.border = '2px solid #000'

    c.colors.completion.category.bg = palette['background']
    c.colors.completion.category.border.bottom = palette['background']
    c.colors.completion.category.border.top = palette['background']
    c.colors.completion.category.fg = palette['foreground']
    c.colors.completion.even.bg = palette['background']
    c.colors.completion.odd.bg = palette['background']
    c.colors.completion.fg = palette['foregroundDim']
    c.colors.completion.item.selected.bg = palette['selection']
    c.colors.completion.item.selected.border.bottom = palette['selection']
    c.colors.completion.item.selected.border.top = palette['selection']
    c.colors.completion.item.selected.fg = palette['foreground']
    c.colors.completion.match.fg = palette['foreground']
    c.colors.completion.scrollbar.bg = palette['background']
    c.colors.completion.scrollbar.fg = palette['foreground']

    c.colors.downloads.bar.bg = palette['background']
    c.colors.downloads.error.bg = palette['background']
    c.colors.downloads.error.fg = palette['input-foreground']
    c.colors.downloads.stop.bg = palette['background']
    c.colors.downloads.system.bg = 'none'

    c.colors.hints.bg = palette['hintBackground']
    c.colors.hints.fg = palette['hintForegroundDim']
    c.colors.hints.match.fg = palette['hintForeground']
    c.colors.keyhint.bg = palette['background']
    c.colors.keyhint.fg = palette['foreground']
    c.colors.keyhint.suffix.fg = palette['selection']

    c.colors.messages.error.bg = palette['background']
    c.colors.messages.error.border = palette['background']
    c.colors.messages.error.fg = palette['input-foreground']
    c.colors.messages.info.bg = palette['background']
    c.colors.messages.info.border = palette['background']
    c.colors.messages.info.fg = palette['infoForeground']
    c.colors.messages.warning.bg = palette['background']
    c.colors.messages.warning.border = palette['background']
    c.colors.messages.warning.fg = palette['input-foreground']

    c.colors.prompts.bg = palette['background']
    c.colors.prompts.border = '1px solid ' + palette['background']
    c.colors.prompts.fg = palette['foreground']
    c.colors.prompts.selected.bg = palette['selection']

    c.colors.statusbar.caret.bg = palette['background']
    c.colors.statusbar.caret.fg = palette['foreground']
    c.colors.statusbar.caret.selection.bg = palette['background']
    c.colors.statusbar.caret.selection.fg = palette['foreground']
    c.colors.statusbar.command.bg = palette['background']
    c.colors.statusbar.command.fg = palette['input-foreground']
    c.colors.statusbar.command.private.fg = palette['foreground']
    c.colors.statusbar.insert.bg = palette['background']
    c.colors.statusbar.insert.fg = palette['foreground']
    c.colors.statusbar.normal.bg = palette['background']
    c.colors.statusbar.normal.fg = palette['foreground']
    c.colors.statusbar.passthrough.bg = palette['background']
    c.colors.statusbar.passthrough.fg = palette['foreground']
    c.colors.statusbar.private.bg = palette['background']
    c.colors.statusbar.private.fg = palette['foreground']
    c.colors.statusbar.progress.bg = palette['background']
    c.colors.statusbar.url.error.fg = palette['input-foreground']
    c.colors.statusbar.url.fg = palette['foreground']
    c.colors.statusbar.url.hover.fg = palette['input-foreground']
    c.colors.statusbar.url.success.http.fg = palette['success']
    c.colors.statusbar.url.success.https.fg = palette['success']
    c.colors.statusbar.url.warn.fg = palette['warn']

    c.colors.tabs.bar.bg = palette['selection']
    c.colors.tabs.even.bg = palette['selection']
    c.colors.tabs.odd.bg = palette['selection']
    c.colors.tabs.even.fg = palette['foregroundDim']
    c.colors.tabs.odd.fg = palette['foregroundDim']
    c.colors.tabs.indicator.error = palette['selection']
    c.colors.tabs.indicator.start = palette['selection']
    c.colors.tabs.indicator.stop = palette['selection']
    c.colors.tabs.indicator.system = 'none'
    c.colors.tabs.selected.even.bg = palette['background']
    c.colors.tabs.selected.even.fg = palette['foreground']
    c.colors.tabs.selected.odd.bg = palette['background']
    c.colors.tabs.selected.odd.fg = palette['foreground']
