/**
 * Author: Ivan Dyachenko
 * Date: 28.11.11
 * Time: 12:22
 */
package com.atgrand.testing.bdd.extensions.messages {
import com.atgrand.testing.bdd.base.Specifications;

import flash.utils.Proxy;
import flash.utils.flash_proxy;

use namespace flash_proxy;

public dynamic class WhenExtensions extends Proxy {
    private var _spec:Specifications;
    private var _actual:*;

    public function WhenExtensions(actual:*, spec:Specifications) {
        _actual = actual;
        _spec = spec;
    }

    public function get when():WhenExtensions {
        return this;
    }

    override flash_proxy function callProperty(name:*, ...rest):* {
        _spec.dispatched = [];
        var fun:Function = _actual[name];
        fun.apply(_actual, rest);
        _spec.invokePostponed();
        return null;
    }
}
}
