import {challenges} from './challenges'

export class  State
	# basic = yes
	colored = yes

	# this is for selecting the UI language, but I haven't created alternative text fro the entire UI, but it's something I plan to do.
	ui_language = "english"
	keyboard_language = 'english'

	# State of desired font for the challenge
	challenge_font = 'handwritten'

	# 0 selects English & 2 selects khmer, 3 & 4 are shift layout for english and khmer.
	# LANGUAGE SELECT
	# 0 is english keyboard
	# 1 is english + shift
	# 2 is khmer 
	# 3 is khmer + shift
	shift_pressed = 0
	alt_pressed = 0

	challenge = ''


	def constructor
		ui_language = getCookie('ui_language') || ui_language
		keyboard_language = getCookie('keyboard_language') || keyboard_language
		challenge_font = getCookie('challenge_font') || challenge_font
		colored = !(getCookie('colored') == 'false')
		
	def setChallengeFont language
		setCookie('challenge_font', challenge_font)
		challenge_font = language
		
	def setUILanguage language
		setCookie('ui_language', ui_language)
		ui_language = language
	
	def setKeyboardLanguage language
		setCookie('keyboard_language', keyboard_language)
		keyboard_language = language

	def getCookie c_name
		return window.localStorage.getItem(c_name)

	def setCookie c_name, value
		window.localStorage.setItem(c_name, value)
