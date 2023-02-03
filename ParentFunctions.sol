// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// calling parent fucntions : super or direct


contract E {
    event log(string message);

    function foo() public virtual {
        emit log("E.foo");
    }

    function bar() public virtual {
        emit log("E.bar");
    }
}

contract F is E {

    function foo() public override virtual {
        emit log("F.foo");
        //direct call
        E.foo();
    }

    function bar() public override virtual {
        emit log("F.bar");
        //using super
        super.bar();
    }
}

contract G is E {

    function foo() public override virtual {
        emit log("G.foo");
        //direct call
        E.foo();
    }

    function bar() public override virtual {
        emit log("G.bar");
        //using super
        super.bar();
    }
}

contract H is F, G {
    function foo() public override(F,G) {
        F.foo(); //only calls that fucntion
    }

    function bar() public override(F,G) {
        super.bar(); //will call all parents
    }
}


