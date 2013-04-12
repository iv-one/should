/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 16:13
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import org.flexunit.assertThat;
import org.hamcrest.number.isNotANumber;
import org.hamcrest.number.isNumber;

public class ShouldBeAExtensions extends ExtensionsBase {

    public function ShouldBeAExtensions(actual:*, spec:Specifications, negative:Boolean = false) {
        super(actual, spec, negative);
    }

    public function number():void {
        if (negative && typeof(actual) != "number") {
            return;
        }
        assertThat(actual, negative ? isNotANumber() : isNumber());
    }
}
}
