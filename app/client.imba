import 'imba/preflight.css'
import '@polymer/paper-toggle-button'
import {Bird} from './bird.imba'
global css @root
	ff:sans
	--font-khmer-headings: 'Moul', cursive
	--font-khmer-handwritten: 'Freehand', cursive
	--font-khmer-modern: 'Dangrek', cursive

# score state.
let score = 
	wpm: 0
	typos: 0
	accuracy: 0

# Typing Challenges. It's easier to type on a string, but easier to style if an array, so I use split.
let challenges = [
	('ថ ្ ថ ្ ថ ថ ្ ថ ្ ថ ថ ្ ្ ថ ថ ្ ថ').split('')
	('ដ ក ក ដ ក ដ ក ដ ដ ក ក ក ដ ក ដ').split('')
	('ស ល ស ល ល ស ស ល ស ស ល ល').split('')
	('ា ើ ើ ា ា ើ ើ ា ើ ា ើ ា ា ើ ា').split('')
	('ក្ក សា ថ្ថ លា ល្ល ដើ សើ ស្ស ថា ក្ក ល្ល ថ្ថ លា').split('')
	
]

let basic = yes
let colored = yes

# State of desired font for the challenge
let khmerStyle = 'handwritten'

# this is for selecting the UI language, but I haven't created alternative text fro the entire UI, but it's something I plan to do.
let UILanguage = "English"

# This selects the bird collor from the array, so by changing this number we could change the bird color.
let birdcolor = 11

# this was for easily changing the bird color, but I took the bird out for now.
let birdcolors = ["rose","red","pink","fuchsia","purple","indigo","blue","teal","sky","yellow","amber","orange"]

# 0 selects English & 2 selects khmer, 3 & 4 are shift layout for english and khmer.
# LANGUAGE SELECT
# 0 is english keyboard
# 1 is english + shift
# 2 is khmer 
# 3 is khmer + shift
let currentLanguage = 2

# Keyboard options. odd numbers are non-shift, and even numbers are shift keys.
let kb = [
		['\`','1','2','3','4','5','6','7','8','9','0','\-','\=','delete','tab','q','w','e','r','t','y','u','i','o','p','[',']','\\','caps lock','a','s','d','f','g','h','j','k','l',';','\'','return','shift','z','x','c','v','b','n','m',',','.','/','shift','fn','control','alt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['\~','!','@','#','$','%','^','&','*','(',')','\_','\+','delete','tab','Q','W','E','R','T','Y','U','I','O','P','\{','\}','\|','caps lock','A','S','D','F','G','H','J','K','L','\:','\"','return','shift','Z','X','C','V','B','N','M','<','>','?','shift','fn','control','alt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['«','១','២','៣','៤','៥','៦','៧','៨','៩','០','ឥ','ឲ','delete','ថេប','ឆ','ឹ','េ','រ','ត','យ','ុ','ិ','ោ','ផ','ៀ','ឪ','ឭ','ប្តូរជាប់','ា','ស','ដ','ថ','ង','ហ','្','ក','ល','ើ','់','បញ្ចូល','ប្តូរ','ឋ','ខ','ច','វ','ប','ន','ម','ឦ','។','៊','ប្តូរ','fn','ctrl','ជំនួស','cmd','space','cmd','ជំនួស','fn','⇠','⇡','⇣','⇢']
		['»','!','ៗ','"','៛','%','៍','័','៏','ឰ','ឳ','៌','៎','delete','ថេប','ឈ','ឺ','ែ','ឬ','ទ','ួ','ូ','ី','ៅ','ភ','ឿ','ឧ','ឮ','ប្តូរជាប់','ឫ','ៃ','ឌ','ធ','អ','ះ','ញ','គ','ឡ','៖','៉','បញ្ចូល','ប្តូរ','ឍ','ឃ','ជ','ៈ','ព','ណ','ំ','ឱ','៕','ឯ','ប្តូរ','fn','ctrl','ជំនួស','cmd','space','cmd','ជំនួស','fn','⇠','⇡','⇣','⇢']
	]

# this stores the number of challenges available
let levelsTotal = challenges.length

# This is for highlighting the current letter in the typing challenge
let currentLetter = 3

# Current Level Change this number to typing challenge start with 1
let levelReached = 4

# Level Tracker
tag level-tracker
	prop lvl = levelReached
	prop total = levelsTotal
	
	css .active
		bg:lime5
	
	def levelText num
		if num is levelReached
			num
		else
			num
	def isUnlocked num
		if num <= levelReached
			return true
	def render
		<self[mb:30px]>
			css pos:relative w:100% d:block mb:30px
			<.bg>
				css pos: absolute bg:cooler9 h:30px w:100% d:block
			<.fg>
				css pos: absolute bg:lime5 h:30px w:{100/total * lvl}% d:block
			<h1> "levels"
				css c:lime5 l:10px t:35px fw:bold pos: absolute
					
			<.steps>
				css pos: absolute w:100%
				<ul>
					css d:flex jc:space-evenly c:white
					for item,index in [0...(total)]
						<li>
							css w:{100/total}% d:inline-block h:30px lh:30px ta:right
							<span.active=(index <= lvl)>
								css size:30px bg:lime6 d:block float:right ta:center 
									@hover
										cursor:pointer
										bg:cooler1 c:cooler9 fw:bold
										us:none
								item + 1

# Typing Score
tag type-score
	css bg:cooler9 d:flex jc:space-evenly
		c:cooler1
		div fs:.6em d:flex ai:center
		span fs:3em mr:.2em fw:bold c:lime6
			&.alert
				c:yellow5
			&.warning
				c:orange5
			&.danger
				c:rose5
	def render
		<self[]> 
			<.wpm> 
				<span> score.wpm
				"words per minute"
			<.acc> 
				<span.warning> score.accuracy + "%"
				" accuracy"
			<.typos> 
				<span> score.typos
				" typos"

# disabled for now
tag bird-view
	css & 
		d:flex 
		jc:center 
		ai:center 
		min-height: 200px 
		bg:indigo1
	def render
		<self>
			<Bird[$size:10px @sm:14px] accent="{birdcolors[birdcolor]}" skin="{birdcolors[birdcolor]}" eyes="cooler">

# Type Challenge
tag type-challenge
	css & ff:khmer-handwritten fs:2em
	css span c:cooler1
		fs:.4em @xs: .5em @sm: .6em @md: .8em @lg: 1em
	css .correct c:cooler7
	css .wrong c:rose5/30
	css .current c:lime5  bdb:1px solid lime5
	def render
		<self> 
			<div>
				for item, i of challenges[levelReached]
					if i is currentLetter
						<span .current> "{item}"
					elif i <= currentLetter
						<span .correct> "{item}"
						# <span .wrong> "{item}"
					else
						<span> "{item}"

# Keyboard Viewer
tag keyboard-viewer
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
	def shiftChar
		currentLanguage = currentLanguage + 1
		render!
	def unshiftChar
		currentLanguage = currentLanguage - 1
		render!
	def render
		<self>
			<.board>
				<.key .square .lpinky=colored  > <span> kb[currentLanguage][0]
				<.key .square .lpinky=colored > <span> kb[currentLanguage][1]
				<.key .square .lring=colored > <span> kb[currentLanguage][2]
				<.key .square .lmiddle=colored > <span> kb[currentLanguage][3]
				<.key .square .lindex=colored > <span> kb[currentLanguage][4]
				<.key .square .lindex=colored > <span> kb[currentLanguage][5]
				<.key .square .rindex=colored > <span> kb[currentLanguage][6]
				<.key .square .rindex=colored > <span> kb[currentLanguage][7]
				<.key .square .rmiddle=colored > <span> kb[currentLanguage][8]
				<.key .square .rring=colored > <span> kb[currentLanguage][9]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][10]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][11]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][12]
				<.key .longer .rpinky=colored  .delete> <span> kb[currentLanguage][13]
				<.key .long .lpinky=colored  .tab> <span> kb[currentLanguage][14]
				<.key .square .lpinky=colored > <span> kb[currentLanguage][15]
				<.key .square .lring=colored > <span> kb[currentLanguage][16]
				<.key .square .lmiddle=colored > <span> kb[currentLanguage][17]
				<.key .square .lindex=colored > <span> kb[currentLanguage][18]
				<.key .square .lindex=colored > <span> kb[currentLanguage][19]
				<.key .square .rindex=colored > <span> kb[currentLanguage][20]
				<.key .square .rindex=colored > <span> kb[currentLanguage][21]
				<.key .square .rmiddle=colored > <span> kb[currentLanguage][22]
				<.key .square .rring=colored > <span> kb[currentLanguage][23]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][24]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][25]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][26]
				<.key .long .rpinky=colored  .backslash> <span> kb[currentLanguage][27]
				<.key .longer .lpinky=colored  .capslock> <span> kb[currentLanguage][28]
				<.key .square .lpinky=colored > <span> kb[currentLanguage][29]
				<.key .square .lring=colored > <span> kb[currentLanguage][30]
				<.key .square .lmiddle=colored > <span> kb[currentLanguage][31]
				<.key .square .lindex=colored > <span> kb[currentLanguage][32]
				<.key .square .lindex=colored > <span> kb[currentLanguage][33]
				<.key .square .rindex=colored > <span> kb[currentLanguage][34]
				<.key .square .rindex=colored > <span> kb[currentLanguage][35]
				<.key .square .rmiddle=colored > <span> kb[currentLanguage][36]
				<.key .square .rring=colored > <span> kb[currentLanguage][37]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][38]
				<.key .square .rpinky=colored > <span> kb[currentLanguage][39]
				<.key .longer .rpinky=colored .return> <span> kb[currentLanguage][40]
				<.key .longest .lpinky=colored .leftshift @pointerdown.mouse.shiftChar @pointerup.mouse.unshiftChar> <span> kb[currentLanguage][41]
				<.key .square .lpinky=colored > <span> kb[currentLanguage][42]
				<.key .square .lring=colored > <span> kb[currentLanguage][43]
				<.key .square .lmiddle=colored > <span> kb[currentLanguage][44]
				<.key .square .lindex=colored > <span> kb[currentLanguage][45]
				<.key .square .lindex=colored > <span> kb[currentLanguage][46]
				<.key .square .rindex=colored > <span> kb[currentLanguage][47]
				<.key .square .rindex=colored > <span> kb[currentLanguage][48]
				<.key .square .rmiddle=colored > <span> kb[currentLanguage][49]
				<.key .square .rring=colored > <span> kb[currentLanguage][50]
				<div$from.key .square .rpinky=colored > <span> kb[currentLanguage][51]
				<.key .longest .rpinky=colored .rightshift> <span> kb[currentLanguage][52]
				<.key .square .lpinky=colored .lfn .disabled=basic> if basic then '' else <span> kb[currentLanguage][53]
				<.key .square .lpinky=colored .lcontrol .disabled=basic> if basic then '' else <span> kb[currentLanguage][54]
				<.key .square .lpinky=colored .lalt> <span> kb[currentLanguage][55]
				<.key .long .lpinky=colored .command .disabled=basic> if basic then '' else <span> kb[currentLanguage][56]
				<.key .thumbs=colored .space > <span> kb[currentLanguage][57]
				<.key .square .disabled=basic .rring .rcommand> if basic then '' else <span> kb[currentLanguage][58]
				<.key .square .rpinky=colored .alt> <span> kb[currentLanguage][59]
				if !basic
					<.key .disabled=basic .square .rindex .larrow> <span> kb[currentLanguage][60]
				<.key .disabled=basic .square .rindex .larrow> <span> kb[currentLanguage][61]
				<.key .square .disabled=basic [bg:transparent]>
					<.updown.disabled=basic>
						<.rmiddle .rmiddle .up> <span> kb[currentLanguage][62]
						<.rmiddle .rmiddle .down> <span> kb[currentLanguage][63]
				<div.square.key.disabled=basic  .rring  .rarrow > <span> kb[currentLanguage][64]
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

tag app-settings
	def render
		<self>
			css d:flex flf:wrap jc:space-around
				bg:cooler9
				p:3 
			<div>
				<input bind=colored #colorkeys type="checkbox" name="keylang"> 
				<label for="colorkeys" name="keylang"> "Color Keys"
					css c:gray1
			<div>
				<select bind=currentLanguage>
					<option value="0"> "English"
					<option value="2"> "Khmer"
				<label> " Keyboard Language"
					css c:gray1
			<div>
				<select bind=UILanguage>
					<option value="English"> "English"
					<option value="Khmer"> "Khmer"
				<label> " UI Language"
					css c:gray1
			<div>
				<select bind=khmerStyle>
					<option value="Handwritten"> "Handwritten"
					<option value="Modern"> "Modern"
					<option value="Script"> "Script"
				<label> " font style"
					css c:gray1

tag app-root
	css fs:.4em @xs:.5em @sm:.6em @md: .8em @lg: 1.2em @xl: 1.4em
	def toggled val
		console.log val
		val = !val
		
	def render
		<self>
			css d:flex fld:column min-height: 100vh
				section
					max-width:100%
			<section>
				<level-tracker>
			<section>
				css flex: 1 0  d:flex fld:column
				<type-score[fl:0 1 100px]>
				# <bird-view[fl: 1 0 of:hidden]>
				<type-challenge[fl: 1 0 bg:cooler9 jc:center d:flex ai:center]>
			<section>
				css d:flex py:4 jc:center bg:cooler9 
				<keyboard-viewer>
			<section>
				css fl:1 bg:cooler9
			<section>
				<app-settings>
				
				
imba.mount <app-root>