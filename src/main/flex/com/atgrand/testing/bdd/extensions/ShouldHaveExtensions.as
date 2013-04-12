/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 16:40
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import flash.events.IEventDispatcher;

import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertTrue;
import org.hamcrest.assertThat;
import org.hamcrest.collection.hasItem;
import org.hamcrest.collection.hasItems;
import org.hamcrest.object.equalTo;
import org.hamcrest.object.hasProperties;

public class ShouldHaveExtensions extends ExtensionsBase {

    public function ShouldHaveExtensions(actual:*, spec:Specifications, negative:Boolean = false) {
        super(actual, spec, negative);
    }

    public function property(propertyName:String):void {
        negative ?
            assertFalse(actual.hasOwnProperty(propertyName)) :
            assertTrue(actual.hasOwnProperty(propertyName));
    }

    public function item(expected:*):void {
        assertThat(actual, decorate(hasItem(expected)));
    }

    public function items(expectedArray:Array):void {
        assertThat(actual, decorate(hasItems.apply(null, expectedArray.map(function(item:*, index:int, array:Array):*{
            return equalTo(item);
        }))));
    }

    public function listener(expectedType:String):void {
        negative ?
            assertFalse((actual as IEventDispatcher).hasEventListener(expectedType)):
            assertTrue((actual as IEventDispatcher).hasEventListener(expectedType));
    }

    public function properties(object:Object):void {
        assertThat(actual, decorate(hasProperties(object)));
    }
}
}
