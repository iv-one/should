/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:50
 */
package com.atgrand.testing.bdd.extensions.base {
import com.atgrand.testing.bdd.base.Specifications;

import org.hamcrest.Matcher;
import org.hamcrest.core.IsNotMatcher;

public class ExtensionsBase {
    private var _actual:*;
    private var _negative:Boolean;
    private var _spec:Specifications;

    public function ExtensionsBase(actual:*, spec:Specifications,  negative:Boolean = false) {
        _spec = spec;
        _actual = actual;
        _negative = negative;
    }

    public function get actual():* {
        return _actual;
    }

    protected function decorate(value:Object):* {
        return _negative ? new IsNotMatcher(value as Matcher) : value;
    }

    protected function get negative():Boolean {
        return _negative;
    }

    public function get spec():Specifications {
        return _spec;
    }
}
}
