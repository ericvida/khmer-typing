
# Keyboard options. odd numbers are non-shift, and even numbers are shift keys.
let kb = [
		['\`','1','2','3','4','5','6','7','8','9','0','\-','\=','delete','tab','q','w','e','r','t','y','u','i','o','p','[',']','\\','caps lock','a','s','d','f','g','h','j','k','l',';','\'','return','shift','z','x','c','v','b','n','m',',','.','/','shift','fn','control','alt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['\~','!','@','#','$','%','^','&','*','(',')','\_','\+','delete','tab','Q','W','E','R','T','Y','U','I','O','P','\{','\}','\|','caps lock','A','S','D','F','G','H','J','K','L','\:','\"','return','shift','Z','X','C','V','B','N','M','<','>','?','shift','fn','control','alt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['«','១','២','៣','៤','៥','៦','៧','៨','៩','០','ឥ','ឲ','delete','ថេប','ឆ','ឹ','េ','រ','ត','យ','ុ','ិ','ោ','ផ','ៀ','ឪ','ឭ','ប្តូរជាប់','ា','ស','ដ','ថ','ង','ហ','្','ក','ល','ើ','់','បញ្ចូល','ប្តូរ','ឋ','ខ','ច','វ','ប','ន','ម','ឦ','។','៊','ប្តូរ','fn','ctrl','ជំនួស','cmd','space','cmd','ជំនួស','fn','⇠','⇡','⇣','⇢']
		['»','!','ៗ','"','៛','%','៍','័','៏','ឰ','ឳ','៌','៎','delete','ថេប','ឈ','ឺ','ែ','ឬ','ទ','ួ','ូ','ី','ៅ','ភ','ឿ','ឧ','ឮ','ប្តូរជាប់','ឫ','ៃ','ឌ','ធ','អ','ះ','ញ','គ','ឡ','៖','៉','បញ្ចូល','ប្តូរ','ឍ','ឃ','ជ','ៈ','ព','ណ','ំ','ឱ','៕','ឯ','ប្តូរ','fn','ctrl','ជំនួស','cmd','space','cmd','ជំនួស','fn','⇠','⇡','⇣','⇢']
	]


export tag keyboard-viewer
	pressed_keys = []
	letter_index = 0

	def mount
		document.onkeydown = do |e|
			e = e || window.event
			if e.shiftKey || e.key == 'Shift'
				shiftChar!

			unless pressed_keys.indexOf(e.key.toLowerCase!) > -1
				pressed_keys.push(e.key.toLowerCase!)

			# TODO
			# if 

			imba.commit!


		document.onkeyup = do |e|
			unshiftChar!
			pressed_keys.splice(pressed_keys.indexOf(e.key.toLowerCase!), 1)
			imba.commit!




	def shiftChar
		data.keyboardLanguage = data.keyboardLanguage + 1
		imba.commit!

	def unshiftChar
		if data.keyboardLanguage > 0
			data.keyboardLanguage = data.keyboardLanguage - 1
			imba.commit!


	def pressed key
		if pressed_keys.indexOf(key) > -1
			return yes
		else
			return no

	def render
		<self>
			<.board>
				<.key .pressed=pressed('`') .square .lpinky=data.colored  > <span> kb[data.keyboardLanguage][0]
				<.key .pressed=pressed('1') .square .lpinky=data.colored > <span> kb[data.keyboardLanguage][1]
				<.key .pressed=pressed('2') .square .lring=data.colored > <span> kb[data.keyboardLanguage][2]
				<.key .pressed=pressed('3') .square .lmiddle=data.colored > <span> kb[data.keyboardLanguage][3]
				<.key .pressed=pressed('4') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][4]
				<.key .pressed=pressed('5') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][5]
				<.key .pressed=pressed('6') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][6]
				<.key .pressed=pressed('7') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][7]
				<.key .pressed=pressed('8') .square .rmiddle=data.colored > <span> kb[data.keyboardLanguage][8]
				<.key .pressed=pressed('9') .square .rring=data.colored > <span> kb[data.keyboardLanguage][9]
				<.key .pressed=pressed('0') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][10]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][11]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][12]
				<.key .pressed=pressed('=') .longer .rpinky=data.colored .delete> <span> kb[data.keyboardLanguage][13]
				<.key .pressed=pressed('=') .long .lpinky=data.colored .tab> <span> kb[data.keyboardLanguage][14]
				<.key .pressed=pressed('=') .square .lpinky=data.colored > <span> kb[data.keyboardLanguage][15]
				<.key .pressed=pressed('=') .square .lring=data.colored > <span> kb[data.keyboardLanguage][16]
				<.key .pressed=pressed('=') .square .lmiddle=data.colored > <span> kb[data.keyboardLanguage][17]
				<.key .pressed=pressed('=') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][18]
				<.key .pressed=pressed('=') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][19]
				<.key .pressed=pressed('=') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][20]
				<.key .pressed=pressed('=') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][21]
				<.key .pressed=pressed('=') .square .rmiddle=data.colored > <span> kb[data.keyboardLanguage][22]
				<.key .pressed=pressed('=') .square .rring=data.colored > <span> kb[data.keyboardLanguage][23]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][24]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][25]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][26]
				<.key .pressed=pressed('=') .long .rpinky=data.colored  .backslash> <span> kb[data.keyboardLanguage][27]
				<.key .pressed=pressed('=') .longer .lpinky=data.colored  .capslock> <span> kb[data.keyboardLanguage][28]
				<.key .pressed=pressed('=') .square .lpinky=data.colored > <span> kb[data.keyboardLanguage][29]
				<.key .pressed=pressed('=') .square .lring=data.colored > <span> kb[data.keyboardLanguage][30]
				<.key .pressed=pressed('=') .square .lmiddle=data.colored > <span> kb[data.keyboardLanguage][31]
				<.key .pressed=pressed('=') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][32]
				<.key .pressed=pressed('=') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][33]
				<.key .pressed=pressed('=') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][34]
				<.key .pressed=pressed('=') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][35]
				<.key .pressed=pressed('=') .square .rmiddle=data.colored > <span> kb[data.keyboardLanguage][36]
				<.key .pressed=pressed('=') .square .rring=data.colored > <span> kb[data.keyboardLanguage][37]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][38]
				<.key .pressed=pressed('=') .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][39]
				<.key .pressed=pressed('=') .longer .rpinky=data.colored .return> <span> kb[data.keyboardLanguage][40]
				<.key .pressed=pressed('=') .longest .lpinky=data.colored .leftshift @pointerdown.mouse.shiftChar @pointerup.mouse.unshiftChar> <span> kb[data.keyboardLanguage][41]
				<.key .pressed=pressed('=') .square .lpinky=data.colored > <span> kb[data.keyboardLanguage][42]
				<.key .pressed=pressed('=') .square .lring=data.colored > <span> kb[data.keyboardLanguage][43]
				<.key .pressed=pressed('=') .square .lmiddle=data.colored > <span> kb[data.keyboardLanguage][44]
				<.key .pressed=pressed('=') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][45]
				<.key .pressed=pressed('=') .square .lindex=data.colored > <span> kb[data.keyboardLanguage][46]
				<.key .pressed=pressed('=') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][47]
				<.key .pressed=pressed('=') .square .rindex=data.colored > <span> kb[data.keyboardLanguage][48]
				<.key .pressed=pressed('=') .square .rmiddle=data.colored > <span> kb[data.keyboardLanguage][49]
				<.key .pressed=pressed('=') .square .rring=data.colored > <span> kb[data.keyboardLanguage][50]
				<div$from.key .square .rpinky=data.colored > <span> kb[data.keyboardLanguage][51]
				<.key .pressed=pressed('=') .longest .rpinky=data.colored .rightshift> <span> kb[data.keyboardLanguage][52]
				<.key .pressed=pressed('=') .square .lpinky=data.colored .lfn .disabled=basic> if basic then '' else <span> kb[data.keyboardLanguage][53]
				<.key .pressed=pressed('=') .square .lpinky=data.colored .lcontrol .disabled=basic> if basic then '' else <span> kb[data.keyboardLanguage][54]
				<.key .pressed=pressed('=') .square .lpinky=data.colored .lalt> <span> kb[data.keyboardLanguage][55]
				<.key .pressed=pressed('=') .long .lpinky=data.colored .command .disabled=basic> if basic then '' else <span> kb[data.keyboardLanguage][56]
				<.key .pressed=pressed('=') .thumbs=data.colored .space > <span> kb[data.keyboardLanguage][57]
				<.key .pressed=pressed('=') .square .disabled=basic .rring .rcommand> if basic then '' else <span> kb[data.keyboardLanguage][58]
				<.key .pressed=pressed('=') .square .rpinky=data.colored .alt> <span> kb[data.keyboardLanguage][59]
				if !basic
					<.key .pressed=pressed('=') .disabled=basic .square .rindex .larrow> <span> kb[data.keyboardLanguage][60]
				<.key .pressed=pressed('=') .disabled=basic .square .rindex .larrow> <span> kb[data.keyboardLanguage][61]
				<.key .pressed=pressed('=') .square .disabled=basic [bg:transparent]>
					<.updown.disabled=basic>
						<.rmiddle .pressed=pressed('=') .rmiddle .up> <span> kb[data.keyboardLanguage][62]
						<.rmiddle .pressed=pressed('=') .rmiddle .down> <span> kb[data.keyboardLanguage][63]
				<div.square.key.disabled=basic .pressed=pressed('=') .rring  .rarrow > <span> kb[data.keyboardLanguage][64]

	css &
		p:10px rd:md d:inline-block bg:cooler8 bxs:sm,md,md,xl
		.lpinky bg: rose5
		.lring bg: pink5
		.lmiddle bg: violet5
		.lindex bg: blue5
		.thumbs bg: yellow3 
		.rindex bg: teal5
		.rmiddle bg: lime5
		.rring bg: amber5
		.rpinky bg: orange5
	


	css .board
		fs: 1em
		d: grid jc:center
		gtc: repeat(30, 1em)
		grid-gap: .5em

	css .square
		$aspect-ratio: 1/1
		grid-column: span 2
		pt: calc(100% / $aspect-ratio)

	css .long
		grid-column: span 3
	css .longer
		grid-column: span 4
	css .longest
		grid-column: span 5
	css .key 
		rd: .3em
		d:grid
		pos: relative
		us:none
		transform@active: translateY(.1em)
		bxs:sm, md, lg @hover:sm, md, lg
		bg:cooler3 @hover:cooler1
		span
			pos: absolute
			l: 50% transform:translateX(-50%)
		svg 
			d:block mx:auto
			position: absolute
			t: 50%
			transform: translateY(-50%) size:1.2em
		&.disabled
			bxs:lg
			bg:cooler6 @hover:cooler6

	css .updown
		rd: .3em
		grid-column: span 2
		pos: absolute t:0 r:0 b:0 l:0
		d:flex jc:space-between fld:column
		bxs:none @hover:none
		.up, .down
			d:flex rd:lg h:45% ai:center
			w:100% jc: space-between
			us:none
			bxs@hover:outline
		&.disabled
			bg:transparent @hover:transparent
			.up, .down
				bg:cooler6 @active:cooler6
				bxs@hover:none

	css .space 
		grid-column: span 11

	css .pressed
		transform: translateY(.1em)
		bxs:sm, md, lg
		bg@important:cooler1