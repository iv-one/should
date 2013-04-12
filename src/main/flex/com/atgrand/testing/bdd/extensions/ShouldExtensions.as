/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:49
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.assertions.assertEqualDates;
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;
import com.atgrand.testing.bdd.extensions.messages.ShouldDispatchExtensions;

import org.hamcrest.assertThat;
import org.hamcrest.collection.array;
import org.hamcrest.object.equalTo;
import org.hamcrest.text.containsString;
import org.hamcrest.text.endsWith;
import org.hamcrest.text.startsWith;

public class ShouldExtensions extends ExtensionsBase {

    public function ShouldExtensions(actual:*, spec:Specifications, negative:Boolean = false) {
        super(actual, spec, negative);
    }

    public function get be():ShouldBeExtensions {
        return new ShouldBeExtensions(actual, spec, negative);
    }

    public function get have():ShouldHaveExtensions {
        return new ShouldHaveExtensions(actual, spec, negative);
    }

    public function get not():ShouldExtensions {
        return new ShouldExtensions(actual, spec, true);
    }

    public function equal(expected:*):void {
        if (actual is Date) {
            assertEqualDates(actual, expected);
        }
        else if (actual is Array) {
            assertThat(actual, decorate(array(expected)));
        }
        else {
            assertThat(actual, decorate(equalTo(expected)));
        }
    }

    public function contain(expected:String):void {
        assertThat(actual, decorate(containsString(expected)));
    }

    public function ends(expected:String):void {
        assertThat(actual, decorate(endsWith(expected)));
    }

    public function starts(expected:String):void {
        assertThat(actual, decorate(startsWith(expected)));
    }

    public function get dispatch():ShouldDispatchExtensions {
        return new ShouldDispatchExtensions(actual, spec, negative);
    }
}
}
