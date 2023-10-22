// KZG commitment scheme for polynomials in Noir.
// This is a simple implementation of the scheme described in
// https://eprint.iacr.org/2010/622.pdf
// This implementation is not optimized for performance.


// The scheme is perfectly hiding and computationally binding.

use dep::std;
use dep::std::collections::vec::Vec;

// Compute the evaluation key.
fn eval_key(g : Field, s : Field) -> [Field; 5] {
    let mut e = [0; 5];
    let mut spow = 1;
    for i in 0..5 {
        e[i] = g.pow_32(spow);
        spow = spow * s;
    }
    e
}

fn commit(e: [Field; 5], p : [Field; 5]) -> Field {
    let mut c = 0;

    for i in 0..5 {
        c = c + e[i].pow_32(p[i]);
    }
    c
}

fn eval(g : Field, x: Field, p : [Field; 5]) -> Field {
    let mut v = 0;

    let mut xpow: Field = 1;
    for i in 0..5 {
        v = v + g.pow_32(xpow*p[i]);
        xpow = xpow * x;
    }
    v
}


fn main(g: Field, p: [Field; 5], x: Field, e: [Field; 5]) {
    let c = commit(e, p);
    let v = eval(g, x, p);

    let s = 3;
    let e_tmp = eval_key(g, s);
    let c_tmp = commit(e_tmp, p);
    let v_tmp = eval(g, x, p);

    assert(c == c_tmp);
    assert(v == v_tmp);
}

#[test]
fn test_main() {
    let g = 2;
    let p = [1, 2, 3, 4, 5];
    let s = 3;
    let x = 5;
    let e = eval_key(g, s);

    main(g, p, x, e);
}

