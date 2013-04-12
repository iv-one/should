package com.atgrand.testing.assertions {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class AssertNoEventsTest {
		
		public function AssertNoEventsTest() {
		}
		
		[Test]
		public function testSuccess():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertNoEvents(dispatcher, ["didA", "didB"]);
			
			check();
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function testFailure():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertNoEvents(dispatcher, ["didA", "didB"]);
			
			dispatcher.dispatchEvent(new Event("didA"));
			
			check();
		}
	}
}