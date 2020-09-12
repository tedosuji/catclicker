extends Node2D

onready var silvercoin = $bg/catcoin_0/silvercoin

func _on_catbutton_pressed():
	Global.cookies += 1
	silvercoin.text = str(Global.cookies)

#this is basic cookie timer increase every second
func _on_Timer_timeout():
	Global.cookies += Global.cookiesPerSecond
	silvercoin.text = str(Global.cookies)

#this function should subtract silver Global.cookies
func _on_upgradebutton_pressed():
	var skip = _enoughCookieCheck(Global.cookieUpgrade)
	if skip == true:
		Global.cookies -= Global.cookieUpgrade
		silvercoin.text = str(Global.cookies)
		Global.cookieUpgrade = Global.cookieUpgrade*Global.cookieUpgradeScaling
		Global.cookieUpgradeScaling += 1

#this function checks if there is enough Global.cookies for transactions
#if there isnt, return false
func _enoughCookieCheck(check):
	if Global.cookies - check < 0:
		return false
	else:
		return true
