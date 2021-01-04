extends Node2D

# Declare member variables here. Examples:
var cookies = 0
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
	Save.saveValue("Main", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Save.saveValue("Upgrade", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Save.saveValue("Upgrade", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Save.saveValue("Passive", "CookiesPerSecond", Global.cookiesPerSecond)
	Save.saveValue("Passive", "CookieClick", Global.cookieClick)
	Save.saveValue("Time", "stoppedTime", Global.stoppedTime)
	Save.saveValue("Time", "stoppedDate", Global.stoppedDate)
	
func _loadCurrentSave():
	Global.cookies = Save.loadValue("Main", "Cookies", Global.cookies)
	Global.cookieUpgradeScaling = Save.loadValue("Main", "CookieUpgradeScaling", Global.cookieUpgradeScaling)
	Global.clickCookieUpgrade = Save.loadValue("Upgrade", "ClickCookieUpgrade", Global.clickCookieUpgrade)
	Global.cpsCookieUpgrade = Save.loadValue("Upgrade", "CpsCookieUpgrade", Global.cpsCookieUpgrade)
	Global.cookiesPerSecond = Save.loadValue("Passive", "CookiesPerSecond", Global.cookiesPerSecond)
	Global.cookieClick = Save.loadValue("Passive", "CookieClick", Global.cookieClick)
	Global.stoppedTime = Save.loadValue("Time", "stoppedTime", Global.stoppedTime)
	Global.stoppedDate = Save.loadValue("Time", "stoppedDate", Global.stoppedDate)
	
#these functions stand to calculate the diff of cookies while not playing
func _get_timestamp():
	var time = OS.get_time();
	var date = OS.get_date();
	Global.stoppedTime = time
	Global.stoppedDate = date

#c stands for check, s stands for start
func _calc_cookies_while_quit(savetime, savedate):
	#get time to check against
	var cookies_to_add = 0
	var checksecs = 0
	var savesecs = 0
	var yeardiff = 0
	var monthdiff = 0
	var daydiff = 0
	var checkTime = OS.get_time()
	var checkDate = OS.get_date()
	
	#convert all times to some form of seconds, calculate diff
	if checkDate["day"] != savedate["day"]:
		daydiff = (checkDate["day"] - savedate["day"])
		if checkDate["month"] != savedate["month"]:
			monthdiff = (checkDate["month"] - savedate["month"])
			if checkDate["year"] != savedate["year"]:
				yeardiff = (checkDate["year"] - savedate["year"])
	else:
		#start time of game or the "check time"
		checksecs += checkTime["hour"]*3600
		checksecs += checkTime["minute"]*60
		checksecs += checkTime["second"]
		
		#saved variable of quit time passed to function
		savesecs += savetime["hour"]*3600
		savesecs += savetime["minute"]*60
		savesecs += savetime["second"]
	
	#diff of seconds * cookiesPerSecond to credit silver coins
	cookies_to_add = (checksecs - savesecs) * Global.cookiesPerSecond
	
	#return used to add in the main function
	return cookies_to_add
