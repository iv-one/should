package com.atgrand.testing.assertions {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.asserts.assertEquals;
	
	public class AssertNoEventTest {
		
		public function AssertNoEventTest() {
		}
		
		[Test]
		public function testNotDispatching():void {
			assertNoEvent(new EventDispatcher(), "none")();
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function testDispatching():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertNoEvent(dispatcher, "some");
			
			dispatcher.dispatchEvent(new Event("some"));
			
			check();
		}
		
		[Test]
		public function testAssertionMessage():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertNoEvent(dispatcher, "some");
			
			dispatcher.dispatchEvent(new Event("some"));
			
			try {
				check();
			} catch (error:AssertionFailedError) {
				assertEquals("Expected no event <some> on <[object EventDispatcher]>!", error.message);
			}
		}
	}
}