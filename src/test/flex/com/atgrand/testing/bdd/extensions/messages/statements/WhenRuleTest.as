/**
 * Author: Ivan Dyachenko <ivan.dyachenko@db.com>
 * Date: 09.12.11
 * Time: 18:45
 */
package com.atgrand.testing.bdd.extensions.messages.statements {
import com.atgrand.testing.bdd.base.ISpecifications;

import org.flexunit.rules.IMethodRule;

public class WhenRuleTest implements ISpecifications {

    private var postponed:Function;

    [Rule]
    public var whenRule:IMethodRule = new WhenRule();

    [Test(expects="Error")]
    public function testMethod():void {
        postpone(function():void{
            throw new Error("Postponed assets invoked");
        });
    }

    public function postpone(assert:Function):void {
        postponed = assert;
    }

    public function invokePostponed():void {
        postponed();
    }
}
}
