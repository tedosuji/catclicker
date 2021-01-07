extends Node2D

# Declare member variables here. Examples:
var cookies = 0
var gcookies = 0
var clickCookieUpgrade = 10
var cpsCookieUpgrade = 10
var cookieUpgradeScaling = 2
var cookiesPerSecond = 0
var cookieClick = 1
var stoppedTime = null
var stoppedDate = null

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_get_timestamp()
		_saveCurrentValues()
		get_tree().quit() # default behavior

func _saveCurrentValues():
	Save.saveValue("Main", "Cookies", Global.cookies)
	Save.saveValue("Main", "Gold Cookies", Global.gcookies)
	Save.saveValue("Main", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Save.saveValue("Upgrade", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Save.saveValue("Upgrade", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Save.saveValue("Passive", "CookiesPerSecond", Global.cookiesPerSecond)
	Save.saveValue("Passive", "CookieClick", Global.cookieClick)
	Save.saveValue("Time", "stoppedTime", Global.stoppedTime)
	Save.saveValue("Time", "stoppedDate", Global.stoppedDate)
	
func _loadCurrentSave():
	Global.cookies = Save.loadValue("Main", "Cookies", Global.cookies)
	Global.gcookies = Save.loadValue("Main", "Gold Cookies", Global.gcookies)
	Global.cookieUpgradeScaling = Save.loadValue("Main", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Global.clickCookieUpgrade = Save.loadValue("Upgrade", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Global.cpsCookieUpgrade = Save.loadValue("Upgrade", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Global.cookiesPerSecond = Save.loadValue("Passive", "CookiesPerSecond", Global.cookiesPerSecond)
	Global.cookieClick = Save.loadValue("Passive", "CookieClick", Global.cookieClick)
	Global.stoppedTime = Save.loadValue("Time", "stoppedTime", Global.stoppedTime)
	Global.stoppedDate = Save.loadValue("Time", "stoppedDate", Global.stoppedDate)
	
#these functions stand to calculate the diff of cookies while not playing
func _get_timestamp():
	var time = OS.get_unix_time();
	var date = OS.get_date();
	Global.stoppedTime = time
	Global.stoppedDate = date

#c stands for check, s stands for start
func _calc_cookies_while_quit(savetime, savedate):
	#get time to check against
	var cookies_to_add = 0
	var checkTime = OS.get_unix_time();
	var checkDate = OS.get_date()
	
	#diff of seconds * cookiesPerSecond to credit silver coins
	cookies_to_add = (checkTime - savetime) * Global.cookiesPerSecond
	
	#return used to add in the main function
	return cookies_to_add
