package com.atgrand.testing.assertions {
	
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.asserts.assertEquals;
	
	public class AssertNotEqualsTest {
		
		public function AssertNotEqualsTest() {
		}
		
		[Test]
		public function testNotEquals():void {
			assertNotEquals(1, 2);
		}
		
		[Test(expected="flexunit.framework.AssertionFailedError")]
		public function testEquals():void {
			assertNotEquals(1, 1);
		}
		
		[Test]
		public function testMessage():void {
			try {
				assertNotEquals(1, 1);
			} catch (error:AssertionFailedError) {
				assertEquals("Expected <1> to be not equal to <1>!", error.message);
			}
		}
	}
}