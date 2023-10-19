# https://iterm2.com/python-api/index.html

import iterm2
import sys

async def run_rspec_in_current_tab(connection):
    app = await iterm2.async_get_app(connection)
    window = app.current_window
    if window is not None:
        tab = window.current_tab
        session = tab.current_session

        code = b'\x1b' + b']1337;ClearScrollback' + b'\x07'
        await session.async_inject(code) # Clear the scrollback

        command = "rs " + sys.argv[1]
        await session.async_send_text(command)
        await session.async_send_text("\n") # Send Enter key to execute the command
        await app.async_activate() # Switch back to iTerm
    else:
        print("No current window")

iterm2.run_until_complete(run_rspec_in_current_tab)
