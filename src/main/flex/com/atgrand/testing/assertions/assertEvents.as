package com.atgrand.testing.assertions {
	
	import flash.events.IEventDispatcher;
	
	public function assertEvents(dispatcher:IEventDispatcher, eventTypes:Array):Function {
		var asserts:Array = new Array();
		for each (var eventType:String in eventTypes) {
			asserts.push(assertEvent(dispatcher, eventType));
		}
		
		return function():void {
			for each (var assert:Function in asserts) {
				assert();
			}
		}
	}
}