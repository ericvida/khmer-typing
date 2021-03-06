import 'imba/preflight.css'
import './global-styles.imba'
import './view-levels'
import './view-scores'
import './view-challenge'
import './view-keyboard'
import './view-settings'
const confetti = require('canvas-confetti')
let conf = confetti()
console.log conf.promise
# import {Bird} from './view-bird'

import {State} from './State'

let state = new State()

tag view-root
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
				css flex: 1 0  d:flex fld:column jc:flex-start bg:cooler9
				<view-scores data=state>
				<view-challenge data=state>
				# <bird-view[fl: 1 0 of:hidden]>
				<section>
					css d:flex jc:center ai:start
					<view-keyboard data=state>
			<section>
				css fl:1 bg:cooler9
				<view-settings data=state>
	

				
imba.mount <view-root>