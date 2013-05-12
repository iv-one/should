/**
 * Author: Ivan Dyachenko
 * Date: 08.12.11
 * Time: 15:59
 */
package com.atgrand.testing.bdd.extensions.messages.statements {

import com.atgrand.testing.bdd.base.ISpecifications;

import flash.errors.IllegalOperationError;

import org.flexunit.asserts.fail;

import org.flexunit.internals.runners.statements.IAsyncStatement;
import org.flexunit.internals.runners.statements.MethodRuleBase;
import org.flexunit.internals.runners.statements.StatementSequencer;
import org.flexunit.rules.IMethodRule;
import org.flexunit.runners.model.FrameworkMethod;
import org.flexunit.token.AsyncTestToken;
import org.flexunit.token.ChildResult;

public class WhenRule extends MethodRuleBase implements IMethodRule {

    public function WhenRule() {
        super();
    }

    override public function evaluate(parentToken:AsyncTestToken):void {
        super.evaluate(parentToken);
        proceedToNextStatement();
    }

    override public function apply(base:IAsyncStatement, method:FrameworkMethod, test:Object):IAsyncStatement {
        if (test is ISpecifications) {
            var sequencer:StatementSequencer = new StatementSequencer();
            sequencer.addStep(base);
            sequencer.addStep(withInvokePostponed(test));
            return super.apply(sequencer, method, test);
        }
        return super.apply(base, method, test);
    }

    private function withInvokePostponed(test:Object):IAsyncStatement {
        return new InvokePostponed(test as ISpecifications);
    }

    override protected function handleStatementComplete(result:ChildResult):void {
        super.handleStatementComplete(result);
    }
}
}
