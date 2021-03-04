import {khmer_challenges, english_challenges} from './data_challenges'
import {data_keys} from './data_keys'

for challange, index in khmer_challenges
	khmer_challenges[index] = challange.split('').map(do(character) return {
		char: character
	})

for challange, index in english_challenges
	english_challenges[index] = challange.split('').map(do(character) return {
		char: character
	})


console.log khmer_challenges, english_challenges


### Available objects'
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
	keyboard_hints = yes
	
	# Challenge Settings
	challenge_font = 'freehand'
	
	# Challenge Data
	challenges = khmer_challenges
	challenge_string = ''
	challenge_character = 0
	
	# Level Data
	level_count = 20
	level_unlocked = 4
	level_chosen = 0
	
	# Score State
	score_wpm = 0
	score_accuracy = 0
	score_mistakes = 0
	
	# Keyboard states
	shift_pressed = 0
	alt_pressed = 0

	pressed_keys = []

	
	def constructor
		ui_language = getCookie('ui_language') || ui_language
		keyboard_language = getCookie('keyboard_language') || keyboard_language
		level_unlocked = getCookie('level_unlocked') || level_unlocked
		level_chosen = getCookie('level_chosen') || level_chosen
		keyboard_colored = !(getCookie('keyboard_colored') == 'false')
		keyboard_hints = !(getCookie('keyboard_hints') == 'false')
		challenge_font = getCookie('challenge_font') || challenge_font
		pressed_keys = []


		document.onkeydown = do(e)
			e = e || window.event
			e.preventDefault!
			e.stopPropagation!

			if e.shiftKey || e.key == 'Shift'
				shiftChar!

			unless pressed_keys.indexOf(e.key.toLowerCase!) > -1
				pressed_keys.push(e.key.toLowerCase!)

			# console.log e
			const key = data_keys.find(do(el) return el.english.indexOf(e.key) > -1)
			if key
				if key.type == 'char'
					console.log key["{keyboard_language}"][shift_pressed]
					challenges[level_chosen][challenge_character].correct = key["{keyboard_language}"][shift_pressed] == challenges[level_chosen][challenge_character].char

					if !challenges[level_chosen][challenge_character].correct and challenges[level_chosen][challenge_character].char == ' '
						challenges[level_chosen][challenge_character].char = '·'


					if challenge_character < challenges[level_chosen].length
						challenge_character++

			imba.commit!




		document.onkeyup = do(e)
			e.preventDefault!
			e.stopPropagation!
			pressed_keys.splice(pressed_keys.indexOf(e.key.toLowerCase!), 1)

			if pressed_keys.indexOf('shift') < 0
				unshiftChar!

			imba.commit!


			
	def shiftChar
		if shift_pressed is 0
			shift_pressed = 1
			imba.commit!

	def unshiftChar
		if shift_pressed > 0
			shift_pressed = 0
			imba.commit!
	
	def setLevel level
		if level !== level_chosen and level <= level_unlocked
			level_chosen = level

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
