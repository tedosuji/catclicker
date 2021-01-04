extends Node2D

onready var silvercoin = $bg/catcoin_0/silvercoin

func _ready():
	Global._loadCurrentSave()
	if Global.stoppedDate != null:
		var awayCookies = Global._calc_cookies_while_quit(Global.stoppedTime,Global.stoppedDate)
		Global.cookies += awayCookies
		Global.stoppedDate = null
		Global.stoppedTime = null
	silvercoin.text = str(Global.cookies)

#this function is the main cat click, earn cookies
func _on_catbutton_pressed():
	Global.cookies += Global.cookieClick
	silvercoin.text = str(Global.cookies)

#this is basic cookie timer increase every second
func _on_Timer_timeout():
	Global.cookies += Global.cookiesPerSecond
	silvercoin.text = str(Global.cookies)
	Global._saveCurrentValues()

#switch scenes functions
func _switchToUpgradeMenu():
	Global._saveCurrentValues()
	get_tree().change_scene("res://src/upgradeMenu.tscn")
	

func _on_closeshop_pressed():
	$upgrademenu.hide()

func _on_shopbutton_pressed():
	$upgrademenu.show()

