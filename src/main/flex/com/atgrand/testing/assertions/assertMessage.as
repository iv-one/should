package com.atgrand.testing.assertions {

import flash.events.Event;

import mx.utils.StringUtil;

import org.flexunit.asserts.fail;

public function assertMessage(dispatcher:Object, messageType:Class, selector:String = null, dispatchMethod:String = "dispatch", invoke:Function = null):Function {
    var failMessage:String;
    var sentMessages:Array = [];
    var assert:Function = function ():void {fail(StringUtil.substitute(failMessage, messageType, dispatcher, selector, sentMessages))};

    if (messageType != null) {
        failMessage = selector ?
                      "Message of type {0} with selector '{2}' has not been dispatched by {1}!" :
                      "Message of type {0} has not been dispatched by {1}!";

        var proceedToNextStatement:Function = dispatcher[dispatchMethod];
        dispatcher[dispatchMethod] = function (message:Object):void {
            if (invoke != null) invoke(message);
            if (message is messageType) {
                if (!selector || message is Event && message.type == selector)
                    assert = function ():void {};
            }
            else if (proceedToNextStatement != null) {
                proceedToNextStatement(message);
            }
        };
    }
    else {
        failMessage = "No messages has been dispatched by {1}!";
        dispatcher[dispatchMethod] = function (message:Object):void {
            sentMessages.push(message);
            failMessage = "{3} messages has been dispatched by {1}!";
        };
    }

    return function ():void {
        assert();
    };
}
}