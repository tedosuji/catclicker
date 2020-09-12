extends Node2D

var cookies = 0
var cookieUpgrade = 10
var cookieUpgradeScaling = 1
var cookiesPerSecond = 1

onready var silvercoin = $bg/catcoin_0/silvercoin

func _on_catbutton_pressed():
	cookies += 1
	silvercoin.text = str(cookies)

#this is basic cookie timer increase every second
func _on_Timer_timeout():
	cookies += cookiesPerSecond
	silvercoin.text = str(cookies)

#this function should subtract silver cookies
func _on_upgradebutton_pressed():
	var skip = _enoughCookieCheck(cookieUpgrade)
	if skip == true:
		cookies -= cookieUpgrade
		silvercoin.text = str(cookies)
		cookieUpgrade = cookieUpgrade*cookieUpgradeScaling
		cookieUpgradeScaling += 1

#this function checks if there is enough cookies for transactions
#if there isnt, return false
func _enoughCookieCheck(check):
	if cookies - check < 0:
		return false
	else:
		return true
