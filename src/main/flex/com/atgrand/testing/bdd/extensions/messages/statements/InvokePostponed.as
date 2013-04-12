/**
 * Author: Ivan Dyachenko <ivan.dyachenko@db.com>
 * Date: 12.12.11
 * Time: 12:23
 */
package com.atgrand.testing.bdd.extensions.messages.statements {
import com.atgrand.testing.bdd.base.ISpecifications;

import org.flexunit.internals.runners.statements.AsyncStatementBase;
import org.flexunit.internals.runners.statements.IAsyncStatement;
import org.flexunit.token.AsyncTestToken;

public class InvokePostponed extends AsyncStatementBase implements IAsyncStatement{
    private var target:ISpecifications;

    public function InvokePostponed(target:ISpecifications) {
        this.target = target;
    }

    public function evaluate(parentToken:AsyncTestToken):void {
        var error:Error = null;
        try {
            target.invokePostponed();
        }
        catch (e:Error) {
            error = e;
        }
        parentToken.sendResult(error);
    }
}
}
