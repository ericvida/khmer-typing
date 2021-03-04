# Type Challenge
export tag view-challenges
	def fontFamily
		switch data.challenge_font
			when 'script' then return "'Moul', cursive"
			when 'modern' then return "'Dangrek', cursive"
			else return "'Freehand', cursive"
	def render
		<self [ff:{fontFamily!}]>
			<div>
				for item, i of data.challenges[data.level_chosen]
					if i is data.challenge_character
						<span .current> "{item.char}"

					elif i <= data.challenge_character
						<span .wrong=!item.correct .correct=item.correct> "{item.char}"

					else
						<span> "{item.char}"
	css fs:2em
	css span c:cooler1
		fs:.4em @xs: .5em @sm: .6em @md: .8em @lg: 1em
	css .correct c:cooler6
	css .wrong c:rose5
	css .current c:lime5  bdb:1px solid lime5