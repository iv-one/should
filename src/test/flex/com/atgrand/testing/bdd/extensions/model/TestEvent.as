package com.atgrand.testing.bdd.extensions.model {

import flash.events.Event;

[Ignore]
public class TestEvent extends Event {
    public static const EVENT:String = "testEvent";
    public static const SECOND_EVENT:String = "testSecondEvent";
    public static const PROPERTY_CHANGE:String = "propertyChange";

    private var _item:Object;

    public function TestEvent(type:String, item:Object = null) {
        super(type, false, false);
        _item = item;
    }

    public function get item():Object {
        return _item;
    }
}
}