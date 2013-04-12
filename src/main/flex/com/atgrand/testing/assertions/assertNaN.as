package com.atgrand.testing.assertions {
	
	import org.flexunit.asserts.assertTrue;
	
	public function assertNaN(value:Number):void {
		assertTrue(isNaN(value));
	}
}