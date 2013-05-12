/**
 * Author: Ivan Dyachenko
 * Date: 28.11.11
 * Time: 14:01
 */
package com.atgrand.testing.bdd.base {

public class SpecificationsBaseTest extends Specifications {

    [Test]
    public function testSome():void {
        it(some(1)).should.be.same_as(some(1));
        it([some(1), some(2), some(3)]).should.be.array.like([some(1), some(2), some(3)]);
        it(some(1, 2, 3)).should.be.array.like([some(1), some(2), some(3)]);
    }

    [Test]
    public function testSomeToString():void {
        it(some(1).toString()).should.equal("1");
    }

    [Test]
    public function testPostpone():void {
        var result:Array = [];
        postpone(function ():void {result.push(1)});
        postpone(function ():void {result.push(2)});
        postpone(function ():void {result.push(something)});
        postpone(function ():void {result.push(nothing)});
        it(postponed).should.be.array.with_size(4);

        invokePostponed();
        it(result).should.be.array.like([1, 2, anything, nothing]);
        it(postponed).should.be.empty();
    }

    [Test]
    public function testWhen():void {
        var result:Array = [];
        var mock:MockObject = new MockObject();
        postpone(function ():void {result.push(1)});
        postpone(function ():void {result.push(2)});
        postpone(function ():void {result.push(something)});
        postpone(function ():void {result.push(nothing)});
        it(postponed).should.be.array.with_size(4);

        when(mock).invoke();
        it(result).should.be.array.like([1, 2, something, nothing]);
        it(postponed).should.be.empty();
    }

    [Test]
    public function testCatchError():void {
        catchError(function():void{throw new Error("Caught error")});
        it(caughtError.message).should.equal("Caught error");
    }
}
}

class MockObject {
    public function invoke(... some):void {
        // nothing here
    }
}
