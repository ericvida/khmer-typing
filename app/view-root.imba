import 'imba/preflight.css'
import './global-styles.imba'
import './view-levels'
import './view-scores'
import './view-challenge'
import './view-keyboard'
import './view-settings'
const confetti = require('canvas-confetti')
let conf = confetti()
# console.log conf.promise
# import {Bird} from './view-bird'

import {State} from './State'

let state = new State()

tag view-root

	def render
		<self>
			css d:flex fld:column min-height: 100vh bg:cooler9
				section
					max-width:100%
			<section>
				<view-levels data=state>
			<section>
				css d:flex flex: 1 1 10rem fld:column ai:center jc:center
				<view-scores data=state>
					css w:100%
				<view-challenge data=state>
					css w:100%
				# <bird-view[fl: 1 0 of:hidden]>
			<section>
				css d:flex jc:start ai:center flg:1 fld:column
				<view-keyboard data=state>
			<section>
				css d:flex jc:end fld:column
				<view-settings data=state>
	

				
imba.mount <view-root>