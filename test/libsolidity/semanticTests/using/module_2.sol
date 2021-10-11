==== Source: A ====
library L {
    function id(uint x) internal pure returns (uint) {
        return x;
    }
    function one_ext(uint) pure external returns(uint) {
        return 1;
    }

}

==== Source: B ====
import "A" as M;

contract C {
    using M.L for uint;
	function f(uint x) public pure returns (uint) {
        return x.id();
    }
    function g(uint x) public pure returns (uint) {
        return x.one_ext();
    }
}
// ====
// compileViaYul: also
// ----
// library: L
// f(uint256): 5 -> 5
// f(uint256): 10 -> 10
// g(uint256): 5 -> 1
// g(uint256): 10 -> 1
