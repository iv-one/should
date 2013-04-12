/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 15:57
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;

import org.hamcrest.number.greaterThan;

import org.hamcrest.object.instanceOf;

public class ShouldBeArrayExtensionsTest extends Specifications {

    private var array:Array = [1, 2, 3];

    [Test]
    public function provides_should_be_array():void {
        it(array).should.be.array.like([1, 2, 3]);
        it(array).should.be.array.like([1, 2, 3]).with_size(3);

        it(array).should.not.be.array.like([1, 2, 3, 4]);
        it(array).should.not.be.array.with_size(4);
    }

    [Test]
    public function provides_should_be_array_with_items():void {
        it(array).should.be.array.with_items(instanceOf(Number));
        it(array).should.be.array.with_items(greaterThan(0));
        it(array).should.not.be.array.with_items(greaterThan(3));
    }

    [Test]
    public function provides_should_be_array_with_items_with_equal():void {
        it([1, 1, 1]).should.be.array.with_items(1);
        it([1, 1, 1]).should.not.be.array.with_items(2);
    }
}
}
