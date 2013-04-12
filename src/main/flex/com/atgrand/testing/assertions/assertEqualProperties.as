package com.atgrand.testing.assertions {
	
	import mx.utils.ObjectUtil;
	
	import org.flexunit.asserts.fail;
	
	public function assertEqualProperties(expected:Object, actual:Object,
		message:String = "Different properties!"):void {
		
		var result:int = ObjectUtil.compare(expected, actual);
		if (result != 0) {
			fail(message);
		}
	}
}