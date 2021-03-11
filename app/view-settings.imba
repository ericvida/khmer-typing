export tag view-settings
	def setUILanguage language
		data.setUILanguage language

	def setKeyboardLanguage language
		data.keyboard_language = language
		data.setCookie('keyboard_language', data.keyboard_language)
		data.setKeyboardLanguage(language)
	
	def setChallengeLanguage language
		data.setChallengeLanguage(language)

	def toggleColored
		data.keyboard_colored = !data.keyboard_colored
		data.setCookie('keyboard_colored', data.keyboard_colored)

	def toggleHints
		data.keyboard_hints = !data.keyboard_hints
		data.setCookie('keyboard_hints', data.keyboard_hints)

	def setChallengeFont font
		data.challenge_font = font
		data.setCookie('challenge_font', data.challenge_font)

	def render
		<self>
			# <p> # TODO: not sure why, but won't render without adding element here
			# It works for me...
			<div>
				<input bind=data.keyboard_hints #hints type="checkbox" name="keyboardhints" @input=toggleHints> 
				<label for="hints" name="keyboardhints"> 
					data.lang.hints
			<div>
				<input bind=data.keyboard_colored #colorkeys type="checkbox" name="keylang" @input=toggleColored> 
				<label for="colorkeys" name="keylang">
					data.lang.colors
			<div>
				<select bind=data.challenge_language>
					<option value="english" @click=setChallengeLanguage("english")> "English"
					<option value="khmer" @click=setChallengeLanguage("khmer")> "Khmer"
				<label> 
					data.lang.challenge_language
			<div>
				<select bind=data.keyboard_language>
					<option value="english" @click=setKeyboardLanguage("english")> "English"
					<option value="khmer" @click=setKeyboardLanguage("khmer")> "Khmer"
				<label>
					data.lang.keyboard_language
			<div>
				<select bind=data.ui_language>
					<option value="english" @click=setUILanguage("english")> "English"
					<option value="khmer" @click=setUILanguage("khmer")> "Khmer"
				<label>
					data.lang.app_language
			<div>
				<select bind=data.challenge_font>
					<option @click=setChallengeFont("freehand") value="freehand"> "Handwritten"
					<option @click=setChallengeFont("modern") value="modern"> "Modern"
					<option @click=setChallengeFont("script") value="script"> "Script"
				<label>
					data.lang.khmer_font

	css &
		d:flex
		flf:wrap 
		jc:space-around
		bg:cooler9
		p:3 
		fs:0.85em
		label c:gray1
		us:none
	
	css input
		mr:8px

	css select
		font:inherit
		c:gray1
		bg:cooler8
		bd:1px solid cooler7
		mr:8px
		rd:4px