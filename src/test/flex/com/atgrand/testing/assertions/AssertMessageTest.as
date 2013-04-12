package com.atgrand.testing.assertions {

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.hamcrest.assertThat;
import org.hamcrest.object.instanceOf;

public class AssertMessageTest {

    public function AssertMessageTest() {
    }

    [Test]
    public function testSuccessfulDispatching():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestMessage);
        dispatcher.dispatch(new TestMessage());
        check();
    }

    [Test(expects="flexunit.framework.AssertionFailedError")]
    public function testNotDispatching():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestMessage);
        check();
    }

    [Test]
    public function testFailMessage():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, null);
        try {
            check();
        }
        catch (error:Error) {
            assertEquals("No messages has been dispatched by [object TestDispatcher]!", error.message);
        }
    }

    [Test]
    public function testFailSentMessages():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, null);
        dispatcher.dispatch(new Object());
        dispatcher.dispatch(new TestMessage());
        try {
            check();
        }
        catch (error:Error) {
            assertEquals("[object Object],[object TestMessage] messages has been dispatched by [object TestDispatcher]!", error.message);
        }
    }

    [Test]
    public function testDoubleDispatching():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestMessage);
        dispatcher.dispatch(new Object());
        dispatcher.dispatch(new TestMessage());
        check();
    }

    [Test(expects="flexunit.framework.AssertionFailedError")]
    public function testSpecificMessageNotDispatching():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestMessage);
        dispatcher.dispatch(new Object());
        check();
    }

    [Test]
    public function testSpecificDispatchingFailMessage():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestMessage);
        try {
            check();
        }
        catch (error:Error) {
            assertEquals("Message of type [class TestMessage] has not been dispatched by [object TestDispatcher]!", error.message);
        }
    }

    [Test]
    public function testDispatchingEventWithSelector():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestEvent, "testEvent");
        dispatcher.dispatch(new TestEvent(TestEvent.TEST_EVENT));
        check();
    }

    [Test(expects="flexunit.framework.AssertionFailedError")]
    public function testFailEventWithSelector():void {
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestEvent, "event");
        dispatcher.dispatch(new TestEvent(TestEvent.TEST_EVENT));
        check();
    }

    [Test]
    public function testInvokeFunction():void {
        var message:TestEvent;
        var dispatcher:TestDispatcher = new TestDispatcher();
        var check:Function = assertMessage(dispatcher, TestEvent, "testEvent", "dispatch", function (_:*):* {message = _});
        dispatcher.dispatch(new TestEvent(TestEvent.TEST_EVENT));
        check();

        assertNotNull(message);
        assertThat(message, instanceOf(TestEvent))
    }
}
}
import flash.events.Event;

internal class TestMessage {
}

internal class TestDispatcher {

    public var dispatch:Function;
}

internal class TestEvent extends Event {

    public static const TEST_EVENT:String = "testEvent";

    public function TestEvent(type:String) {
        super(type);
    }
}