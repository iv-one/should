package com.atgrand.testing.assertions {
	
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.asserts.assertEquals;
	
	public class AssertNoMessageTest {
		
		public function AssertNoMessageTest() {
		}
		
		[Test]
		public function testNotDispatching():void {
			assertNoMessage(new TestDispatcher(), TestMessage)();
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function testDispatching():void {
			var dispatcher:TestDispatcher = new TestDispatcher();
			var check:Function = assertNoMessage(dispatcher, TestMessage);
			
			dispatcher.dispatch(new TestMessage());
			
			check();
		}
		
		[Test]
		public function testAssertionMessage():void {
			var dispatcher:TestDispatcher = new TestDispatcher();
			var check:Function = assertNoMessage(dispatcher, TestMessage);
			
			dispatcher.dispatch(new TestMessage());
			
			try {
				check();
			} catch (error:AssertionFailedError) {
				assertEquals("Expected no message <[class TestMessage]> on <[object TestDispatcher]>!", error.message);
			}
		}
	}
}

internal class TestMessage {
}

internal class TestDispatcher {
	
	public var dispatch:Function;
}