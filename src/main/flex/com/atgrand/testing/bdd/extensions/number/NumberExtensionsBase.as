/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 15:38
 */
package com.atgrand.testing.bdd.extensions.number {
import com.atgrand.testing.bdd.base.Specifications;
import com.atgrand.testing.bdd.extensions.base.ExtensionsBase;

public class NumberExtensionsBase extends ExtensionsBase{

    protected var _or:Boolean;

    public function NumberExtensionsBase(actual:*, spec:Specifications, negative:Boolean) {
        super(actual, spec, negative);
    }

    public function than(expected:Number):void {
        throw new Error(".that() method should be implemented in children's");
    }

    public function get or():NumberExtensionsBase {
        _or = true;
        return this;
    }

    public function get equal():NumberExtensionsBase {
        return this;
    }
}
}
