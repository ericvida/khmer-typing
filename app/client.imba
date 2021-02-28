import 'imba/preflight.css'
import '@polymer/paper-toggle-button'
import {Bird} from './bird.imba'
global css @root
	ff:sans
	--font-khmer-headings: 'Moul', cursive
	--font-khmer-handwritten: 'Freehand', cursive
	--font-khmer-modern: 'Dangrek', cursive
let challenges = [
	['ថ'," ",""," ",'ថ',"ថ",'ថ'," ",'ថ',"ថ",' '," ",'ថ'," ",'ថ'," ",'ថ'," ",] 
	['ថ'," ",'\ ្',' ', 'ថ','\ ្',' ','ថ','ថ'," ",'\ ្',' ', 'ថ','\ ្',' ','ថ','ថ'," ",'\ ្',' ', 'ថ','\ ្',' ','ថ'] # level 1
]
let basic = yes
let colored = yes

# LANGUAGE SELECT
# 0 is english keyboard
# 1 is english + shift
# 2 is khmer 
# 3 is khmer + shift
let language = 2 

let birdcolor = 11
let birdcolors = ["rose","red","pink","fuchsia","purple","indigo","blue","teal","sky","yellow","amber","orange"]

let currentLanguage = language

let currentLetter = 7

let levelReached = 1
let kb = [
		['`','1','2','3','4','5','6','7','8','9','0','minus','plus','delete','tab','q','w','e','r','t','y','u','i','o','p','[',']','\\','caps lock','a','s','d','f','g','h','j','k','l',';','\'','return','shift','z','x','c','v','b','n','m',',','.','/','shift','fn','control','alt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['`','1','2','3','4','5','6','7','8','9','0','minus','plus','delete','tab','q','w','e','r','t','y','u','i','o','p','[',']','\\','caps lock','a','s','d','f','g','h','j','k','l',';','\'','return','shift','z','x','c','v','b','n','m',',','.','/','shift','fn','control','alt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['«','១','២','៣','៤','៥','៦','៧','៨','៩','០','ឥ','ឲ','delete','ថេប','ឆ','ឹ','េ','រ','ត','យ','ុ','ិ','ោ','ផ','ៀ','ឪ','ឭ','ប្តូរជាប់','ា','ស','ដ','ថ','ង','ហ','្','ក','ល','ើ','់','បញ្ចូល','ប្តូរ','ឋ','ខ','ច','វ','ប','ន','ម','ឦ','។','៊','ប្តូរ','fn','ctrl','ជំនួស','cmd','space','cmd','ជំនួស','fn','⇠','⇡','⇣','⇢']
		['»','!','ៗ','"','៛','%','៍','័','៏','ឰ','ឳ','៌','៎','delete','ថេប','ឈ','ឺ','ែ','ឬ','ទ','ួ','ូ','ី','ៅ','ភ','ឿ','ឧ','ឮ','ប្តូរជាប់','ឫ','ៃ','ឌ','ធ','អ','ះ','ញ','គ','ឡ','៖','៉','បញ្ចូល','ប្តូរ','ឍ','ឃ','ជ','ៈ','ព','ណ','ំ','ឱ','៕','ឯ','ប្តូរ','fn','ctrl','ជំនួស','cmd','space','cmd','ជំនួស','fn','⇠','⇡','⇣','⇢']
	]

tag level-view
	def levelText num
		if num is levelReached
			num
		else
			num
	def isUnlocked num
		if num <= levelReached
			return true
	def render
		<self> 
			<span.last.unlocked=isUnlocked(22)> levelText(22)
			<span.unlocked=isUnlocked(21)> levelText(21)
			<span.unlocked=isUnlocked(20)> levelText(20)
			<span.unlocked=isUnlocked(19)> levelText(19)
			<span.unlocked=isUnlocked(18)> levelText(18)
			<span.unlocked=isUnlocked(17)> levelText(17)
			<span.unlocked=isUnlocked(16)> levelText(16)
			<span.unlocked=isUnlocked(15)> levelText(15)
			<span.unlocked=isUnlocked(14)> levelText(14)
			<span.unlocked=isUnlocked(13)> levelText(13)
			<span.unlocked=isUnlocked(12)> levelText(12)
			<span.unlocked=isUnlocked(11)> levelText(11)
			<span.unlocked=isUnlocked(10)> levelText(10)
			<span.unlocked=isUnlocked(9)> levelText(9)
			<span.unlocked=isUnlocked(8)> levelText(8)
			<span.unlocked=isUnlocked(7)> levelText(7)
			<span.unlocked=isUnlocked(6)> levelText(6)
			<span.unlocked=isUnlocked(5)> levelText(5)
			<span.unlocked=isUnlocked(4)> levelText(4)
			<span.unlocked=isUnlocked(3)> levelText(3)
			<span.unlocked=isUnlocked(2)> levelText(2)
			<span.unlocked=isUnlocked(1)> levelText(1)
	css & d:flex jc:space-evenly fld:row-reverse
		fs:1em @lt-md:.6em
		span rd@last:none
		span
			lh:22px 
			flg:1 
			ta:right 
			pr:2 
			rdr:full @last:none 
			ml:-20px 
			bg:cooler9 
			bd:4px solid cooler1/5 c:cooler6
		.unlocked 
			bg: lime5 
			bd: 4px solid lime6 
			c:lime9 
			fw:bold

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

tag challenge-view
	css & ta:center py:5 ff:khmer-handwritten fs:2em
	css span c:cooler5 
		fs:.4em @xs: .5em @sm: .6em @md: .8em @lg: 1em
	css .correct c:cooler7
	css .wrong c:rose5
	css .current c:cooler1  bdb:1px solid cooler1
	def render
		<self> 
			<div>
				for item, i of challenges[1]
					if i is currentLetter
						<span .current> "{item}"
					elif i <= currentLetter
						<span .correct> "{item}"
						# <span .wrong> "{item}"
					else
						<span> "{item}"

tag keys-view
	css &
		fs:.4em @sm:.8em @md:1em @lg: 1.4em
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
		currentLanguage = language + 1
		render!
	def unshiftChar
		currentLanguage = language
		render!
	def render
		<self>
			css p:10px rd:md d:inline-block bg:cooler8 bxs:sm,md,md,xl
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

tag app-root
	def toggled val
		console.log val
		val = !val
		
	def render
		<self>
			css d:flex fld:column min-height: 100vh
				section
					max-width:100%
			<section>
				<level-view>
					css fl: 0 1
			<section>
				css flex: 1 0  d:flex fld:column
				<bird-view[fl: 1 0 of:hidden]>
				<challenge-view[fl: 0 1 bg:cooler9 c:white]>
			<section[d:flex jc:center bg:cooler9 pb:3em]>
				<keys-view>
			<section[]>
				css d:flex flf:wrap
					bg:cooler9
					p:3
				css paper-toggle-button
					px:3
					--paper-toggle-button-checked-bar-color:  green6
					--paper-toggle-button-checked-button-color:  green6
					--paper-toggle-button-checked-ink-color: green5
					--paper-toggle-button-unchecked-bar-color: cooler3
					--paper-toggle-button-unchecked-button-color:  cooler3
					--paper-toggle-button-unchecked-ink-color: cooler3
				console.log basic
				console.log colored
				<paper-toggle-button checked> 
					<span[c:white]> "Basic Layout"
				<paper-toggle-button checked> 
					<span[c:white]> "Colored Keyboard"
				<paper-toggle-button checked> 
					<span[c:white]> "Fingers"
				<paper-toggle-button checked> 
					<span[c:white]> "Change UI to English"


imba.mount <app-root>