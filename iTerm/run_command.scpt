# AppleScript to run any command with any argument in the current tab of iTerm2
# I run this script from VS Code to run RSpec and JS tests by a keyboard shortcut

# Usage: osascript ~/.dotfiles/iTerm/run_command.scpt rspec spec/models/user_spec.rb
# It will:
# - Switch to iTerm2, then using the current tab
# - Clear the screen
# - Run `rspec spec/models/user_spec.rb`

# Applescript in iTerm2 is deprecated

on run argv
  tell application "iTerm"
    activate

    set command to ""
    repeat with i from 1 to count of argv
      set command to command & item i of argv & " "
    end repeat

    tell current window
      tell current tab
        tell current session
          write text command
        end tell
      end tell
    end tell
  end tell
end run
