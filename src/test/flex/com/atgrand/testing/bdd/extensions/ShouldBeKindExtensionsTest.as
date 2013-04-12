/**
 * Created by IntelliJ IDEA.
 * Author: Ivan Dyachenko
 * Date: 11.10.11
 * Time: 16:25
 */
package com.atgrand.testing.bdd.extensions {
import com.atgrand.testing.bdd.base.Specifications;

public class ShouldBeKindExtensionsTest extends Specifications {

    [Test]
    public function provides_should_be_kind_of():void {
        it(true).should.be.kind.of(Boolean);
        it("String").should.be.kind.of(String);
        it([1, 2, 3]).should.be.kind.of(Array);
    }
}
}
