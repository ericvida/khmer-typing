import {data_keys} from './data_keys'
### TODOS:
— pressed state not working in khmer keyboard language
— space press is not showin
— When Shift + character is pressed, and character is released, the keyboard returns to lowercase even if you are still holding shift
— Delete does not show pressed state
— Space does not show pressed state
###
export tag view-keyboard
	pressed_keys = []
	letter_index = 0
	def mount
		document.onkeydown = do(e)
			e = e || window.event
			e.preventDefault!
			e.stopPropagation!

			if e.shiftKey || e.key == 'Shift'
				shiftChar!

			unless pressed_keys.indexOf(e.key.toLowerCase!) > -1
				pressed_keys.push(e.key.toLowerCase!)

			# TODO
			# if 
			log e

			imba.commit!


		document.onkeyup = do(e)
			e.preventDefault!
			e.stopPropagation!
			unshiftChar!
			pressed_keys.splice(pressed_keys.indexOf(e.key.toLowerCase!), 1)
			imba.commit!
	def shiftChar
		if data.shift_pressed is 0
			data.shift_pressed = 1
			imba.commit!
	def unshiftChar
		if data.shift_pressed > 0
			data.shift_pressed = 0
			imba.commit!
	def pressed key
		if pressed_keys.indexOf(key) > -1
			return yes
		else
			return no
	def render
		<self>
			<.board>
				let language = english
				let set = 0
				for key, i in data_keys
					if key.name is 'up-down-arrows'
						<.name-up-down-wrapper.{key.size} >
							<.name-{key.name}>
								<.half-key .{key.status} .{key.finger} .{key.type} .{key.hand}> <span> key.english[0]
								<.half-key .{key.status} .{key.finger} .{key.type} .{key.hand}> <span> key.english[1]
					else
						<.key .{key.status} .{key.finger}=data.keyboard_colored .{key.type} .{key.size} .name-{key.name} .{key.hand} .pressed=pressed(key.english[0])>
							if key.type isnt "action"
								<span.shift-preview>
									if data.shift_pressed is 1
										key["{data.keyboard_language}"][0]
									else
										key["{data.keyboard_language}"][1]
							<span.normal-preview> key["{data.keyboard_language}"][data.shift_pressed]
	
	# ========================
	# STYLES
	# ========================			
	css &
		p:10px rd:md d:inline-block bg:cooler8 bxs:sm,md,md,xl
		.first bg: rose5
		.second bg: pink5
		.third bg: violet5
		.fourth bg: blue5
		.fifth bg: yellow3 
		.sixth bg: yellow3 
		.seventh bg: teal5
		.eighth bg: lime5
		.ninth bg: amber5
		.tenth bg: orange5
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
		pos: relative
		us:none
		transform@active: translateY(.1em)
		bxs:sm, m d, lg @hover:sm, md, lg
		bg:cooler3 @hover:cooler1
		span
			pos: absolute
			px:.5em
			w:100% h:100%
			d:flex
		span.shift-preview
			l:0%
			t:0% fs: .6em
			c:gray9/40
		span.normal-preview
			w:100% h:100%
			ai:center jc:center
			t:0%
			r:0% ta:center
		&.disabled, & .half-key.disabled
			bxs:lg
			bg:cooler6 @hover:cooler6
			transform:none
		&.pressed:not(.disabled)
			transform: translateY(.1em)
			bxs:sm, md, lg
			bg:cooler1
	css .action
		d:flex jc:end
		span ta:center of:hidden fs:.5em
		&.left span ta:left
		&.right span ta:right
		&.name-right-arrow span,	&.name-left-arrow span
			ta:center
	css .name-f, .name-j
		pos: relative
		@before
			content: '—'
			pos: absolute
			ta:center
			c:blue9
			l: 0
			r: 0
			b: 0
	css .name-left-arrow
		d: flex ai:center jc: center
	css .name-up-down-wrapper
		rd: .3em
		d:grid
		pos: relative
		us:none
		span
			pos: absolute
			l: 50% transform:translateX(-50%)
		&.disabled
			bxs:lg
			bg:cooler6 @hover:cooler6
			transform:none
	css .name-up-down-arrows
		rd: .3em
		d:grid
		pos: absolute
		bg: transparent
		t:0 r:0 b:0 l:0
		d:flex jc:space-between fld:column
		bxs:none @hover:none
		.half-key
			grid-column: span 2
			ta:center
			d:flex rd:lg h:45% ai:center
			w:100% jc: space-between
			us:none
			bxs@hover:outline
			transform@active: translateY(.1em)
			bxs:sm, md, lg @hover:sm, md, lg
			&.disabled	
				bxs:lg
				bg:cooler6 @hover:cooler6
				transform:none
	css .name-spacebar 
		grid-column: span 8
	