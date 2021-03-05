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
- 
###
export tag view-scores
	def render
		<self> 
			<.wpm> 
				<span> data.score_wpm
				if data.ui_language is "english"
					" Words Per Minute"
				if data.ui_language is "khmer"
					" ពាក្យក្នុងមួយនាទី"
			<.accuracy> 
				<span.warning> data.score_accuracy + "%"
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