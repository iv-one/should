package com.atgrand.testing.assertions {
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.utils.StringUtil;
	
	import org.flexunit.asserts.fail;
	
	public function assertEvent(dispatcher:IEventDispatcher, eventType:String, listener:Function = null):Function {
		var assert:Function = function():void {fail(StringUtil.substitute("Expected event {0} to be dispatched by {1}", eventType, dispatcher))};
		
		var assertListener:Function = function(event:Event):void {
			var error:Error;
			assert = function():void {
			};
			
			if (listener != null) {
				try {
					listener(event);
				} catch (err:Error) {
					error = err;
					assert = function():void {
						throw error;
					};
				}
			}
            dispatcher.removeEventListener(eventType, assertListener, false);
		};
		dispatcher.addEventListener(eventType, assertListener, false, 0, true);
		
		return function():void {
			assert();
		};
	}
}