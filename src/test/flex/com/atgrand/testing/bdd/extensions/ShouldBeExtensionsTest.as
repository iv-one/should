/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 16:25
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;

public class ShouldBeExtensionsTest extends Specifications {

    [Test]
    public function provides_should_be_true():void {
        it(true).should.be._true();
        it(1 == 1).should.be._true();

        it(false).should.not.be._true();
        it(1 == 2).should.not.be._true();
    }

    [Test]
    public function provides_should_be_false():void {
        it(false).should.be._false();
        it(1 != 1).should.be._false();

        it(true).should.not.be._false();
        it(1 == 1).should.not.be._false();
    }

    [Test]
    public function provides_should_be_null():void {
        it(null).should.be.nil();
        it(nothing).should.be.nil();

        it([]).should.not.be.nil();
        it({}).should.not.be.nil();
    }

    [Test]
    public function provides_should_be_between():void {
        it(5).should.be.between(3, 5);
        it(7).should.not.be.between(3, 5);
        it(4).should.be.between(3, 5).exclusive();
    }

    [Test]
    public function provides_should_be_empty():void {
        it("").should.be.empty();
        it("not empty").should.not.be.empty();

        it([]).should.be.empty();
        it([1, 2, 3]).should.not.be.empty();
    }

    [Test]
    public function provide_should_be_matched():void {
        it("hello").should.be.matched(/^\w+$/);
        it("12345").should.be.matched(/^\d+$/);
    }

    [Test]
    public function provide_should_be_same_as():void {
        var instance:Object = something;
        it(instance).should.be.same_as(instance);
        it(instance).should.not.be.same_as(nothing);
    }

    [Test(expected="flexunit.framework::AssertionFailedError")]
    public function test_provides_should_be_true():void {
        it(false).should.be._true();
        it(1 == 2).should.be._true();
        it('hello' == 'world').should.be._true();
    }

    [Test(expected="flexunit.framework::AssertionFailedError")]
    public function test_provides_should_be_false():void {
        it(true).should.be._false();
        it(1 == 1).should.be._false();
        it('hello' == 'hello').should.be._false();
    }

    [Test(expected="flexunit.framework::AssertionFailedError")]
    public function test_provides_should_be_null():void {
        it({}).should.be.nil();
        it([]).should.be.nil();
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_be_between():void {
        it(7).should.be.between(3, 5);
        it(5).should.not.be.between(3, 5);
        it(5).should.be.between(3, 5).exclusive();
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_be_empty():void {
        it("not empty").should.be.empty();
        it("").should.not.be.empty();
    }
    
    [Test(expects="Error")]
    public function empty_should_work_only_for_arrays_and_strings():void {
        it(nothing).should.be.empty();
        it(5.5).should.be.empty();
        it(false).should.be.empty();
        it(something).should.be.empty();
    }
}
}
