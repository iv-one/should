/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 12.10.11
 * Time: 15:49
 */
package com.atgrand.testing.bdd.number {
import com.atgrand.testing.bdd.extensions.*;
import com.atgrand.testing.bdd.base.Specifications;

public class ShouldBeLessExtensionsTest extends Specifications {
    [Test]
    public function provides_should_be_less_than():void {
        it(5).should.be.less.than(6);
        it(5).should.be.less.or.equal.than(5);

        it(5).should.not.be.less.than(5);
        it(5).should.not.be.less.or.equal.than(4);
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_be_less_than():void {
        it(5).should.be.less.than(5);
        it(5).should.be.less.or.equal.than(4);
    }
}
}
