/**
 * Author: Ivan Dyachenko
 * Date: 28.11.11
 * Time: 14:38
 */
package com.atgrand.testing.bdd.extensions.model {
import flash.events.EventDispatcher;

public class Dispatcher extends EventDispatcher {
    public var dispatch:Function;
    public var dispatcher:Function;
    
    private var _name:String;

    public function dispatchTestEvent():void {
        dispatchEvent(new TestEvent(TestEvent.EVENT));
    }

    public function dispatchTestOtherEvent():void {
        dispatchEvent(new TestOtherEvent(TestOtherEvent.OTHER_EVENT));
    }

    public function dispatchMultipleEvents(item:Object):void {
        dispatchEvent(new TestEvent(TestEvent.EVENT));
        dispatchEvent(new TestEvent(TestEvent.SECOND_EVENT, item));

        dispatch(new TestEvent(TestEvent.EVENT));
    }

    public function invokeDispatch(item:Object):void {
        dispatch(new TestEvent(TestEvent.EVENT, item));
    }

    public function invokeDispatchOther():void {
        dispatch(new TestOtherEvent(TestOtherEvent.OTHER_EVENT));
    }

    public function invokeDispatcher():void {
        dispatcher(new TestEvent(TestEvent.EVENT));
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
        dispatchEvent(new TestEvent(TestEvent.PROPERTY_CHANGE));
    }
}
}
