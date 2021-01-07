extends Node2D

#declaring text representation
onready var silvercoin = $upgrade_bg/catcoin_0/silvercoin
onready var goldcoin = $upgrade_bg/catcoin_0/goldcoin
onready var clickUpgradeText = $upgrade_bg_frame/pet/clickUpgradeText
onready var cpsUpgradeText = $upgrade_bg_frame/fetch/cpsUpgradeText
onready var clickLevelText = $upgrade_bg_frame/pet/level/clickLevelText
onready var cpsLevelText = $upgrade_bg_frame/fetch/level/cpsLevelText


# Called when the node enters the scene tree for the first time.
func _ready():
	Global._loadCurrentSave()
	_update_upgrade_text()
	clickUpgradeText.text = str(Global.clickCookieUpgrade)
	cpsLevelText.text = str(Global.cookiesPerSecond)
	if Global.cookiesPerSecond == 0:
		Global.cpsCookieUpgrade = 100
		cpsUpgradeText.text = str(Global.cpsCookieUpgrade)
	else:
		cpsUpgradeText.text = str(Global.cpsCookieUpgrade)
	clickLevelText.text = str(Global.cookieClick)

#this is local to upgrade menu, a function to update cookie value text
func _update_upgrade_text():
	silvercoin.text = str(Global.cookies)
	goldcoin.text = str(Global.gcookies)

func _on_Timer_timeout():
	Global.cookies += Global.cookiesPerSecond
	_update_upgrade_text()
	Global._saveCurrentValues()

#this function handles click upgrades
func _on_upgradeButton_pressed():
	var skip = _enoughCookieCheck(Global.clickCookieUpgrade)
	var maxCheck = _checkClickLevel(Global.cookieClick)
	if maxCheck == false:
		if skip == true:
			_subtractCookiesUpdate(Global.clickCookieUpgrade)
			Global.cookieClick += 1
			Global.clickCookieUpgrade = Global.cookieClick * 10
			clickUpgradeText.text = str(Global.clickCookieUpgrade)
			clickLevelText.text = str(Global.cookieClick)
			#Global.cookieUpgradeScaling += 1

#this function checks if there is enough Global.cookies for transactions
func _enoughCookieCheck(check):
	if Global.cookies - check < 0:
		return false
	else:
		return true

#this function is for the cookies per second upgrade handling
func _on_cpsUpgradeButton_pressed():
	var skip = _enoughCookieCheck(Global.cpsCookieUpgrade)
	var maxCheck = _checkCPSLevel(Global.cookieClick)
	if maxCheck == false:
		if skip == true:
			_subtractCookiesUpdate(Global.cpsCookieUpgrade)
			Global.cookiesPerSecond += 1
			Global.cpsCookieUpgrade = Global.cookiesPerSecond * 50
			cpsUpgradeText.text = str(Global.cpsCookieUpgrade)
			cpsLevelText.text = str(Global.cookiesPerSecond)
			#Global.cookieUpgradeScaling += 1

func _subtractCookiesUpdate(amount):
	Global.cookies -= amount
	silvercoin.text = str(Global.cookies)

func _checkClickLevel(level):
	if level == 100:
		return true
	else:
		return false

func _checkCPSLevel(level):
	if level == 100:
		return true
	else:
		return false

#change scene function
func _returnToGame():
	Global._saveCurrentValues()
	get_tree().change_scene("res://src/Main.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
