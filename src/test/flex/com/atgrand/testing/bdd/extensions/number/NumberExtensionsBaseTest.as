/**
 * Author: Ivan Dyachenko <ivan.dyachenko@db.com>
 * Date: 08.12.11
 * Time: 12:18
 */
package com.atgrand.testing.bdd.extensions.number {
import com.atgrand.testing.bdd.base.Specifications;

public class NumberExtensionsBaseTest extends Specifications{

    [Test(expects="Error")]
    public function testThan():void {
        (new NumberExtensionsBase(4, null, false)).than(5);
    }
}
}
