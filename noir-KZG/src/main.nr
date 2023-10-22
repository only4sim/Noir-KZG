// KZG commitment scheme for polynomials in Noir.
// This is a simple implementation of the scheme described in
// https://eprint.iacr.org/2010/622.pdf
// This implementation is not optimized for performance.

// The scheme is parametrized by a field F, a degree n, and a
// generator g of F. The generator is used to compute the
// commitment key, and the degree is used to compute the
// evaluation key.

// The scheme is as follows:
// 1. The prover has a polynomial p of degree n-1.
// 2. The prover computes the commitment c = p(1) + p(g) + p(g^2) + ... + p(g^(n-1))
// 3. The prover computes the evaluation key e = (g, g^2, ..., g^n)
// 4. The prover sends (c, e) to the verifier.
// 5. The verifier has a point x and a value y.
// 6. The verifier computes the evaluation v = y + x * y + x^2 * y + ... + x^(n-1) * y
// 7. The verifier checks that c = v

// The scheme is perfectly hiding and computationally binding.

use dep::std;
use dep::std::collections::vec::Vec;

 

fn commit(g : Field, p : [Field; 5]) -> Field {
    let mut c = 0;

    let mut gpow: Field = 1;
    for i in 0..5 {
        c = c + gpow * p[i];
        gpow = gpow * g;
    }
    c
}


fn eval(e : [Field; 5], x : Field) -> Field {
    let mut xpow = 1;
    let mut v = 0;
    for i in 0..e.len() {
        v = v + xpow * e[i];
        xpow = xpow * x;
    }
    v
}

fn main(g: Field, p: [Field; 5], x: Field, e: [Field; 5]) {
    let c = commit(g, p);
    let v = eval(e, x);
    assert(v == c);
}

#[test]
fn test_main() {
    let g = 2;
    let p = [1, 2, 3, 4, 5];
    let x = 2;
    let e = [1, 2, 3, 4, 5];
    main(g, p, x, e);
}

