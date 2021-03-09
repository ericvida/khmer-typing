# Type Challenge
### TODOS: ✅
TODO: consonant vowel pairs in khmer are joined into one character.
We need to make the character highlighting stay visible.
TODO: Console Error is thrown when user types more than lenght of challenge string
TODO: change state of last character of challenge. 
Currently it keeps the .current class even if the string was finished.
TODO: Space Typing Errors change the challenge string forever.
###



const vowels = ['ា', 'េ', 'ើ']

export tag view-challenge
	def fontFamily
		switch data.challenge_font
			when 'script' then return "'Moul', cursive, serif"
			when 'modern' then return "'Dangrek', cursive, sans-serif"
			else return "'freehand', cursive, script"
	

	def getHighlighting item, index
		if index is data.challenge_character && not data.level_finished
			return 'current'

		elif index <= data.challenge_character
			if data.challenge_character == index + 1
				const next_char = data.challenges[data.level_chosen][index + 1].char

				if next_char
					if vowels.indexOf(next_char) > -1
						return 'current'


			if item.correct
				return 'correct'
			else
				return 'wrong'
		return ''

	def render
		<self[ff:{fontFamily!}]>
			<div.wrapper>
				for item, i of data.challenges[data.level_chosen]
					<span .space=(item.char == ' ') .{getHighlighting(item, i)}> "{item.char}"


	css &
		$size: 3rem @xs: 2.1rem @lg: 2rem
		of:visible
		p:1rem
		d:flex
		min-height: 4em
		bg:cooler9 jc:center d:flex ai:center 

	css .wrapper
		w:100%
		d:block
		max-width: 45rem
		ta:center
		flex-shink: 1
		flex-basis: auto

	css span 
		c:cooler1
		fs:2em 
		lh:2.2em

	css .correct c:cooler6

	css .space
		w:1rem
		content: ''
		px:.5rem
		&.wrong
			pos:relative
			@before
				content: '•'
				fs:.8rem
				pos:absolute
				t:50% l:50% transform:translate(-50%, -50%)
			

	css .wrong c:rose5

	css .current c:lime5  bdb:5px solid lime5

	css .current::first-letter
		# c:lime5  bdb:5px solid lime5
		c:rose5  bdb:5px solid rose5