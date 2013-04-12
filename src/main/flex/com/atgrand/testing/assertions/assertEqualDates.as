package com.atgrand.testing.assertions {
	
	import flexunit.framework.AssertionFailedError;
	
	import mx.utils.StringUtil;
	
	import org.flexunit.asserts.fail;
	
	public function assertEqualDates(expectedDate:Date, actualDate:Date):void {
		try {
			assertEqualProperties(expectedDate, actualDate);
		} catch (error:AssertionFailedError) {
			var expected:String = expectedDate.toDateString();
			var actual:String = actualDate.toDateString();
			fail(StringUtil.substitute("Expected <{0}> but was <{1}>!", expected, actual));
		}
	}
}