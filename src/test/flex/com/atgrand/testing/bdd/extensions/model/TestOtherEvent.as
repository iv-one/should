package com.atgrand.testing.bdd.extensions.model {

import flash.events.Event;

[Ignore]
public class TestOtherEvent extends Event {
    public static const OTHER_EVENT:String = "otherEvent";
    public function TestOtherEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}