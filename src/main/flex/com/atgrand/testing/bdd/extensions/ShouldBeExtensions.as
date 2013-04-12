/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:53
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;
import com.atgrand.testing.bdd.extensions.number.ShouldBeBetweenExtensions;
import com.atgrand.testing.bdd.extensions.number.ShouldBeGreaterExtensions;
import com.atgrand.testing.bdd.extensions.number.ShouldBeLessExtensions;

import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;
import org.flexunit.asserts.fail;
import org.hamcrest.assertThat;
import org.hamcrest.collection.emptyArray;
import org.hamcrest.number.between;
import org.hamcrest.object.sameInstance;
import org.hamcrest.text.emptyString;
import org.hamcrest.text.re;

public class ShouldBeExtensions extends ExtensionsBase {

    public function ShouldBeExtensions(actual:*, spec:Specifications, negative:Boolean = false) {
        super(actual, spec, negative);
    }

    public function get a():ShouldBeAExtensions {
        return new ShouldBeAExtensions(actual, spec, negative);
    }

    public function get an():ShouldBeAExtensions {
        return new ShouldBeAExtensions(actual, spec, negative);
    }

    public function _true():ShouldBeExtensions {
        negative ?
        assertFalse(actual) :
        assertTrue(actual);
        return this;
    }

    public function truth():ShouldBeExtensions {
        return _true();
    }

    public function _false():ShouldBeExtensions {
        negative ?
        assertTrue(actual) :
        assertFalse(actual);
        return this;
    }

    public function nil():ShouldBeExtensions {
        negative ?
        assertNotNull(actual) :
        assertNull(actual);
        return this;
    }

    public function get greater():ShouldBeGreaterExtensions {
        return new ShouldBeGreaterExtensions(actual, spec, negative);
    }

    public function get less():ShouldBeLessExtensions {
        return new ShouldBeLessExtensions(actual, spec, negative);
    }

    public function between(begin:int, end:int):ShouldBeBetweenExtensions {
        assertThat(actual, decorate(org.hamcrest.number.between(begin, end)));
        return new ShouldBeBetweenExtensions(actual, spec, negative, begin, end);
    }

    public function empty():void {
        if (actual is Array) assertThat(actual, decorate(emptyArray()));
        else if (actual is String) assertThat(actual, decorate(emptyString()));
        else fail("Actual value should be array or string");
    }

    public function matched(regExp:RegExp):void {
        assertThat(actual, decorate(re(regExp)));
    }

    public function same_as(expected:*):void {
        assertThat(actual, decorate(sameInstance(expected)));
    }

    public function get array():ShouldBeArrayExtensions {
        return new ShouldBeArrayExtensions(actual, spec, negative);
    }

    public function get list():ShouldBeListExtensions {
        return new ShouldBeListExtensions(actual, spec, negative);
    }

    public function get kind():ShouldBeKindExtensions {
        return new ShouldBeKindExtensions(actual, spec, negative);
    }
}
}
