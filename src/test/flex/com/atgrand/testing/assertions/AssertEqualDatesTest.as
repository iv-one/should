package com.atgrand.testing.assertions {
	
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.asserts.assertEquals;
	
	public class AssertEqualDatesTest {
		
		public function AssertEqualDatesTest() {
		}
		
		[Test]
		public function testEquals():void {
			assertEqualDates(new Date(2011, 2, 10), new Date(2011, 2, 10));
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function testNotEquals():void {
			assertEqualDates(new Date(2011, 2, 10), new Date(2011, 2, 11));
		}
		
		[Test]
		public function testNotEqualsMessage():void {
			try {
				testNotEquals();
			} catch (error:AssertionFailedError) {
				assertEquals("Expected <Thu Mar 10 2011> but was <Fri Mar 11 2011>!", error.message);
			}
		}
	}
}