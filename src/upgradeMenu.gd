extends Node2D

#declaring text representation
onready var silvercoin = $bg/catcoin_0/silvercoin
onready var clickUpgradeText = $bg/clickUpgradeText
onready var cpsUpgradeText = $bg/cpsUpgradeText

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global._loadCurrentSave()
	silvercoin.text = str(Global.cookies)
	clickUpgradeText.text = str(Global.clickCookieUpgrade)
	cpsUpgradeText.text = str(Global.cpsCookieUpgrade)

func _on_Timer_timeout():
	Global.cookies += Global.cookiesPerSecond
	silvercoin.text = str(Global.cookies)
	Save.saveValue("Main", "Cookies", Global.cookies)

#this function handles click upgrades
func _on_upgradeButton_pressed():
	var skip = _enoughCookieCheck(Global.clickCookieUpgrade)
	if skip == true:
		Global.clickCookieUpgrade = _subtractCookiesUpdate(Global.clickCookieUpgrade)
		clickUpgradeText.text = str(Global.clickCookieUpgrade)
		Global.cookieClick += 1
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
	if skip == true:
		Global.cpsCookieUpgrade = _subtractCookiesUpdate(Global.cpsCookieUpgrade)
		cpsUpgradeText.text = str(Global.cpsCookieUpgrade)
		Global.cookiesPerSecond += 1
		#Global.cookieUpgradeScaling += 1

func _subtractCookiesUpdate(amount):
	Global.cookies -= amount
	silvercoin.text = str(Global.cookies)
	return amount*Global.cookieUpgradeScaling
	
	

func _upgradeClickItem(value):
	value += 1

#change scene function
func _returnToGame():
	Global._saveCurrentValues()
	get_tree().change_scene("res://src/Main.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
