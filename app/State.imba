import {khmer_challenges, english_challenges} from './data_challenges'
import {khmer, english} from './localization'
import {data_keys} from './data_keys'
import confetti from 'canvas-confetti'
# import {syllables} from './syllables'

for challange, index in khmer_challenges
	khmer_challenges[index] = challange.split('').map(do(character) return {
		char: character
	})

for challange, index in english_challenges
	english_challenges[index] = challange.split('').map(do(character) return {
		char: character
	})


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
	challenge_language = 'khmer'
	keyboard_language = 'khmer'
	keyboard_colored = yes
	keyboard_hints = yes
	
	# Challenge Settings
	challenge_font = 'freehand'
	
	# Challenge Data
	challenges = khmer_challenges
	challenge_string = ''
	challenge_character = 0
	
	# Track unlocked level for English challenges and Khmer challenges independently
	# Level Data
	level_count = challenges.length
	level_unlocked = 0
	level_chosen = 0
	level_spm_threshold = 20
	level_finished = no

	keyboard_message = ''

	progress = {
		english: {
			level_count: english_challenges.length
			level_unlocked: 0
			level_chosen: 0
			level_finished: no
		}
		khmer: {
			level_count: khmer_challenges.length
			level_unlocked: 0
			level_chosen: 0
			level_finished: no
		}
	}

	# Score State
	score_cpm = 0
	score_mistakes = 0
	start_time = 0
	
	# Keyboard states
	shift_pressed = 0
	alt_pressed = 0

	pressed_keys = []

	# Localization
	lang = english
	language = ''


	def constructor
		ui_language = getCookie('ui_language') || ui_language
		setUILanguage(ui_language)

		progress = JSON.parse(getCookie('progress')) || progress
		updateProgress!

		keyboard_language = getCookie('keyboard_language') || keyboard_language
		challenge_language = getCookie('challenge_language') || challenge_language
		setChallengeLanguage(challenge_language)

	
		initializeHint!

		keyboard_colored = !(getCookie('keyboard_colored') == 'false')
		keyboard_hints = !(getCookie('keyboard_hints') == 'false')
		challenge_font = getCookie('challenge_font') || challenge_font


		document.onkeydown = do(e) keydownTracker(e)

		document.onkeyup = do(e)
			e.preventDefault!
			e.stopPropagation!
			pressed_keys.splice(pressed_keys.indexOf(e.key.toLowerCase!), 1)

			if pressed_keys.indexOf('shift') < 0
				unshiftChar! 

			if e.keyCode == 225
				pressed_keys.splice(pressed_keys.indexOf('alt'), 1)

			if pressed_keys.indexOf('alt') < 0
				unaltChar!

			imba.commit!


	def keydownTracker e
		e = e || window.event
		e.preventDefault!
		e.stopPropagation!
		

		if (e.keyCode == 13 or e.keyCode == 39) and not e.shiftKey
			setLevel(level_chosen + 1)

		elif e.keyCode is 37
			setLevel(level_chosen - 1)

		if e.shiftKey || e.key == 'Shift'
			shiftChar!

		if e.altKey || e.key == 'Alt' || e.keyCode == 225
			altChar!

		if pressed_keys.indexOf(e.key.toLowerCase!) == -1
			let keystr = e.key.toLowerCase!
			if keystr.slice(0,3) == 'alt'
				pressed_keys.push('alt')
			else
				pressed_keys.push(keystr)

		let key = data_keys.find(do(el) return el.english.indexOf(e.key) > -1)
		unless key
			key = data_keys.find(do(el) return el.khmer.indexOf(e.key) > -1)

		if key
			if key.char
				# Detect what key the user pressed in relation to alt and shift keys
				let key_char = ''
				if shift_pressed && not alt_pressed
					key_char = key[challenge_language][1]
				elif not shift_pressed && alt_pressed
					key_char = key[challenge_language][2]
				elif shift_pressed && alt_pressed
					key_char = key[challenge_language][3]
				else
					key_char = key[challenge_language][0]


				if key_char == challenges[level_chosen][challenge_character].char and not start_time
					start_time = Date.now()

				if start_time
					challenges[level_chosen][challenge_character].correct = key_char == challenges[level_chosen][challenge_character].char

					if !challenges[level_chosen][challenge_character].correct
						score_mistakes++
					
					keyboard_message = ''

					if challenge_character < challenges[level_chosen].length - 1
						challenge_character++
					else
						finishChallenge!
						return

					const timespan = Date.now! - start_time
					score_cpm = (challenge_character / timespan) * 60000
					# Fixed issue when score_cpm was equal to infinity.
					if score_cpm > 10000000
						score_cpm = 1

		if e.keyCode == 8
			if challenge_character > 0 && not level_finished
				challenge_character--

		if e.shiftKey && e.keyCode == 13
			setLevel(level_chosen)
		imba.commit!


	def shiftChar
		if shift_pressed is 0
			shift_pressed = 1
			imba.commit!

	def unshiftChar
		if shift_pressed > 0
			shift_pressed = 0
			imba.commit!
	
	def altChar
		if alt_pressed is 0
			alt_pressed = 1
			imba.commit!

	def unaltChar
		if alt_pressed > 0
			alt_pressed = 0
			imba.commit!


	
	def setLevel level
		if 0 <= level <= progress[challenge_language].level_unlocked
			progress[challenge_language].level_chosen = level
			progress[challenge_language].level_finished = no
			score_mistakes = 0
			challenge_character = 0
			start_time = 0
			score_cpm = 0

			updateProgress!
			initializeHint!


	def finishChallenge
		start_time = 0
		level_finished = yes

		if score_mistakes == 0 && level_unlocked == level_chosen && score_cpm >= level_spm_threshold
			confetti({
				particleCount: 200
				spread: 70
				origin: { y: .8 }
			})
			if level_unlocked < challenges.length - 1
				progress[challenge_language].level_unlocked++
				updateProgress!


	def initializeHint
		keyboard_message = "{lang.press} {getHint!} {lang.to_begin}"



	def setChallengeFont language
		challenge_font = language
		setCookie('challenge_font', challenge_font)
		
	def setUILanguage language
		ui_language = language
		setCookie('ui_language', ui_language)

		if ui_language is 'khmer'
			lang = khmer
		else
			lang = english

	def setKeyboardLanguage language
		keyboard_language = language
		setCookie('keyboard_language', keyboard_language)

	
	def updateProgress
		level_chosen = progress[challenge_language].level_chosen
		level_count = progress[challenge_language].level_count
		level_unlocked = progress[challenge_language].level_unlocked
		level_finished = progress[challenge_language].level_finished

		setCookie('progress', JSON.stringify(progress))
		

	def setChallengeLanguage language
		challenge_language = language
		setCookie('challenge_language', challenge_language)

		score_mistakes = 0
		challenge_character = 0
		start_time = 0

		if language == 'khmer'
			challenges = khmer_challenges
		else
			challenges = english_challenges

		updateProgress!


	def getHint
		let hint = ''
		const char = challenges[level_chosen][challenge_character].char

		let keyboard_char

		# Detect Chift and Alt.
		if /[A-Za-z]/.test(char)
			if char == char.toUpperCase! && char != ' '
				hint += 'Shift + '
				keyboard_char = data_keys.find(do(el) return el['english'].indexOf(char) > -1)
		else
			const khmer_char = data_keys.find(do(el) return el[challenge_language].indexOf(char) > -1)
			if khmer_char
				const index_of_khmer_char = khmer_char[challenge_language].indexOf(char)

				if index_of_khmer_char == 2
					hint += 'Alt + '

				elif index_of_khmer_char == 1
					hint += 'Shift + '

			keyboard_char = data_keys.find(do(el) return el['khmer'].indexOf(char) > -1)

		if keyboard_char
			hint += keyboard_char[keyboard_language][0]
		else
			hint = keyboard_message

		return hint


	def getCookie c_name
		return window.localStorage.getItem(c_name)

	def setCookie c_name, value
		window.localStorage.setItem(c_name, value)

