import XMonad

import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders

border_width = 2

main :: IO ()
main = xmonad . ewmh =<< xmobar rconfig

rconfig = def
	{ modMask = mod4Mask -- Rebind Mod to the super key
	, focusFollowsMouse = False
	, layoutHook = (spacingRaw False (Border 3 3 3 3) True (Border 15 15 15 15) True $ layoutHook def) ||| noBorders Full
	, borderWidth = border_width
	, normalBorderColor = "#aab7c5"
	, focusedBorderColor = "#ffb7c5"
	, terminal = "st"
	}


