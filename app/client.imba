import 'imba/preflight.css'
global css html
	ff:sans

let keyboard =
	default: [
		["`",'1','2','3','4','5','6','7','8','9','0','-','=','delete']
		['tab','q','w','e','r','t','y','u','i','o','p','[',']','\\']
		['caps','a','s','d','f','g','h','j','k','l','','\'','return']
		['lshift','z','x','c','v','b','n','m',',','.','/','rshift']
		['lcontrol','loption','lcommand','space','rcommand','roption','rcontrol','left','up','down','right']
	]

tag LevelBar
	def render
		<self> 

tag Face
	prop title = "red"
	css svg
		position: absolute
		width: 5.75em
		left: 4.2em
		top: 4.2em
		animation: face 2s infinite	
	def render
		<self>
			<svg[fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;] viewBox="0 0 387 232" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/">
				<g>
					# upper beak
					<path[fill:{accent+"6"}] d="M216.621,143.922c-16.687,4.351 -34.072,7.166 -51.074,4.369l-0.106,-0.018c3.906,14.881 17.123,28.064 34.588,24.817c8.818,-1.639 17.408,-8.327 18.505,-17.829c0.44,-3.812 -0.226,-7.681 -1.469,-11.333c0,0 -0.248,-0.058 -0.444,-0.006Z" >
					# lower beak
					<path[fill:{accent+"6"}] d="M206.753,107.703c-15.557,0.135 -31.575,6.056 -40.484,18.958c-1.975,2.859 -3.585,6.052 -3.821,9.466l0,0.005c15.878,4.187 33.106,1.509 49.552,-2.645c14.753,-3.726 29.081,-9 43.155,-14.844l0.363,-0.151c-15.24,-6.043 -31.408,-10.611 -47.653,-10.788c-0.371,-0.002 -0.741,-0.002 -1.112,-0.001Z">
					<g>
						# right brow
						<path[fill:{eyes+"9"}] d="M264.198,5.92c16.578,0.105 31.506,10.493 40.804,24.697c0,0 2.341,7.471 -3.222,8.813c-5.489,1.323 -8.895,-7.567 -14.66,-12.961c-5.105,-4.775 -11.519,-8.124 -18.584,-9.015c-6.719,-0.847 -13.541,0.339 -19.974,2.233c0,0 -3.164,0.63 -5.212,-1.093c-3.141,-2.641 -2.174,-8.483 2.52,-9.849c5.843,-1.701 11.794,-2.778 17.827,-2.825c0.167,-0.001 0.334,-0.001 0.501,0Z">
						<g>
							# right eye
							<path[fill:{eyes+"9"}] d="M265.837,50.183c-9.673,0.838 -16.846,9.373 -16.007,19.046c0.838,9.674 9.373,16.846 19.046,16.008c9.674,-0.839 16.846,-9.373 16.008,-19.047c-0.839,-9.673 -9.373,-16.846 -19.047,-16.007Z">
							# right eye speck
							<circle[fill:white] cx="273.048" cy="59.188" r="4.171">
					<g>
						# left brow
						<path[fill:{eyes+"9"}] d="M92.408,24.036c4.676,0.036 10.93,0.778 9.878,6.751c-0.968,5.49 -9.306,4.027 -16.506,4.844c-10.361,1.176 -20.084,6.934 -25.768,15.716c-2.35,3.63 -4.154,7.586 -5.623,11.646c0,0 -2.255,3.893 -5.609,3.704c-3.367,-0.189 -6.082,-3.847 -5.079,-7.223c3.981,-13.387 15.815,-28.666 32.189,-33.346c5.344,-1.528 10.887,-2.097 16.518,-2.092Z">
						<g>
							# left eye
							<path[fill:{eyes+"9"}] d="M92.892,72.131c-9.674,0.839 -16.846,9.373 -16.008,19.047c0.839,9.673 9.373,16.846 19.046,16.007c9.674,-0.838 16.847,-9.373 16.008,-19.046c-0.839,-9.674 -9.373,-16.846 -19.046,-16.008Z">
							# left teye speck
							<circle[fill:white] cx="100.102" cy="81.137" r="4.171">
					# left cheek
					<path[fill:{color+"4"} o:70%] d="M44.732,136.693c24.484,-3.497 47.202,13.542 50.699,38.027c3.496,24.484 -13.543,47.202 -38.027,50.699c-24.485,3.497 -47.202,-13.543 -50.699,-38.027c-3.497,-24.485 13.542,-47.202 38.027,-50.699Z">
					# right cheek
					<path[fill:{color+"4"} o:70%] d="M328.865,98.211c24.485,-3.497 47.202,13.543 50.699,38.027c3.497,24.485 -13.542,47.202 -38.027,50.699c-24.484,3.497 -47.202,-13.543 -50.699,-38.027c-3.497,-24.485 13.543,-47.202 38.027,-50.699Z">
tag Head
	css svg
		position: absolute
		width: 7.5em
		left: 2.75em
		top: 2.75em
	def render
		<self>
			<svg[fill-rule:evenodd clip-rule:evenodd stroke-linejoin:round stroke-miterlimit:2] viewBox="0 0 520 524" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/">
				<rect[fill:none]>
				# head
				<path[fill:{color+"3"}] d="M223.621,10.151c149.911,-22.108 266.464,79.957 286.166,217.906c19.702,137.95 -76.299,265.942 -214.248,285.644c-137.95,19.702 -265.942,-76.299 -285.644,-214.248c-18.56,-129.947 63.815,-267.194 213.726,-289.302Z">
				# body shade
				<path[fill:{color+"4"} o:40%] d="M77.282,85.164c-25.295,48.055 -35.282,103.874 -27.494,158.407c19.702,137.95 147.695,233.951 285.644,214.249c58.857,-8.406 110.079,-36.525 147.935,-76.72c-36.456,69.27 -104.487,120.698 -187.828,132.601c-137.95,19.702 -265.942,-76.299 -285.644,-214.248c-11.067,-77.488 13.756,-157.571 67.387,-214.289Z">
tag WingLeft
	css svg
		position: absolute
		width: 3.625em
		top: 5.46em
		left: 0%
		animation: flap .2s infinite
		display: block
		transform-origin: right center
	def render
		<self>
			<svg viewBox="0 0 292 250" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;">
				<rect[fill:none] x="0" y="0" width="291.667" height="250" >
				<path[fill:{color+"4"}] d="M286.523,84.597c-33.898,-56.826 -313.274,-102.554 -281.408,-65.474c31.866,37.079 167.094,83.35 174.999,83.937c-40.027,14.821 -147.426,43.2 -123.217,61.325c24.209,18.125 133.493,-8.988 133.329,-8.636c-29.403,24.572 -63.953,96.02 -26.468,79.237c59.143,-26.479 142.517,-117.278 122.765,-150.389Z">
tag WingRight
	css svg
		position: absolute
		width: 3.625em
		top: 5em
		right: 0em
		animation: flap .2s infinite
		transform-origin: left center
		animation-delay: -0.1s
	def render
		<self>
			<svg[fill-rule:evenodd clip-rule:evenodd stroke-linejoin:round stroke-miterlimit:2 ] width="100%" viewBox="0 0 292 250" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/">
				<rect[fill:none] x="0" y="0" width="291.667" height="250">
				<path[fill:{color+"4"}] d="M5.346,87.982c33.898,-56.826 313.273,-102.554 281.408,-65.474c-31.866,37.079 -167.094,83.35 -174.999,83.937c40.027,14.821 147.426,43.2 123.217,61.325c-24.209,18.125 -133.494,-8.988 -133.329,-8.635c29.403,24.571 63.953,96.019 26.468,79.236c-59.144,-26.478 -142.517,-117.278 -122.765,-150.389Z">
tag Crest
	css svg
		position: absolute
		width: 2.5em
		top: .9em
		left: 4.2em
		animation: crest 4s infinite
		animation-delay: 1s
		transform-origin: bottom right
	def render
		<self>
			<svg[fill-rule:evenodd clip-rule:evenodd stroke-linejoin:round stroke-miterlimit:2] viewBox="0 0 40 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/">
				<rect[fill:none] x="0" y="0" width="40" height="41.2">
				<path[fill:{color+"6"}] d="M38.137,28.047c-0.828,-6.118 -2.131,-12.166 -3.479,-18.191c-0.531,-2.377 -1.337,-4.688 -2.152,-6.985c-1.045,-2.943 -2.882,-2.476 -3.697,0.555c-1.142,4.252 -1.98,8.572 -2.313,12.968c-0.085,1.128 -0.667,2.561 0.1,3.391c-15.712,-16.742 -27.47,-11.698 -10.625,6.923c-20.338,-1.481 -16.376,4.096 -5.164,8.683c10.471,4.284 30.355,11.274 27.33,-7.344">
tag Legs
	css svg
		position: absolute
		width: 3em
		left: 4.5em
		top: 9.6em
		animation: dangle 2s infinite
		animation-delay: 1s
		transform-origin: top center
	def render
		<self>
			<svg[fill:none fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;] width="100%" viewBox="0 0 192 165" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/">
				<rect x="0" y="0" width="191.605" height="164.233">
				<path[fill:{color+"6"}] d="M96.857,18.518c5.392,0.897 5.088,8.594 4.633,14.914c-2.292,31.851 -17.427,63.215 -42.208,83.227c-11.087,8.953 -24.421,15.714 -38.621,16.439c-3.434,0.175 -7.136,-1.692 -7.353,-5.228c-0.218,-3.558 3.321,-5.794 7.321,-6.046c22.544,-1.525 41.868,-19.958 53.943,-39.951c10.395,-17.209 16.009,-37.307 15.97,-57.416c0,0 1.194,-6.35 6.315,-5.939Z">
				<path[fill:{color+"6"}] d="M158.398,9.675c2.861,0.379 4.711,3.359 5.355,5.196c11.828,33.724 19.076,71.133 11.367,103.758c-3.443,14.572 -11.655,28.753 -25.974,35.41c0,0 -3.024,1.256 -5.416,-0.125c-3.86,-2.229 -3.108,-8.17 1.729,-10.593c13.28,-6.775 18.837,-23.605 20.388,-37.071c3.441,-29.873 -3.079,-60.785 -13.22,-89.067c0,0 -0.699,-2.259 0.153,-4.181c0.94,-2.119 3.174,-3.416 5.618,-3.327Z">
tag ChicoBird
	prop accent
	prop eyes
	prop skin
	css &
		$size: 30px
		position: relative
		fs: $size
		width: 13em
		height: 13em
		display: block
		animation: fly 2s infinite
	css .glow
		background-color: purple9/0
		width: 6em
		height: 6em
		border-radius: 100%
		top: 50%
		left: 50%
		box-shadow: 0 1.5em 3em yellow4/20, 0 1.5em 5em yellow3/5
		transform: translateX(-50%) translateY(-50%)
		position: absolute
	css svg
		position: absolute
	css span
		position: absolute
	css @keyframes 
		blink
			50% transform: translateY(2px)
		flap
			50% transform: rotate(10deg)
		dangle
			50% transform: rotate(10deg)
		crest
			50% transform: rotate(10deg)
		fly
			50% transform: translateY(30px)
	prop isGlowing = yes
	def render
		<self>
			<span.glow=isGlowing>
			<Legs color=accent>
			<WingRight color=skin>
			<WingLeft color=skin>
			<Crest color=accent>
			<Head color=skin>
			<Face color=skin accent=accent eyes=eyes >
tag BirdView
	css & h:300px bg:warmer2 d:block
	def render
		<self>
			<ChicoBird[$size:20px] accent="rose" skin="rose" eyes="cooler">
tag Challenge
	css & h:6em d:flex jc:start ai:center fld:column
	css .triangle w:0 h:0 bdl:20px solid transparent bdr:20px solid transparent bdt:20px solid rose5
	css p fs:2em
	def render
		<self> 
			<.triangle>
			<p> "កាល​ពី​ដើម​ដំបូង​បង្អស់ ព្រះ‌បន្ទូល មាន​ព្រះ‌ជន្ម​គង់​នៅ។ ព្រះ‌បន្ទូល​គង់​នៅ​ជា​មួយ ព្រះ‌ជាម្ចាស់ ហើយ​ព្រះ‌បន្ទូល​ជា​ព្រះ‌ជាម្ចាស់។"
tag Keyboard
	css &
		.lpinky bg: rose5
		.lring bg: pink5
		.lmiddle bg: violet5
		.lindex bg: blue5
		.thumbs bg: yellow3
		.rindex bg: teal5
		.rmiddle bg: lime5
		.rring bg: amber5
		.rpinky bg: orange5
	prop kb = [
		['`','1','2','3','4','5','6','7','8','9','0','minus','plus','delete','tab','q','w','e','r','t','y','u','i','o','p','[',']','\\','caps lock','a','s','d','f','g','h','j','k','l',';','\'','return','shift','z','x','c','v','b','n','m',',','.','/','shift','control','opt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['`','1','2','3','4','5','6','7','8','9','0','minus','plus','delete','tab','q','w','e','r','t','y','u','i','o','p','[',']','\\','caps lock','a','s','d','f','g','h','j','k','l',';','\'','return','shift','z','x','c','v','b','n','m',',','.','/','shift','control','opt','command','space','command','option','control','⇠','⇡','⇣','⇢']
		['«','១','២','៣','៤','៥','៦','៧','៨','៩','០','ឥ','ឲ','delete','tab','ឆ','ឹ','េ','រ','ត','យ','ុ','ិ','ោ','ផ','ៀ','ឪ','ឭ','caps lock','ា','ស','ដ','ថ','ង','ហ','្','ក','ល','ើ','់','return','shift','ឋ','ខ','ច','វ','ប','ន','ម','ឦ','។','៊','shift','fn','ctrl','opt','cmd','space','cmd','opt','control','⇠','⇡','⇣','⇢']
		['»','!','ៗ','"','៛','%','៍','័','៏','ឰ','ឳ','៌','៎','delete','tab','ឈ','ឺ','ែ','ឬ','ទ','ួ','ូ','ី','ៅ','ភ','ឿ','ឧ','ឮ','caps lock','ឫ','ៃ','ឌ','ធ','អ','ះ','ញ','គ','ឡ','៖','៉','return','shift','ឍ','ឃ','ជ','ៈ','ព','ណ','ំ','ឱ','៕','ឯ','shift','fn','ctrl','opt','cmd','space','cmd','opt','control','⇠','⇡','⇣','⇢']
	]
	prop language = 2
	prop current = language
	def shiftChar
		current = language + 1
		render!
	def unshiftChar
		current = language
		render!
	def render
		<self>
			<section>
				<.board >
					<.key .square .lpinky  > kb[current][0]
					<.key .square .lpinky > kb[current][1]
					<.key .square .lring > kb[current][2]
					<.key .square .lmiddle > kb[current][3]
					<.key .square .lindex > kb[current][4]
					<.key .square .lindex > kb[current][5]
					<.key .square .rindex > kb[current][6]
					<.key .square .rindex > kb[current][7]
					<.key .square .rmiddle > kb[current][8]
					<.key .square .rring > kb[current][9]
					<.key .square .rpinky > kb[current][10]
					<.key .square .rpinky > kb[current][11]
					<.key .square .rpinky > kb[current][12]
					<.key .longer .rpinky  .delete> kb[current][13]
					<.key .long .lpinky  .tab> kb[current][14]
					<.key .square .lpinky > kb[current][15]
					<.key .square .lring > kb[current][16]
					<.key .square .lmiddle > kb[current][17]
					<.key .square .lindex > kb[current][18]
					<.key .square .lindex > kb[current][19]
					<.key .square .rindex > kb[current][20]
					<.key .square .rindex > kb[current][21]
					<.key .square .rmiddle > kb[current][22]
					<.key .square .rring > kb[current][23]
					<.key .square .rpinky > kb[current][24]
					<.key .square .rpinky > kb[current][25]
					<.key .square .rpinky > kb[current][26]
					<.key .long .rpinky  .backslash> kb[current][27]
					<.key .longer .lpinky  .capslock> kb[current][28]
					<.key .square .lpinky > kb[current][29]
					<.key .square .lring > kb[current][30]
					<.key .square .lmiddle > kb[current][31]
					<.key .square .lindex > kb[current][32]
					<.key .square .lindex > kb[current][33]
					<.key .square .rindex > kb[current][34]
					<.key .square .rindex > kb[current][35]
					<.key .square .rmiddle > kb[current][36]
					<.key .square .rring > kb[current][37]
					<.key .square .rpinky > kb[current][38]
					<.key .square .rpinky > kb[current][39]
					<.key .longer .rpinky .return> kb[current][40]
					<.key .longest .lpinky .leftshift> kb[current][41]
					<.key .square .lpinky > kb[current][42]
					<.key .square .lring > kb[current][43]
					<.key .square .lmiddle > kb[current][44]
					<.key .square .lindex > kb[current][45]
					<.key .square .lindex > kb[current][46]
					<.key .square .rindex > kb[current][47]
					<.key .square .rindex > kb[current][48]
					<.key .square .rmiddle > kb[current][49]
					<.key .square .rring > kb[current][50]
					<div$from.key .square .rpinky > kb[current][51]
					<.key .longest .rpinky .rightshift> kb[current][52]
					<.key .square .lpinky .lfn> kb[current][53]
					<.key .square .lpinky .lcontrol> kb[current][54]
					<.key .square .lpinky .lalt> kb[current][55]
					<.key .long .lpinky .command> kb[current][56]
					<.key .thumbs  .space > kb[current][57]
					<.key .square .rring .rcommand> kb[current][58]
					<.key .square .rpinky .alt> kb[current][59]
					<.key .square .rindex .larrow> kb[current][61]
					<.square .updown[d:flex fld:column gc: span 2 bg:transparent]>
						<.rmiddle .up> kb[current][62]
						<.rmiddle .down> kb[current][63]
					<div$anchor.square.key  .rring  .rarrow > kb[current][64]
	global css body *
			margin: 0
			padding: 0
			box-sizing: border-box
			font-family: Arial, Helvetica, sans-serif

	css section
		d: flex
		jc: center
		bg:cooler9
		p:6
	css .board
		fs:12px
		padding: 1em
		background-color: cooler8
		rd:.8em
		d: grid
		gtc: repeat(30, 2em)
		gtr: repeat(5, 4em)
		grid-gap: .5em
		fw:bold
	css .square
		grid-column: span 2
	css .long
		grid-column: span 3
	css .longer
		grid-column: span 4
	css .longest
		grid-column: span 5
	css .key 
		background-color: white
		rd: lg
		ai:center
		pos: relative
		d:grid jc:center
		svg 
			d:block mx:auto
			position: absolute
			t: 50%
			transform: translateY(-50%) size:1.2em
		@hover 
			border: 2px solid #eeeeee

	css .updown
		d:flex
		fld:column
		jc:space-between
		> *
			d:grid jc:center rd:lg h:45% ai:center
			@hover
				border: 2px solid #eeeeee

	css .space 
		grid-column: span 11
tag app
	def render
		<self>
			<LevelBar>
			<BirdView>
			<Challenge>
			<Keyboard>
	
imba.mount <app>