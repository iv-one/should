/**
 * Author: Ivan Dyachenko
 * Date: 12.12.11
 * Time: 11:53
 */
package com.atgrand.testing.bdd.base {
public interface ISpecifications {
    function postpone(assert:Function):void;

    function invokePostponed():void;
}
}
