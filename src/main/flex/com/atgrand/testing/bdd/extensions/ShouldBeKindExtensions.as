/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 18:23
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import org.hamcrest.assertThat;
import org.hamcrest.object.instanceOf;

public class ShouldBeKindExtensions extends ExtensionsBase {

    public function ShouldBeKindExtensions(actual:*, spec:Specifications, negative:Boolean) {
        super(actual, spec, negative);
    }

    public function of(expected:Class):void {
        assertThat(actual, decorate(instanceOf(expected)))
    }
}
}
