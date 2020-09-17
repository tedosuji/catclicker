extends Node2D

# Declare member variables here. Examples:
var cookies = 0
var clickCookieUpgrade = 10
var cpsCookieUpgrade = 10
var cookieUpgradeScaling = 2
var cookiesPerSecond = 0
var cookieClick = 1


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_saveCurrentValues()
		get_tree().quit() # default behavior

func _saveCurrentValues():
	Save.saveValue("Main", "Cookies", Global.cookies)
	Save.saveValue("Main", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Save.saveValue("Upgrade", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Save.saveValue("Upgrade", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Save.saveValue("Passive", "CookiesPerSecond", Global.cookiesPerSecond)
	Save.saveValue("Passive", "CookieClick", Global.cookieClick)
	
func _loadCurrentSave():
	Global.cookies = Save.loadValue("Main", "Cookies", Global.cookies)
	Global.cookieUpgradeScaling = Save.loadValue("Main", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Global.clickCookieUpgrade = Save.loadValue("Upgrade", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Global.cpsCookieUpgrade = Save.loadValue("Upgrade", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Global.cookiesPerSecond = Save.loadValue("Passive", "CookiesPerSecond", Global.cookiesPerSecond)
	Global.cookieClick = Save.loadValue("Passive", "CookieClick", Global.cookieClick)
	
	
