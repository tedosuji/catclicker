extends Node2D

onready var silvercoin = $bg/catcoin_0/silvercoin

func _ready():
	Global.cookies = Save.loadValue("Main","Cookies", Global.cookies)
	silvercoin.text = str(Global.cookies)

func _on_catbutton_pressed():
	Global.cookies += 1
	silvercoin.text = str(Global.cookies)

#this is basic cookie timer increase every second
func _on_Timer_timeout():
	Global.cookies += Global.cookiesPerSecond
	silvercoin.text = str(Global.cookies)
	Global._saveCurrentValues()

func _switchToUpgradeMenu():
	get_tree().change_scene("res://src/upgradeMenu.tscn")
	Global._saveCurrentValues()
	

func _on_closeshop_pressed():
	$upgrademenu.hide()


func _on_shopbutton_pressed():
	$upgrademenu.show()
