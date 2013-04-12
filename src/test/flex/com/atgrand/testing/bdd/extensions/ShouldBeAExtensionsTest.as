/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 16:25
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;

public class ShouldBeAExtensionsTest extends Specifications {

    [Test]
    public function provides_should_be_a_number():void {
        it(3).should.be.a.number();
        it(3.14).should.be.a.number();

        it([]).should.not.be.a.number();
        it(something).should.not.be.a.number();
        it(NaN).should.not.be.a.number();
        it(0/0).should.not.be.a.number();
        it("Hello").should.not.be.a.number();
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_be_a_number():void {
        it(3).should.not.be.a.number();
        it(NaN).should.be.a.number();
        it(0/0).should.be.a.number();
    }
}
}
