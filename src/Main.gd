extends Node2D

onready var silvercoin = $bg/catcoin_0/silvercoin
onready var goldcoin = $bg/catcoin_0/goldcoin

func _ready():
	Global._loadCurrentSave()
	if Global.stoppedDate != null:
		var awayCookies = Global._calc_cookies_while_quit(Global.stoppedTime,Global.stoppedDate)
		Global.cookies += awayCookies
		Global.stoppedDate = null
		Global.stoppedTime = null
	_update_main_text()

func _update_main_text():
	silvercoin.text = str(Global.cookies)
	goldcoin.text = str(Global.gcookies)

#this function is the main cat click, earn cookies
func _on_catbutton_pressed():
	Global.cookies += Global.cookieClick
	_update_main_text()
	
#this function is the jackpot button, earn GOLD cookies
func _on_jackpotbutton_pressed():
#logic for jackpot goes here
	
	_update_main_text()

#this is basic cookie timer increase every second
func _on_Timer_timeout():
	Global.cookies += Global.cookiesPerSecond
	_update_main_text()
	Global._saveCurrentValues()

#switch scenes functions
func _switchToUpgradeMenu():
	Global._saveCurrentValues()
	get_tree().change_scene("res://src/upgradeMenu.tscn")
	

func _on_closeshop_pressed():
	$upgrademenu.hide()

func _on_shopbutton_pressed():
	$upgrademenu.show()

