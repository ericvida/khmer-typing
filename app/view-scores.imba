# Typing Score
### TODOS ✅
TODO: Make Score part of state
TODO: Calculate words per minute 
- convert from from characters per minute 
- start calculating when player starts typing a new challenge
- stop calculating when challenge is complete.
TODO: Calculate Accuracy
- errors from length of string percentage
TODO: Calculate Mistakes
- Counter for errors
TODO: Unlock next level when passed
- 100% accuracy to pass
- 0 mistakes to pass
- 
###
export tag view-scores
	def accurancyScore 
		return 100 - Math.floor((data.score_mistakes / data.challenges[data.level_chosen].length) * 100)

	def render
		<self> 
			<.wpm> 
				<span> Math.floor(data.score_cpm)
				if data.ui_language is "english"
					" Chars Per Minute"
				if data.ui_language is "khmer"
					" ពាក្យក្នុងមួយនាទី"
			<.accuracy> 
				<span.warning> accurancyScore! + "%"
				if data.ui_language is "english"
					" Accuracy"
				if data.ui_language is "khmer"
					" ភាព​ត្រឹមត្រូវ"
			<.typos> 
				<span> data.score_mistakes
				if data.ui_language is "english"
					" Mistakes"
				if data.ui_language is "khmer"
					" កំហុស"
					
	css &
		bg:cooler9
		d:flex 
		jc:space-evenly
		c:cooler1
		fl:0 1 4rem
	css div fs:.9rem d:flex ai:center
	css span fs:2rem mr:.5rem fw:bold c:lime6
		&.alert
			c:yellow5
		&.warning
			c:orange5
		&.danger
			c:rose5