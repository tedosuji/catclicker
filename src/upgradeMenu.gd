extends Node2D

onready var silvercoin = $bg/catcoin_0/silvercoin

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.cookies = Save.loadValue("Main","Cookies", Global.cookies)

#change scene function
func _returnToGame():
	get_tree().change_scene("res://src/Main.tscn")

#this function should subtract silver Global.cookies
func _on_upgradeButton_pressed():
	var skip = _enoughCookieCheck(Global.cookieUpgrade)
	if skip == true:
		Global.cookies -= Global.cookieUpgrade
		silvercoin.text = str(Global.cookies)
		Global.cookieUpgrade = Global.cookieUpgrade*Global.cookieUpgradeScaling
		Global.cookieUpgradeScaling += 1

#this function checks if there is enough Global.cookies for transactions
func _enoughCookieCheck(check):
	if Global.cookies - check < 0:
		return false
	else:
		return true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
