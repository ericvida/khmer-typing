import {challenges} from './challenges'

export class  State
	# basic = yes
	colored = yes

	# this is for selecting the UI language, but I haven't created alternative text fro the entire UI, but it's something I plan to do.
	uilanguage = "English"

	# State of desired font for the challenge
	challenge_font = 'handwritten'

	# 0 selects English & 2 selects khmer, 3 & 4 are shift layout for english and khmer.
	# LANGUAGE SELECT
	# 0 is english keyboard
	# 1 is english + shift
	# 2 is khmer 
	# 3 is khmer + shift
	keyboardLanguage = 2

	challenge = ''


	def constructor
		uilanguage = getCookie('uilanguage') || uilanguage
		challenge_font = getCookie('challenge_font') || challenge_font
		colored = !(getCookie('colored') == 'false')
		
	
	def setUILanguage language
		setCookie('uilanguage', uilanguage)
		uilanguage = language

	
	def getCookie c_name
		return window.localStorage.getItem(c_name)

	def setCookie c_name, value
		window.localStorage.setItem(c_name, value)
