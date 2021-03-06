# Level Tracker
### TODOS: ✅
TODO: maybe add locked, chosen, unlocked classes dynamically, so they can animate.
TODO: Make levels persistent after click. Currently it defaults to level 1 on refresh.
###
export tag view-levels
	def levelText num
		if num is data.level_unlocked
			num
		else
			num

	def isUnlocked num
		if num <= data.level_unlocked
			return true
	def setLevel lvl
		data.setLevel(lvl)

	def render
		<self>
			<.wrapper>
				<div.level-button.chosen[px:2 cursor:default us:none]> 
					if data.ui_language is "english"
						"level"
					if data.ui_language is "khmer"
						"កម្រិត"
				for item,i in [0 ... data.level_count]
					if i > data.level_unlocked
						<div.level-button.locked @click.setLevel(i)> i + 1
					elif i <= data.level_chosen
						<div.level-button.chosen @click.setLevel(i)> i + 1
					elif i <= data.level_unlocked
						<div.level-button.unlocked @click.setLevel(i)> i + 1
	css
		d:block 
		bg:cooler9
	css .wrapper 
		w:100%
		d:flex jc:space-evenly
		bxs:sm,md,lg
		py:.4rem
		px:.4rem
	css .level-button 
		w:100% 
		ta:center 
		tween:all .5s lh:30px
		pt:.05rem
		rd:.2rem
		mr:.3rem
		us:none
		bdb:.4rem solid cooler8/20
		&.locked
			cursor:not-allowed
			c:cooler9
			@even
				bg:cooler6
			@odd
				bg:cooler7
		&.unlocked 
			bg:teal4 @odd:teal5 @hover:teal3
			cursor:pointer
		&.chosen 
			bg:lime4 @odd:lime5 @hover:lime3
			cursor:pointer