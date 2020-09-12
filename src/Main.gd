extends Node2D

var cookies = 0
var cookiesPerSecond = 1

onready var silvercoin = $bg/catcoin_0/silvercoin

func _on_catbutton_pressed():
	cookies += 1
	silvercoin.text = str(cookies)


func _on_Timer_timeout():
	cookies += cookiesPerSecond
	silvercoin.text = str(cookies)
