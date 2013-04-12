package com.atgrand.testing.bdd.base {
import com.atgrand.testing.bdd.extensions.ItExtensions;
import com.atgrand.testing.bdd.extensions.ShouldBeAExtensions;
import com.atgrand.testing.bdd.extensions.ShouldBeArrayExtensions;
import com.atgrand.testing.bdd.extensions.ShouldBeExtensions;
import com.atgrand.testing.bdd.extensions.ShouldBeKindExtensions;
import com.atgrand.testing.bdd.extensions.ShouldBeListExtensions;
import com.atgrand.testing.bdd.extensions.ShouldHaveExtensions;
import com.atgrand.testing.bdd.extensions.SpecificationExtensions;
import com.atgrand.testing.bdd.extensions.messages.WhenExtensions;
import com.atgrand.testing.bdd.extensions.messages.statements.WhenRule;

import org.flexunit.rules.IMethodRule;
import org.hamcrest.core.anything;
import org.mockito.api.MethodSelector;
import org.mockito.integrations.any;
import org.mockito.integrations.flexunit4.MockitoRule;
import org.mockito.integrations.times;
import org.mockito.integrations.verify;

ItExtensions;
ShouldBeArrayExtensions;
ShouldBeAExtensions;
ShouldBeExtensions;
ShouldBeKindExtensions;
ShouldBeListExtensions;
ShouldHaveExtensions;

public class Specifications implements ISpecifications {

    [Rule]
    public var whenRule:IMethodRule = new WhenRule();

    [Rule]
    public var mockitoRule:IMethodRule = new MockitoRule();

    protected var caughtError:Error;
    private var _postponed:Array;

    public var dispatched:Array;

    public function Specifications() {
        _postponed = [];
        dispatched = [];
    }

    /**
     *
     * @param actual the object whose value we are testing
     * @return the actual object wrapped in a SpecificationExtensions class that adds methods like shouldEqual, shouldBeTrue, etc.
     *
     *<p> Example: <pre>the(age).shouldEqual(20);</pre></p>
     */
    protected function the(actual:Object):SpecificationExtensions {
        return new SpecificationExtensions(actual, this);
    }

    /**
     *
     * @param actual the object whose value we are testing
     * @return the actual object wrapped in a ShouldExtensions class that adds methods like should.equal, should.be.true, etc.
     *
     *<p> Example: <pre>the(age).shouldEqual(20);</pre></p>
     */
    protected function it(actual:Object):ItExtensions {
        return new ItExtensions(actual, this);
    }

    /**
     * @return mock any
     */
    protected function get any():* {
        return org.mockito.integrations.any();
    }

    /**
     * @retunr hamcrest anything matcher
     */
    public function get anything():* {
        return org.hamcrest.core.anything();
    }

    /**
     * @return null
     */
    protected function get nothing():* {
        return null;
    }

    /**
     * Postpone assert invocation
     */
    public function postpone(assert:Function):void {
        _postponed.push(assert);
    }

    /**
     * @return When Extensions which invoke functions for testing messages and events
     */
    public function when(actual:*):WhenExtensions {
        return new WhenExtensions(actual, this);
    }

    /**
     *  Invoke all postponed functions
     */
    public function invokePostponed():void {
        if (_postponed && _postponed.length) {
            _postponed.map(function (_:*):* {return _()});
            _postponed = [];
        }
    }

    public function get postponed():Array {
        return _postponed;
    }

    /**
     *
     * This is a helper that allows to execute a piece of code that will most likely cause an error.
     * After invoking it, we can examine the caughtError property to validate that the expected type
     * of error was thrown and that the message contained what we expected.
     *
     * This approach is more flexible than putting a meta-tag for the expected error on the test method.
     *
     * @param func
     * the function that will cause the error
     *
     */
    protected function catchError(func:Function):void {
        try {
            caughtError = null;
            func();
        }
        catch (e:Error) {
            caughtError = e;
        }
    }

    /**
     * This is return some object for id some(id) where some(id) == some(id) and some(id) != some(id_other)
     */
    public function some(...rest):* {
        if (rest && rest.length > 1) {
            return rest.map(function (_:*):* {return some(_)});
        }
        return UniqueByIdObject.get(rest && rest.length == 1 ? rest[0] : 'something');
    }

    public function get something():* {
        return some();
    }

    /**
     *  Mockito
     */
    public function get verify():MethodSelector {
        return org.mockito.integrations.verify();
    }

    public function times(count:int):MethodSelector {
        return org.mockito.integrations.verify(org.mockito.integrations.times(count));
    }
}
}
import flash.utils.Dictionary;

dynamic class UniqueByIdObject {
    public static var _uniqueObjects:Dictionary = new Dictionary();
    public var uid:*;

    public static function get(uid:*):* {
        return _uniqueObjects[uid] || new UniqueByIdObject(uid);
    }

    public function UniqueByIdObject(uid:*) {
        _uniqueObjects[uid] = this;
        this.uid = uid;
    }

    public function toString():String {
        return String(uid);
    }
}
