/**
 * Author: Ivan Dyachenko <ivan.dyachenko@db.com>
 * Date: 08.12.11
 * Time: 10:52
 */
package com.atgrand.testing.assertions {
public class AssertNaNTest {
    [Test]
    public function testNaN():void {
        assertNaN(NaN);
    }
}
}
