package com.atgrand.testing.assertions {

import flash.events.IEventDispatcher;

import flexunit.framework.AssertionFailedError;

import mx.utils.StringUtil;

import org.flexunit.asserts.fail;

public function assertNoEvent(dispatcher:IEventDispatcher, eventType:String):Function {
    var assert:Function = assertEvent(dispatcher, eventType);

    return function ():void {
        try {
            assert();
        }
        catch (error:AssertionFailedError) {
            return;
        }
        fail(StringUtil.substitute("Expected no event <{0}> on <{1}>!", eventType, dispatcher))}
}
}