# Level Tracker
# TODO: maybe add locked, chosen, unlocked classes dynamically, so they can animate.

export tag view-levels
	def levelText num
		if num is data.level_unlocked
			num
		else
			num
	def isUnlocked num
		if num <= data.level_unlocked
			return true
	def render
		<self>
			<.wrapper>
				<div.level-button.chosen[px:2]> 
					if data.ui_language is "english"
						"level"
					if data.ui_language is "khmer"
						"កម្រិត"
				for item,i in [0 ... data.level_count]
					if i > data.level_unlocked
						<div.level-button.locked> i + 1
					elif i is data.level_chosen
						<div.level-button.chosen> i + 1
					elif i <= data.level_unlocked
						<div.level-button.unlocked> i + 1
	css
		d:block 
		h:30px
		bg:cooler7
	css .wrapper 
		pos:relative 
		w:100% h:30px 
		d:flex jc:space-evenly
		bxs:sm,md,lg
	css .level-button 
		w:100% 
		ta:center 
		tween:all .5s lh:30px
		pt:.05em
		bdr:100% solid red
		&.locked
			cursor:not-allowed
			c:cooler9
			@even
				bg:cooler6
				bdr:.5em solid cooler8
			@odd
				bg:cooler7
				bdr:.5em solid cooler8
		&.unlocked 
			bg:yellow4 @odd:yellow3 @hover:yellow2
			cursor:pointer
			bdr:.5em solid yellow5
		&.chosen 
			bg:lime5 @hover:lime4
			bdr:.5em solid lime6
			cursor:pointer