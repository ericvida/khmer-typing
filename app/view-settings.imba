export tag view-settings
	def setLanguage language
		data.setUILanguage language
	def setChallengeLanguage language
		data.setChallengeLanguage(language)
	def setKeyboardLanguage language
		data.keyboard_language = language
		data.setCookie('keyboard_language', data.keyboard_language)
		setChallengeLanguage(language)
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
			<p> # TODO: not sure why, but won't render without adding element here
			<div>
				<input bind=data.keyboard_hints #hints type="checkbox" name="keyboardhints" @input=toggleHints> 
				<label for="hints" name="keyboardhints"> 
					if data.ui_language is "english"
						" Hints"
					if data.ui_language is "khmer"
						" ព័ត៌មានជំនួយ"
			<div>
				<input bind=data.keyboard_colored #colorkeys type="checkbox" name="keylang" @input=toggleColored> 
				<label for="colorkeys" name="keylang"> 
					if data.ui_language is "english"
						" Colors"
					if data.ui_language is "khmer"
						" មានពណ៌"
			<div>
				<select bind=data.keyboard_language>
					<option value="english" @click.setKeyboardLanguage("english")> "English"
					<option value="khmer" @click.setKeyboardLanguage("khmer")> "Khmer"
				<label> 
					if data.ui_language is "english"
						" Keyboard Language"
					if data.ui_language is "khmer"
						" ភាសាក្តារចុច"
			<div>
				<select bind=data.ui_language>
					<option value="english" @click=setUILanguage("english")> "English"
					<option value="khmer" @click=setUILanguage("khmer")> "Khmer"
				<label> 
					if data.ui_language is "english"
						" App Language"
					if data.ui_language is "khmer"
						" ភាសាកម្មវិធី"
			<div>
				<select bind=data.challenge_font>
					<option @click=setChallengeFont("freehand") value="freehand"> "Handwritten"
					<option @click=setChallengeFont("modern") value="modern"> "Modern"
					<option @click=setChallengeFont("formal") value="formal"> "Formal"
				<label> 
					if data.ui_language is "english"
						" Khmer Font"
					if data.ui_language is "khmer"
						" ពុម្ពអក្សរខ្មែរ"
	css &
		d:flex
		flf:wrap 
		jc:space-around
		bg:cooler9
		p:3 
		label c:gray1