import 'imba/preflight.css'
import './global-styles.imba'
import './view-levels'
import './view-scores'
import './view-challenges'
import './view-keyboard'
import './view-settings'
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
	css & fs:.4em @xs:.5em @sm:.6em @md: .8em @lg: 1.2em @xl: 1.4em

				
imba.mount <view-root>