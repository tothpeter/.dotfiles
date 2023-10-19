# Run RSpec in the current tab
on run argv
  tell application "iTerm"
    activate
    tell current window
      tell current tab
          tell current session
            # write text "clear"
            write text "rs " & item 1 of argv
          end tell
      end tell
    end tell
  end tell
end run
