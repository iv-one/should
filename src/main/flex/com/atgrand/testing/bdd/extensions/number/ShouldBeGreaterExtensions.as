/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 14:46
 */
package com.atgrand.testing.bdd.extensions.number {
import com.atgrand.testing.bdd.base.Specifications;

import org.hamcrest.assertThat;
import org.hamcrest.number.greaterThan;
import org.hamcrest.number.greaterThanOrEqualTo;

public class ShouldBeGreaterExtensions extends NumberExtensionsBase{

    public function ShouldBeGreaterExtensions(actual:*, spec:Specifications, negative:Boolean = false) {
        super(actual, spec, negative);
    }

    override public function than(expected:Number):void {
        assertThat(actual, decorate(_or ? greaterThanOrEqualTo(expected) : greaterThan(expected)));
    }
}
}
