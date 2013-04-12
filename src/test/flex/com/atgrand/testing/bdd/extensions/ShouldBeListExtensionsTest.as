/**
 * Author: Ivan Dyachenko <ivan.dyachenko@db.com>
 * Date: 27.12.11
 * Time: 17:23
 */
package com.atgrand.testing.bdd.extensions {

import com.atgrand.testing.bdd.base.Specifications;

import mx.collections.ArrayCollection;

import mx.collections.IList;

public class ShouldBeListExtensionsTest extends Specifications {
    private var list:IList = new ArrayCollection([1, 2, 3]);

    [Test]
    public function provides_should_be_list():void {
        it(list).should.be.list.like([1, 2, 3]);
        it(list).should.be.list.like(new ArrayCollection([1, 2, 3]));
        it(list).should.be.list.like([1, 2, 3]).with_size(3);

        it(list).should.not.be.list.like([1, 2, 3, 4]);
        it(list).should.not.be.list.with_size(4);
    }

    [Test(expects="Error")]
    public function should_raise_error_if_expected_not_IList():void {
        it(list).should.be.list.like(something);
    }

}
}
