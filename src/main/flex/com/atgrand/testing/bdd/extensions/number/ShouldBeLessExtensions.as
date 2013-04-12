/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 14:47
 */
package com.atgrand.testing.bdd.extensions.number {
import com.atgrand.testing.bdd.base.Specifications;

import org.hamcrest.assertThat;
import org.hamcrest.number.lessThan;
import org.hamcrest.number.lessThanOrEqualTo;

public class ShouldBeLessExtensions extends NumberExtensionsBase{

    public function ShouldBeLessExtensions(actual:*, spec:Specifications, negative:Boolean = false) {
        super(actual, spec, negative);
    }

    override public function than(expected:Number):void {
        assertThat(actual, decorate(_or ? lessThanOrEqualTo(expected) : lessThan(expected)));
    }
}
}
