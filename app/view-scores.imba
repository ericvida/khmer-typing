# Typing Score
# TODO: Make Score part of state
export tag view-scores
	def render
		<self[]> 
			<.wpm> 
				<span> data.score_wpm
				if data.ui_language is "english"
					" Words Per Minute"
				if data.ui_language is "khmer"
					" ពាក្យក្នុងមួយនាទី"
			<.acc> 
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
					
	css bg:cooler9 d:flex jc:space-evenly
		c:cooler1
		div fs:.6rem d:flex ai:center
		span fs:3rem mr:.2rem fw:bold c:lime6
			&.alert
				c:yellow5
			&.warning
				c:orange5
			&.danger
				c:rose5