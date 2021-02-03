import style
import fonts

c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'yt': 'open youtube.com/feed/subscriptions',
    'nt': 'open notion.so',
    'git': 'open github.com/BerkinAKKAYA',
    'word': 'open office.com/launch/word',
    'trakt': 'open trakt.tv',
    'medium': 'open medium.com/me/stories/drafts',
    'spotify': 'open https://accounts.spotify.com/en/login',
}

# Hint Links and Copy The Selection
config.bind('Y', 'hint links yank')
config.bind('P', 'hint links spawn -d mpv {hint-url}')

c.qt.args = [ "enable-gpu-rasterization" ]

# webengine (newer and recommended), webkit (lighter)
c.backend = 'webengine'

c.completion.height = '25%'

## Which categories to show (in which order) in the :open completion.
## searchengines, quickmarks, bookmarks, history
c.completion.open_categories = ['searchengines', 'history', 'quickmarks', 'bookmarks']

c.completion.scrollbar.padding = 5
c.completion.scrollbar.width = 5

## Shrink if all suggestions fits the screen.
c.completion.shrink = True

c.completion.web_history.max_items = 10000

# always, multiple-tabs, downloads, never
c.confirm_quit = ['downloads', 'multiple-tabs']

c.content.autoplay = False

## all, no-3rdparty, no-unknown-3rdparty, never
c.content.cookies.accept = 'no-3rdparty'

# Disable Adblocker
c.content.blocking.enabled = False

# utf-8, iso-8859-1, ...
# c.content.default_encoding = 'iso-8859-1'

## Set fullscreen notification overlay timeout in milliseconds.
c.content.fullscreen.overlay_timeout = 1000

c.content.geolocation = False

c.content.javascript.can_access_clipboard = True

c.content.local_content_can_access_remote_urls = True

c.content.media.audio_capture = False

c.content.media.audio_video_capture = False

c.content.media.video_capture = False

c.content.notifications = False

c.content.pdfjs = True

## Validate SSL handshakes. (True, False, 'ask')
c.content.ssl_strict = True

c.downloads.location.remember = True

## path, filename, both
c.downloads.location.suggestion = 'filename'

## (milliseconds) or If set to -1, downloads are never removed.
c.downloads.remove_finished = -1

# number, letter, word
c.hints.mode = 'number'

c.hints.padding = {'top': 3, 'bottom': 3, 'left': 6, 'right': 6}

c.hints.radius = 10

## CSS selectors used to determine which elements on a page should have hints.
c.hints.selectors = {
    'all': ['a', 'area', 'textarea', 'select', 'input:not([type="hidden"])', 'button', 'frame', 'iframe', 'img', 'link', 'summary', '[contenteditable]:not([contenteditable="false"])', '[onclick]', '[onmousedown]', '[role="link"]', '[role="option"]', '[role="button"]', '[ng-click]', '[ngClick]', '[data-ng-click]', '[x-ng-click]', '[tabindex]'],
    'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'],
    'images': ['img'],
    'media': ['audio', 'img', 'video'],
    'url': ['[src]', '[href]'],
    'inputs': ['input[type="text"]', 'input[type="date"]', 'input[type="datetime-local"]', 'input[type="email"]', 'input[type="month"]', 'input[type="number"]', 'input[type="password"]', 'input[type="search"]', 'input[type="tel"]', 'input[type="time"]', 'input[type="url"]', 'input[type="week"]', 'input:not([type])', '[contenteditable]:not([contenteditable="false"])', 'textarea']
}

## Enter insert mode if an editable is focused on load
c.input.insert_mode.auto_load = False

c.input.mouse.back_forward_buttons = False

# Move between clickables via arrow keys
# c.input.spatial_navigation = True

## vdebug, debug, info, warning, error, critical
# c.logging.level.console = 'critical'
# c.logging.level.ram = 'critical'

## How long to show statusbar messages
# c.messages.timeout = 2000

## tab, tab-bg, tab-slinet, tab-bg-silent, window, private-window
c.new_instance_open_target = 'tab-silent'

## Which window to choose when opening links as new tabs. When
## first-opened, last-opened, last-focused, last-visible
c.new_instance_open_target_window = 'first-opened'

## always, auto, never
c.qt.low_end_device_mode = 'always'

## process-per-site-instance, process-per-site, single-process
# c.qt.process_model = 'process-per-site-instance'

c.scrolling.smooth = True

## always, never, smart (Only if there are capital letters)
c.search.ignore_case = 'always'

# c.statusbar.position = 'bottom'

# always, never, in-mode
c.statusbar.show = 'in-mode'

## url, scroll, scroll_raw, history, tabs, keypress, progress
c.statusbar.widgets = []

## Open new tabs (middleclick/ctrl+click) in the background.
c.tabs.background = True

## Maximum stack size to remember for tab switches (-1 for no maximum).
c.tabs.focus_stack_size = 10

## Padding (in pixels) for tab indicators.
c.tabs.indicator.padding = {'top': 10, 'bottom': 10, 'left': 5, 'right': 2}

c.tabs.last_close = 'close'

c.tabs.max_width = -1
c.tabs.min_width = -1

## When switching tabs, what input mode is applied.
## persist, restore, normal
# c.tabs.mode_on_change = 'normal'

# Position of the new opened tabs.
# prev, next, first, last
# c.tabs.new_position.related = 'next'

# prev, next, first, last
# c.tabs.new_position.unrelated = 'last'

## Force pinned tabs to stay at fixed URL.
# c.tabs.pinned.frozen = True

## Shrink pinned tabs down to their contents.
# c.tabs.pinned.shrink = True

## Position of the tab bar.
## top, bottom, left, right
# c.tabs.position = 'top'

## Which tab to select when the focused tab is removed.
## prev, next, last-used
# c.tabs.select_on_remove = 'next'

## When to show the tab bar.
## always, never, multiple, switching
c.tabs.show = 'multiple'

## Hide delay in 'switching' mode
# c.tabs.show_switching_delay = 800

## Alignment of the text inside of tabs.
## left, right, center
c.tabs.title.alignment = 'center'

## {perc_raw}, {current_title}, {index}, {aligned_index}, {id}, {host}
## {scroll_pos}, {backend}, {private}, {current_url}, {audio}
c.tabs.title.format = '{current_title}'
c.tabs.title.format_pinned = '{current_title}'
c.window.title_format = 'qutebrowser'

c.tabs.tooltips = False

c.tabs.undo_stack_size = 10

c.url.default_page = 'about:blank'

c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'trakt': 'https://trakt.tv/search?query={}',
    'rotten': 'https://www.rottentomatoes.com/search?search={}',
    'translate': 'https://translate.google.com/?sl=en&tl=tr&text={}',
}

## Page(s) to open at the start.
c.url.start_pages = ['about:blank']

c.zoom.default = '125%'
# c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']

STATUSBAR_PADDING = 10
TABS_PADDING = 5

c.statusbar.padding = {
    'top': STATUSBAR_PADDING,
    'bottom': STATUSBAR_PADDING,
    'right': STATUSBAR_PADDING,
    'left': STATUSBAR_PADDING
}
c.tabs.padding = {
    'top': TABS_PADDING,
    'bottom': TABS_PADDING,
    'right': TABS_PADDING,
    'left': TABS_PADDING
}

style.ApplyColors(c)
fonts.ApplyFonts(c)

config.load_autoconfig(False)
