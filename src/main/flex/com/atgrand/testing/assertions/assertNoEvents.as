package com.atgrand.testing.assertions {
	
	import flash.events.IEventDispatcher;
	
	public function assertNoEvents(dispatcher:IEventDispatcher, eventTypes:Array):Function {
		var asserts:Array = new Array();
		for each (var eventType:String in eventTypes) {
			asserts.push(assertNoEvent(dispatcher, eventType));
		}
		
		return function():void {
			for each (var assert:Function in asserts) {
				assert();
			}
		}
	}
}