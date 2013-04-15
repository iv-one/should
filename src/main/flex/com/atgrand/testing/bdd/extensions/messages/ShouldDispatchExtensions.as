/**
 * Author: Ivan Dyachenko
 * Date: 28.11.11
 * Time: 12:09
 */
package com.atgrand.testing.bdd.extensions.messages {
import com.atgrand.testing.assertions.assertEvent;
import com.atgrand.testing.assertions.assertEvents;
import com.atgrand.testing.assertions.assertMessage;
import com.atgrand.testing.assertions.assertNoEvent;
import com.atgrand.testing.assertions.assertNoEvents;
import com.atgrand.testing.assertions.assertNoMessage;
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

import org.flexunit.asserts.assertEquals;

public class ShouldDispatchExtensions extends ExtensionsBase {
    public function ShouldDispatchExtensions(actual:*, spec:Specifications, negative:Boolean) {
        super(actual, spec, negative);
    }

    public function message(messageType:Class, selector:String = null, dispatchMethod:String = null):WhenExtensions {
        dispatchMethod ||= actual.hasOwnProperty("dispatch") ? "dispatch" : null;
        dispatchMethod ||= actual.hasOwnProperty("dispatcher") ? "dispatcher" : null;

        var invoke:Function = function (message:*):void {
            spec.dispatched.push(message)
        };

        spec.postpone(negative ?
                      assertNoMessage(actual, messageType, selector, dispatchMethod) :
                      assertMessage(actual, messageType, selector, dispatchMethod, invoke));
        return new WhenExtensions(actual, spec);
    }

    public function event(type:String, listener:Function = null):WhenExtensions {
        var invoke:Function = function (message:*):void {
            spec.dispatched.push(message)
        };

        spec.postpone(negative ?
                      assertNoEvent(actual, type) :
                      assertEvent(actual, type, listener || invoke));
        return new WhenExtensions(actual, spec);
    }

    public function events(...rest):WhenExtensions {
        spec.postpone(negative ?
                      assertNoEvents(actual, rest) :
                      assertEvents(actual, rest));
        return new WhenExtensions(actual, spec);
    }
}
}
