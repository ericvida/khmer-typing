import 'imba/preflight.css'
import {challenges} from './challenges'
import './keyboardviewer'
import {Bird} from './bird'
import {State} from './state'
global css @root
	ff:sans
	# --font-khmer-headings: 'Moul', cursive
	# --font-khmer-handwritten: 'Freehand', cursive
	# --font-khmer-modern: 'Dangrek', cursive



# score state.
let score = 
	wpm: 0
	typos: 0
	accuracy: 0



let basic = yes

# this is for selecting the UI language, but I haven't created alternative text fro the entire UI, but it's something I plan to do.
# let UILanguage = "English"

# This selects the bird collor from the array, so by changing this number we could change the bird color.
let birdcolor = 11

# this was for easily changing the bird color, but I took the bird out for now.
let birdcolors = ["rose","red","pink","fuchsia","purple","indigo","blue","teal","sky","yellow","amber","orange"]


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
	css fs:2em
	css span c:cooler1
		fs:.4em @xs: .5em @sm: .6em @md: .8em @lg: 1em
	css .correct c:cooler7
	css .wrong c:rose5/30
	css .current c:lime5  bdb:1px solid lime5

	def fontFamily
		switch data.challenge_font.toLowerCase!
			when 'script' then return "'Moul', cursive"
			when 'modern' then return "'Dangrek', cursive"
			else return "'Freehand', cursive"



	def render
		<self [ff:{fontFamily!}]>
			<div>
				for item, i of challenges[levelReached]
					if i is currentLetter
						<span .current> "{item}"
					elif i <= currentLetter
						<span .correct> "{item}"
						# <span .wrong> "{item}"
					else
						<span> "{item}"


tag app-settings
	def setLanguage language
		data.setUILanguage language

	def toggleColored
		data.colored = !data.colored
		data.setCookie('colored', data.colored)

	def setChallengeFont font
		data.challenge_font = font
		data.setCookie('challenge_font', data.challenge_font)



	def render
		<self>
			css d:flex flf:wrap jc:space-around
				bg:cooler9
				p:3 
			<div>
				<input bind=data.colored #colorkeys type="checkbox" name="keylang" @input=toggleColored> 
				<label for="colorkeys" name="keylang"> "Color Keys"
					css c:gray1
			<div>
				<select bind=data.currentLanguage>
					<option value="0"> "English"
					<option value="2"> "Khmer"
				<label> " Keyboard Language"
					css c:gray1
			<div>
				<select bind=data.UILanguage>
					<option value="English" @click=setLanguage("English")> "English"
					<option value="Khmer" @click=setLanguage("Khmer")> "Khmer"
				<label> " UI Language"
					css c:gray1
			<div>
				<select bind=khmerStyle>
					<option @click=setChallengeFont("Handwritten") value="Handwritten"> "Handwritten"
					<option @click=setChallengeFont("Modern") value="Modern"> "Modern"
					<option @click=setChallengeFont("Script") value="Script"> "Script"
				<label> " font style"
					css c:gray1


let state = new State()

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
				<type-challenge[fl: 1 0 bg:cooler9 jc:center d:flex ai:center] data=state>
			<section>
				css d:flex py:4 jc:center bg:cooler9 
				<keyboard-viewer data=state>
			<section>
				css fl:1 bg:cooler9
			<section>
				<app-settings data=state>

				
imba.mount <app-root>