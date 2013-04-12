/**
 * Author: Ivan Dyachenko <ivan.dyachenko@db.com>
 * Date: 28.11.11
 * Time: 12:09
 */
package com.atgrand.testing.bdd.extensions.messages {
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.model.Dispatcher;
import com.atgrand.testing.bdd.extensions.model.TestEvent;
import com.atgrand.testing.bdd.extensions.model.TestOtherEvent;

public class ShouldDispatchExtensionsTest extends Specifications {
    private var instance:Dispatcher;

    [Before]
    public function init():void {
        instance = new Dispatcher();
    }

    [Test]
    public function provides_dispatch_message():void {
        it(instance).should.dispatch.message(TestEvent);
        it(instance).should.dispatch.message(TestOtherEvent);

        instance.invokeDispatch(something);
        instance.invokeDispatchOther();
    }

    [Test]
    public function should_test_dispatch_message_for_dispatcher():void {
        it(instance).should.dispatch.message(TestEvent, null, "dispatcher");

        instance.invokeDispatcher();
    }

    [Test(expects="Error")]
    public function provides_not_dispatch_message():void {
        it(instance).should.not.dispatch.message(TestOtherEvent);

        instance.invokeDispatchOther();
    }

    [Test]
    public function provides_dispatch_event():void {
        it(instance).should.dispatch.event(TestEvent.EVENT);
        it(instance).should.dispatch.event(TestOtherEvent.OTHER_EVENT);

        instance.dispatchTestEvent();
        instance.dispatchTestOtherEvent();
    }

    [Test(expects="Error")]
    public function provides_not_dispatch_event():void {
        it(instance).should.not.dispatch.event(TestOtherEvent.OTHER_EVENT);

        instance.dispatchTestOtherEvent();
    }

    [Test]
    public function should_test_multiple_dispatch_message():void {
        with (it(instance)) {
            should.dispatch.message(TestEvent);
            should.dispatch.event(TestEvent.EVENT);
            should.dispatch.event(TestEvent.SECOND_EVENT);
        }

        instance.dispatchMultipleEvents(something);
    }

    [Test]
    public function should_test_dispatch_for_property_change():void {
        it(instance).should.dispatch.event(TestEvent.PROPERTY_CHANGE);
        instance.name = something;
    }

    [Test]
    public function provides_dispatch_events():void {
        instance.dispatch = function (_:*):* {};
        it(instance).should.dispatch.events(TestEvent.EVENT, TestEvent.SECOND_EVENT);

        instance.dispatchMultipleEvents(something);
    }

    [Test(expects="flexunit.framework.AssertionFailedError")]
    public function provides_not_dispatch_events():void {
        instance.dispatch = function (_:*):* {};
        it(instance).should.not.dispatch.events(TestEvent.EVENT, TestEvent.SECOND_EVENT);

        instance.dispatchMultipleEvents(something);
    }

    [Test]
    public function provides_dispatched_items():void {
        with (it(instance)) {
            should.dispatch.message(TestEvent);
            should.dispatch.event(TestEvent.EVENT);
            should.dispatch.event(TestEvent.SECOND_EVENT);
        }

        when(instance).dispatchMultipleEvents(something);
        it(dispatched.map(function (_:*):* {return _.item})).should.be.array.like([nothing, something, nothing]);

        it(instance).should.dispatch.event(TestEvent.EVENT).when.dispatchTestEvent();
        var item:* = dispatched.pop();
        it(item).should.be.kind.of(TestEvent);
        it(item.type).should.equal(TestEvent.EVENT);
        it(dispatched).should.be.empty();
    }
}
}