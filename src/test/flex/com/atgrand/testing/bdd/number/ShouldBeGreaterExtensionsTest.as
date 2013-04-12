/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 15:49
 */
package com.atgrand.testing.bdd.number {
import com.atgrand.testing.bdd.extensions.*;
import com.atgrand.testing.bdd.base.Specifications;

public class ShouldBeGreaterExtensionsTest extends Specifications {
    [Test]
    public function provides_should_be_greater_than():void {
        it(5).should.be.greater.than(4);
        it(5).should.be.greater.or.equal.than(5);

        it(5).should.not.be.greater.than(5);
        it(5).should.not.be.greater.or.equal.than(6);
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_be_greater_than():void {
        it(5).should.be.greater.than(5);
        it(5).should.be.greater.or.equal.than(6);
    }
}
}
