/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:25
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;

import org.hamcrest.*;

public class ItExtensions extends SpecificationExtensions {

    public function ItExtensions(actual:Object, spec:Specifications) {
        super(actual, spec);
    }

    public function get should():ShouldExtensions {
        return new ShouldExtensions(actual, spec);
    }

    public function assert(... rest):void {
        assertThat.apply(this, rest);
    }
}
}
