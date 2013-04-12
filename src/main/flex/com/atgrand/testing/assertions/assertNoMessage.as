package com.atgrand.testing.assertions {

import flexunit.framework.AssertionFailedError;

import mx.utils.StringUtil;

import org.flexunit.asserts.fail;

public function assertNoMessage(dispatcher:Object, messageType:Class, selector:String = null, dispatchMethod:String = "dispatch"):Function {
    var assert:Function = assertMessage(dispatcher, messageType, selector, dispatchMethod);

    return function ():void {
        try {
            assert();
        }
        catch (error:AssertionFailedError) {
            return;
        }
        fail(StringUtil.substitute("Expected no message <{0}> on <{1}>!", messageType, dispatcher))}
}
}