extends Node2D

# Declare member variables here. Examples:
var cookies = 0
var cookieUpgrade = 10
var cookieUpgradeScaling = 2
var cookiesPerSecond = 1



func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		Save.saveValue("Main", "Cookies", Global.cookies)
		Save.saveValue("Upgrades", "CookieUpgrade", Global.cookieUpgrade)
		Save.saveValue("Upgrades", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
		get_tree().quit() # default behavior

func _saveCurrentValues():
	Save.saveValue("Main", "Cookies", Global.cookies)
	Save.saveValue("Upgrades", "CookieUpgrade", Global.cookieUpgrade)
	Save.saveValue("Upgrades", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	
func _loadCurrentValues():
	Save.loadValue("Main", "Cookies", Global.cookies)
	Save.loadValue("Upgrades", "CookieUpgrade", Global.cookieUpgrade)
	Save.loadValue("Upgrades", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
		
