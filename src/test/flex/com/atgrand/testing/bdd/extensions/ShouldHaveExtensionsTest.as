/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 16:25
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;

import flash.events.Event;

import flash.events.EventDispatcher;

import org.hamcrest.core.anything;

import org.hamcrest.object.equalTo;

public class ShouldHaveExtensionsTest extends Specifications {

    [Test]
    public function provides_should_have_property():void {
        it({property:something}).should.have.property('property');
        it({property:something}).should.not.have.property('otherProperty');
    }

    [Test]
    public function provides_should_have_item():void {
        it([1, 2, 3]).should.have.item(2);
        it([1, "2", something]).should.have.item(something);
        it([1, "2", true]).should.not.have.item(something);
    }

    [Test]
    public function provides_should_have_items():void {
        it([1, 2, 3]).should.have.items([2, 3]);
        it([1, "2", something]).should.have.items([something, "2"]);
        it([1, "2", true]).should.not.have.items([1, "2", something]);
    }

    [Test]
    public function provides_should_have_listener():void {
        var dispatcher:EventDispatcher = new EventDispatcher();
        dispatcher.addEventListener("EVENT", function (e:Event):* {});
        it(dispatcher).should.have.listener("EVENT");
        it(dispatcher).should.not.have.listener("MOUSE_UP");
    }

    [Test]
    public function provides_should_have_properties():void {
        var event:Event = new Event(Event.COMPLETE, true, false);
        it(event).should.have.properties(
                {
                    type:equalTo(Event.COMPLETE),
                    bubbles:true,
                    cancelable:anything
                }
        );
    }
}
}
