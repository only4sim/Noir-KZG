# KZG Commitment Scheme Implementation in Noir

This repository contains an implementation of the KZG commitment scheme for polynomials using the Noir language. The KZG commitment scheme is described in detail in [this paper](https://eprint.iacr.org/2010/622.pdf). The current implementation is simplified and not optimized for performance.

## Getting Started

These instructions will help you run the implementation on your local machine for development and testing purposes.

### Prerequisites

Ensure you have the latest version of the Noir language installed on your machine. Visit the [official Noir website](https://noir-lang.org/) for the installation guide.

### Usage

The code is contained within a single file `main.nr`. The implementation is structured as follows:

1. The `commit` function computes the commitment of a polynomial `p` with a generator `g` of the field `F`.
2. The `eval` function computes the evaluation key `e` at a point `x`.
3. The `main` function demonstrates how to use the `commit` and `eval` functions, and includes an assertion to verify the correctness of the scheme.
4. A test function `test_main` is provided to exemplify the usage of the `main` function with specific values.

### File Structure

- `main.nr`: Contains the implementation of the KZG commitment scheme.

### Functions

#### `commit(g: Field, p: [Field; 5]) -> Field`

This function takes a generator `g` and a polynomial `p` of degree 4 (5 coefficients) as arguments, and returns the commitment `c` of the polynomial `p`.

#### `eval(e: [Field; 5], x: Field) -> Field`

This function takes an evaluation key `e` and a point `x`, and returns the evaluation `v` of the key `e` at the point `x`.

#### `main(g: Field, p: [Field; 5], x: Field, e: [Field; 5])`

This function demonstrates the usage of the `commit` and `eval` functions, and includes an assertion to verify the correctness of the scheme.

#### `#[test] fn test_main()`

A test function to exemplify the usage of the `main` function with specific values.

## Running the Tests

To run the tests, use the following command:

```bash
cd noir-KZG
nargo test
```

## Prove and Verify

To prove and verify the KZG commitment, use the following command. The example input is shown in the Prover.toml.

```bash
cd noir-KZG
nargo check
nargo prove
nargo verify
```

## Contributing
Feel free to open issues or submit pull requests to improve the implementation or extend its functionality.

## License
This project is licensed under the MIT License.

## Acknowledgements
The KZG commitment scheme is based on the paper by Kate, Zaverucha, and Goldberg: https://eprint.iacr.org/2010/622.pdf
Thanks to the Noir community for providing the language and the necessary tools to implement cryptographic schemes.