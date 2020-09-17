extends Node2D

# Declare member variables here. Examples:
var cookies = 0
var clickCookieUpgrade = 10
var cpsCookieUpgrade = 10
var cookieUpgradeScaling = 2
var cookiesPerSecond = 1
var cookieClick = 1


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_saveCurrentValues()
		get_tree().quit() # default behavior

func _saveCurrentValues():
	Save.saveValue("Main", "Cookies", Global.cookies)
	Save.saveValue("Upgrades", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Save.saveValue("Upgrades", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Save.saveValue("Upgrades", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Save.saveValue("Upgrades", "CookiesPerSecond", Global.cookiesPerSecond)
	Save.saveValue("Upgrades", "CookieClick", Global.cookieClick)
	
func _loadCurrentSave():
	Global.cookies = Save.loadValue("Main", "Cookies", Global.cookies)
	Global.clickCookieUpgrade = Save.loadValue("Upgrades", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Global.cpsCookieUpgrade = Save.loadValue("Upgrades", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Global.cookiesPerSecond = Save.loadValue("Upgrades", "CookiesPerSecond", Global.cookiesPerSecond)
	Global.cookieUpgradeScaling = Save.loadValue("Upgrades", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
