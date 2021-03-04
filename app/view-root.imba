import 'imba/preflight.css'
import './global-styles.imba'
import {data_challenges} from './data_challenges'
import './view-levels'
import './view-scores'
import './view-challenges'
import './view-keyboard'
import './view-settings'
# import {Bird} from './view-bird'
import {State} from './classState'
# score state.
let score = 
	wpm: 0
	typos: 0
	accuracy: 0

let basic = yes

# this stores the number of challenges available
let levelsTotal = data_challenges.length

# This is for highlighting the current letter in the typing challenge
let currentLetter = 3

# Current Level Change this number to typing challenge start with 1
let levelReached = 0





let state = new State()

tag view-root
	css fs:.4em @xs:.5em @sm:.6em @md: .8em @lg: 1.2em @xl: 1.4em
	def toggled val
		console.log val
		val = !val
	def render
		<self>
			css d:flex fld:column min-height: 100vh
				section
					max-width:100%
			<section[]>
				<view-levels data=state>
			<section>
				css flex: 1 0  d:flex fld:column
				<view-scores[fl:0 1 100px] data=state>
				# <bird-view[fl: 1 0 of:hidden]>
				<view-challenges[fl: 1 0 bg:cooler9 jc:center d:flex ai:center] data=state>
			<section>
				css d:flex py:4 jc:center bg:cooler9 
				<view-keyboard data=state>
			<section>
				css fl:1 bg:cooler9
			<section>
				<view-settings data=state>

				
imba.mount <view-root>