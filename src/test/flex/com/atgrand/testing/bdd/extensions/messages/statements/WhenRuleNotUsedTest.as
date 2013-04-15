/**
 * Author: Ivan Dyachenko
 * Date: 12.12.11
 * Time: 16:42
 */
package com.atgrand.testing.bdd.extensions.messages.statements {
import org.flexunit.rules.IMethodRule;

public class WhenRuleNotUsedTest {

    [Rule]
    public var whenRule:IMethodRule = new WhenRule();

    [Test]
    public function empty():void {
        // nothing
    }
}
}
