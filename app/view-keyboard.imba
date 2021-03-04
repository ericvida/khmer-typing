import {data_keys} from './data_keys'
### TODOS:
— ✅ pressed state not working in khmer keyboard language
— ✅ space press is not shown
— Space does not show pressed state
— ✅ When Shift + character is pressed, and character is released, the keyboard returns to lowercase even if you are still holding shift
— Delete does not show pressed state
- Make English Font style match Khmer Font Style CHoices
- Make width of dot match width of space
- Highlight for current letter on keyboard if hint state is true.
- allow backspace to remove typo
- require character's per minute goal
###
###
— Change Delete to backspace
###
export tag view-keyboard
	letter_index = 0

	def pressed key
		if data.pressed_keys.indexOf(key) > -1
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
						<.key.highlight .{key.status} .{key.finger}=data.keyboard_colored .{key.type} .{key.size} .name-{key.name} .{key.hand} .pressed=(pressed(key.english[0]) || pressed(key.english[1]))>
							if key.type isnt "action"
								<span.shift-preview>
									if data.shift_pressed is 1
										key["{data.keyboard_language}"][0]
									else
										key["{data.keyboard_language}"][1]
							<span.normal-preview> 
								if key.name is 'spacebar'
									"spacebar"
								else
									key["{data.keyboard_language}"][data.shift_pressed]
	
	# ========================
	# STYLES
	# ========================			
	css &
		$radius:0.3rem
		$key-shadow:sm, md, md, lg
		p:.5rem
		rd:md 
		d:inline-block 
		bg:cooler8
		bxs:sm,md,md,xl
		.first bg:rose5
		.second bg:pink5
		.third bg:violet5
		.fourth bg:blue5
		.fifth bg:yellow3 
		.sixth bg:yellow3 
		.seventh bg:teal5
		.eighth bg:lime5
		.ninth bg:amber5
		.tenth bg:orange5
		bd:1px solid gray7/50

	css .board
		fs:1em
		d:grid jc:center
		gtc: repeat(30, 1rem)
		grid-gap:.5rem
	css .square
		$aspect-ratio:1/1
		grid-column:span 2
		h:2.5rem
		&.pressed
			h:2.4rem
			transform:translateY(.1rem)
			bxs:inset 0 0 0 0 gray9/50, sm, md, md, lg
	css .long
		grid-column:span 3
	css .longer
		grid-column:span 4
	css .longest
		grid-column:span 5
	css .key
		rd:$radius
		pos:relative
		us:none
		tween: all .2ms easy-ease
		bg:cooler3 @hover:cooler1
		bxs:inset 0 -.25rem 0 -.10rem gray9/50, sm, md, md, lg
		span
			pos:absolute
			w:100% h:100%
			d:flex
		span.shift-preview
			h:1rem
			lh:100%
			px:.2rem
			py:.15rem
			l:0%
			t:0% 
			fs:.7rem
			c:gray9/60
		span.normal-preview
			w:100% h:100%
			ai:center jc:center
			fs:1.1rem
			t:0%
			r:0% ta:center
		&.disabled, & .half-key.disabled
			bxs:lg
			bg:cooler6 @hover:cooler6
		&.pressed:not(.disabled)
			bxs:sm,md,md,lg
			bg:cooler1
			bdb:0rem
		&.action, &.spacebar
			d:flex
			bxs:inset 0 -.25rem 0 -.10rem gray9/50, sm, md, md, lg
			span
				px:.4rem
				fs:.7rem
			&.left span.normal-preview
				jc:left
			&.right span.normal-preview
				jc:right
			&.both span.normal-preview
				jc:center
		&.name-right-arrow span,	&.name-left-arrow span
			ta:center
	# Keys with touch anchor for index finger
	css .name-f, .name-j
		pos:relative
		@before
			content:'—'
			d:flex jc:center
			lh:.5rem
			ai:flex-end
			ta:center
			c:blue9
			h:100%
	css .name-left-arrow
		d: flex ai:center jc: center
	css .name-up-down-wrapper
		rd:$radius
		d:grid
		pos:relative
		us:none
		span
			pos:absolute
			ta:center w:100%
			fs:.7rem
		&.disabled
			bxs:lg
			bg:cooler6 @hover:cooler6
			transform:none
	css .name-up-down-arrows
		rd:$radius
		d:grid
		pos:absolute
		t:0 r:0 b:0 l:0
		d:flex jc:space-between fld:column
		bxs:none @hover:none
		.half-key
			grid-column: span 2
			d:flex rd:$radius h:45% ai:center
			w:100%
			us:none
			bxs:inset 0 -.25rem 0 -.10rem gray9/50, sm, md, md, lg
			&.disabled
				bg:cooler6 @hover:cooler6

	css .name-spacebar 
		grid-column: span 8
	