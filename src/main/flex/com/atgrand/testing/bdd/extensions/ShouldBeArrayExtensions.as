/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 18:07
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import org.hamcrest.Matcher;

import org.hamcrest.assertThat;

import org.hamcrest.collection.array;
import org.hamcrest.collection.arrayWithSize;
import org.hamcrest.collection.everyItem;
import org.hamcrest.object.equalTo;

public class ShouldBeArrayExtensions extends ExtensionsBase {

    public function ShouldBeArrayExtensions(actual:*, spec:Specifications, negative:Boolean) {
        super(actual, spec, negative);
    }

    public function like(expectedArray:Array):ShouldBeArrayExtensions {
        assertThat(actual, decorate(array(expectedArray)));
        return this;
    }

    public function with_size(expectedSize:uint):void {
        assertThat(actual, decorate(arrayWithSize(expectedSize)));
    }

    public function with_items(expectedItem:Object):void {
        assertThat(actual, everyItem(decorate(expectedItem is Matcher ? expectedItem : equalTo(expectedItem))));
    }
}
}
