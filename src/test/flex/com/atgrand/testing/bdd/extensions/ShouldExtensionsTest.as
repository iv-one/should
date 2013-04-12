/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:57
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;

public class ShouldExtensionsTest extends Specifications {

    [Test]
    public function provides_should_equal():void {
        var object:Object = something;

        it(5).should.equal(5);
        it(5).should.not.equal(4);

        it('string').should.equal('string');
        it('string').should.not.equal('other string');

        it(object).should.equal(object);
        it(object).should.not.equal(nothing);
    }

    [Test]
    public function provides_should_contain():void {
        it('1234567').should.contain('234');
        it('1234567').should.not.contain('765');

        it('hello world').should.contain('hello');
        it('hello world').should.not.contain('mir');
    }

    [Test]
    public function provides_should_ends():void {
        it("hello world").should.ends("world");
        it("hello world").should.not.ends("hello");
    }

    [Test]
    public function provides_should_starts():void {
        it("hello world").should.starts("hello");
        it("hello world").should.not.starts("world");
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_equal():void {
        it(2).should.equal(5);
    }

    [Test(expected="org.hamcrest::AssertionError")]
    public function test_provides_should_contain():void {
        it('1234567').should.contain('890');
    }

}
}
