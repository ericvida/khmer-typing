# Typing Score
### TODOS ✅
TODO: Make Score part of state
TODO: Calculate words per minute 
- from characters per minute 
- start calculating when player starts typing a new challenge
- stop calculating when challenge is complete.
TODO: Calculate Accuracy
- Count the errors from length of string percentage
TODO: Calculate Mistakes
- Counter for errors
TODO: Unlock next level when passed
- 100% accuracy to pass
- 0 mistakes to pass
###
export tag view-scores
	def accurancyScore 
		return 100 - Math.floor((data.score_mistakes / data.challenges[data.level_chosen].length) * 100)

	def render
		<self> 
			<.wpm> 
				<span> Math.floor(data.score_cpm)
				data.lang.cpm
				# if data.ui_language is "english"
				# 	" "
				# if data.ui_language is "khmer"
				# 	" "
			<.accuracy> 
				<span.warning> accurancyScore! + "%"
				data.lang.accurancy_score
				# if data.ui_language is "english"
				# 	" "
				# if data.ui_language is "khmer"
				# 	" "
			<.typos> 
				<span> data.score_mistakes
				data.lang.mistakes_score
				# if data.ui_language is "english"
				# 	" Mistakes"
				# if data.ui_language is "khmer"
				# 	" កំហុស"
					
	css &
		bg:cooler9
		d:flex 
		jc:space-evenly
		c:cooler1
		fl:0 1 4rem
	css div 
		fs:.9rem 
		d:flex 
		ai:center
		us:none
	css span 
		fs:2rem 
		mr:.5rem 
		fw:bold 
		c:lime6
		&.alert
			c:yellow5
		&.warning
			c:orange5
		&.danger
			c:rose5