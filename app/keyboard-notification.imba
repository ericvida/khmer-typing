import {data_keys} from './data_keys'

export tag keyboard-message
	def hint
		# if the user finished challenge
		# show hints for restart and / or continue
		if data.level_finished
			if data.level_chosen < data.level_unlocked
				return "{data.lang.hint_next}. {data.lang.hint_restart}"
			return data.lang.hint_restart

		if data.keyboard_message.length > 1
			return data.keyboard_message
		return data.getHint!

	
	def render
		<self[lh:normal ws:pre]> hint!

	css bg: cooler9 c:amber1 ff:monospace w:100% d:block mb:.5rem p:.5rem ta:center rd:.1rem