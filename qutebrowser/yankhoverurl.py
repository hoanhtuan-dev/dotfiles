from qutebrowser.api import cmdutils, message
from qutebrowser.mainwindow import mainwindow
from qutebrowser.utils import objreg, utils

try:
	@cmdutils.register()
	def yank_hover_url() -> None:
		try:
			window = objreg.last_focused_window()
			current_hover_url = window.status.url._hover_url

			utils.set_clipboard(current_hover_url)
		except:
			message.error("Couldn't yank hover URL.")

except ValueError:
	# Registering command more than once (happens on every config source after launch)
    # raises ValueError. Ignore it, otherwise an error message would appear.
	pass
