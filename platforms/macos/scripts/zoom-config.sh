#!/bin/bash
# Post-install check for Zoom: confirms the app landed and reports its version
# so the result is visible in Fleet's install activity log.
set -euo pipefail

APP="/Applications/zoom.us.app"

if [ ! -d "$APP" ]; then
  echo "Zoom not found at $APP" >&2
  exit 1
fi

VERSION=$(defaults read "$APP/Contents/Info.plist" CFBundleShortVersionString 2>/dev/null || echo "unknown")
echo "Zoom installed: version $VERSION"
