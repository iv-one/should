/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:29
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.messages.ShouldDispatchExtensions;
import com.atgrand.testing.bdd.extensions.model.Dispatcher;
import com.atgrand.testing.bdd.extensions.model.TestEvent;
import com.atgrand.testing.bdd.extensions.model.TestOtherEvent;

import flash.events.Event;
import flash.events.EventDispatcher;

import mx.collections.ArrayCollection;

import mx.collections.IList;

import org.hamcrest.assertThat;
import org.hamcrest.core.anything;
import org.hamcrest.object.equalTo;

import org.hamcrest.object.instanceOf;
import org.hamcrest.object.notNullValue;
import org.mockito.api.MethodSelector;

public class ItExtensionsTest extends Specifications {

    [Test]
    public function provides_assert():void {
        it(something).assert(notNullValue());
    }

    [Test]
    public function return_should():void {
        assertThat(it(something).should, instanceOf(ShouldExtensions));
    }

    [Test]
    public function return_should_be():void {
        assertThat(it(something).should.be, instanceOf(ShouldBeExtensions));
    }

    [Test]
    public function return_should_have():void {
        assertThat(it(something).should.have, instanceOf(ShouldHaveExtensions));
    }

    [Test]
    public function return_should_not():void {
        assertThat(it(something).should.not, instanceOf(ShouldExtensions));
    }

    [Test]
    public function return_provide_some_object():void {
        it(something).should.be.same_as(something);
        it(some(1)).should.be.same_as(some(1));
        it([some(1), some(2), some(3)]).should.be.array.like([some(1), some(2), some(3)]);
        it(some(1, 2, 3)).should.be.array.like([some(1), some(2), some(3)]);
    }

    [Test]
    public function it_extensions_test_numbers():void {
        it(5).should.equal(5);
        it(5).should.not.equal(4);
        it(5).should.be.greater.than(4);
        it(5).should.not.be.less.than(4);
        it(5).should.be.between(1, 10);
        it(5).should.be.a.number();
        it(5).should.be.an.number();

        it(NaN).should.not.be.a.number();
    }

    [Test]
    public function it_extensions_test_arrays():void {
        it([1, 2, 3]).should.equal([1, 2, 3]);
        it([1, 2, 3]).should.have.item(3);
        it([1, 2, 3]).should.not.have.item(something);
        it([1, 2, 3]).should.not.be.empty();
        it([1, 2, 3]).should.have.items([2, 3]);

        it([1, 2, 3]).should.be.array.like([1, 2, 3]);
        it([1, 2, 3]).should.be.array.with_size(3);

        it([1, 2, 3]).should.not.be.array.like([1, 2, 3, 4]);
        it([1, 2, 3]).should.not.be.array.with_size(4);
    }

    [Test]
    public function it_extensions_test_list():void {
        var list:IList = new ArrayCollection([1, 2, 3]);

        it(list).should.be.list.like([1, 2, 3]);
        it(list).should.be.list.like(new ArrayCollection([1, 2, 3]));
        it(list).should.be.list.like([1, 2, 3]).with_size(3);

        it(list).should.not.be.list.like([1, 2, 3, 4]);
        it(list).should.not.be.list.with_size(4);
    }

    [Test]
    public function it_extensions_test_boolean():void {
        it(1 == 1).should.be._true();
        it(1 == 2).should.not.be._true();
        it(1 == 3).should.be._false();

        it(true).should.be.truth();
    }

    [Test]
    public function it_extensions_test_objects():void {
        it(null).should.be.nil();
        it(something).should.not.be.nil();
        it(something).should.not.be.same_as(nothing);

        it(true).should.be.kind.of(Boolean);
        it("String").should.be.kind.of(String);
        it([1, 2, 3]).should.be.kind.of(Array);
        it([1, 2, 3]).should.not.be.kind.of(Boolean);

        it({property:something}).should.have.property("property");

        var dispatcher:EventDispatcher = new EventDispatcher();
        dispatcher.addEventListener("EVENT", function (e:Event):* {});

        it(dispatcher).should.have.listener("EVENT");
        it(dispatcher).should.not.have.listener("MOUSE_UP");

        var event:Event = new Event(Event.COMPLETE, true, false);
        it(event).should.have.properties(
                {
                    type:equalTo(Event.COMPLETE),
                    bubbles:true,
                    cancelable:anything
                }
        );
    }

    [Test]
    public function it_extensions_test_strings():void {
        it("").should.be.empty();
        it("hello world").should.not.be.empty();
        it("hello world").should.contain("hello");
        it("hello world").should.not.contain("mir");

        it("hello world").should.equal("hello world");
        it("hello world").should.not.equal("other");

        it("hello world").should.ends("world");
        it("hello world").should.starts("hello");
        it("hello world").should.be.matched(/^\w+.*?world$/);
    }

    [Test]
    public function it_extensions_test_date():void {
        it(new Date(2011, 2, 10)).should.equal(new Date(2011, 2, 10));
    }

    [Test]
    public function it_extensions_test_multiple_send_messages_and_events():void {
        var instance:Dispatcher = new Dispatcher();

        with (it(instance)) {
            should.dispatch.message(TestEvent);
            should.dispatch.event(TestEvent.EVENT);
            should.dispatch.event(TestEvent.SECOND_EVENT);
            should.dispatch.event(TestEvent.PROPERTY_CHANGE);
        }

        instance.dispatchMultipleEvents(something);
        instance.name = something;
    }

    [Test]
    public function it_extensions_test_messages_and_events():void {
        assertThat(it(something).should.dispatch, instanceOf(ShouldDispatchExtensions));

        var instance:Dispatcher = new Dispatcher();

        it(instance).should.dispatch.message(TestEvent).when.invokeDispatch(something);
        it(instance).should.dispatch.message(TestOtherEvent).when.invokeDispatchOther();
        it(instance).should.not.dispatch.message(TestOtherEvent).when.invokeDispatch(something);

        it(instance).should.dispatch.events(TestEvent.EVENT, TestEvent.SECOND_EVENT).when.dispatchMultipleEvents(something);

        it(instance).should.dispatch.event(TestEvent.EVENT).when.dispatchTestEvent();
        var item:* = dispatched.pop();

        it(item).should.be.kind.of(TestEvent);
        it(item.type).should.equal(TestEvent.EVENT);
        it(dispatched).should.be.empty();
    }

    [Test]
    public function it_extensions_test_types():void {
        it([]).should.be.kind.of(Array);
        it([]).should.be.kind.of(Object);
        it([]).should.not.be.kind.of(String);

        it(something).should.be.kind.of(Object);
        it(something).should.not.be.kind.of(Array);
        it(something).should.not.be.kind.of(Number);
        it(something).should.not.be.kind.of(String);
        it(something).should.not.be.kind.of(Boolean);
        it(something).should.not.be.kind.of(int);

        it(5).should.be.kind.of(int);
        it(5.5).should.be.kind.of(Number);
        it(true).should.be.kind.of(Boolean);
    }
}
}
