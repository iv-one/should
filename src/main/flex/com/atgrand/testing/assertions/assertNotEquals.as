package com.atgrand.testing.assertions {

import flexunit.framework.AssertionFailedError;

import mx.utils.StringUtil;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.fail;

public function assertNotEquals(expected:Object, actual:Object):void {
    try {
        assertEquals(expected, actual);
    }
    catch (error:AssertionFailedError) {
        return;
    }
    fail(StringUtil.substitute("Expected <{0}> to be not equal to <{1}>!", actual, expected))}
}