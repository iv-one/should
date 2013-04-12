package com.atgrand.testing.assertions {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.flexunit.asserts.assertEquals;
	
	public class AssertEventTest {
		
		public function AssertEventTest() {
		}
		
		[Test]
		public function testSuccessfulDispatching():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertEvent(dispatcher, "tested");
			dispatcher.dispatchEvent(new TestEvent());
			check();
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function testNotDispatching():void {
			var check:Function = assertEvent(new EventDispatcher(), "tested");
			check();
		}
		
		[Test]
		public function testFailMessage():void {
			var check:Function = assertEvent(new EventDispatcher(), "tested");
			try {
				check();
			} catch (error:Error) {
				assertEquals("Expected event tested to be dispatched by [object EventDispatcher]", error.message);
			}
		}
		
		[Test(expects="TypeError")]
		public function testWrongListenerType():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertEvent(dispatcher, "tested",
				function(event:TestEvent):void {}
			);
			dispatcher.dispatchEvent(new Event("tested"));
			check();
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function testFailedListenerAssertions():void {
			var dispatcher:IEventDispatcher = new EventDispatcher();
			var check:Function = assertEvent(dispatcher, "tested",
				function(event:TestEvent):void {
					assertEquals("testing", event.type);
				}
			);
			dispatcher.dispatchEvent(new TestEvent());
			check();
		}
	}
}

import flash.events.Event;

internal class TestEvent extends Event {
	
	public function TestEvent() {
		super("tested");
	}
}