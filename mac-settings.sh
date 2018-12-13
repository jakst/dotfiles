echo "Setting clock format"
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM h:mm a"

echo "Activating dark mode"
osascript <<EOD
  tell application "System Events"
    tell appearance preferences 
      set dark mode to true
    end tell
  end tell
EOD

echo "\nRestarting SystemUIServer"
killall SystemUIServer
