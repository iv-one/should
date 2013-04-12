/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 16:03
 */
package com.atgrand.testing.bdd.extensions.number {
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import org.hamcrest.assertThat;
import org.hamcrest.number.between;

public class ShouldBeBetweenExtensions extends ExtensionsBase{
    private var begin:int;
    private var end:int;

    public function ShouldBeBetweenExtensions(actual:*, spec:Specifications, negative:Boolean, begin:int, end:int) {
        super(actual, spec, negative);
        this.begin = begin;
        this.end = end;
    }

    public function exclusive():void {
        assertThat(actual, decorate(between(begin, end, true)));
    }
}
}
