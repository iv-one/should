/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 18:07
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import mx.collections.IList;

import org.hamcrest.assertThat;
import org.hamcrest.collection.array;
import org.hamcrest.collection.arrayWithSize;
import org.hamcrest.object.instanceOf;

public class ShouldBeListExtensions extends ExtensionsBase {

    public function ShouldBeListExtensions(actual:*, spec:Specifications, negative:Boolean) {
        super(actual, spec, negative);
    }

    public function like(expectedArray:*):ShouldBeListExtensions {
        assertThat(actual, instanceOf(IList));
        var list:IList = actual;
        expectedArray is Array ?
            assertThat(list.toArray(), decorate(array(expectedArray))):
            assertThat(list.toArray(), decorate(array(IList(expectedArray).toArray())));
        return this;
    }

    public function with_size(expectedSize:uint):void {
        assertThat(IList(actual).toArray(), decorate(arrayWithSize(expectedSize)));
    }
}
}
