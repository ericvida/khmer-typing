import {data_challenges} from './data_challenges'
### Available objects
# Level Data
state.level_count
state.level_unlocked
state.level_chosen

# Challenge Data
state.khmer_challenges
state.challenge_string
state.challenge_character

# Keyboard States
state.shift_pressed
state.alt_pressed
state.del_pressed

# UI Settings
state.ui_language
state.setUiLanguage('')

# Keyboard Settings
state.keyboard_language
state.keyboard_colored
state.setKeyboardlanguage('')
state.setKeyboardlanguage('')

# Challenge Settings
state.challenge_font
state.setChallengeFont('')

###

export class State
	# UI Settings
	ui_language = "english"
	keyboard_language = 'english'
	keyboard_colored = yes
	
	# Challenge Settings
	challenge_font = 'handwritten'
	
	# Challenge Data
	khmer_challenges = data_challenges
	challenge_string = ''
	challenge_character = ''
	
	# Level Data
	level_count = 20
	level_unlocked = 4
	level_chosen = 2
	
	# Score State
	score_wpm = 0
	score_accuracy = 0
	score_mistakes = 0
	
	# Keyboard states
	shift_pressed = 0
	alt_pressed = 0
	
	def constructor
		ui_language = getCookie('ui_language') || ui_language
		keyboard_language = getCookie('keyboard_language') || keyboard_language
		keyboard_colored = !(getCookie('colored') == 'false')
		challenge_font = getCookie('challenge_font') || challenge_font
		
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
