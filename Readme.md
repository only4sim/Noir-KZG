# Noir-KZG: KZG Commitment for Noir

This repository contains a simple implementation of the KZG commitment scheme for polynomials using the Noir programming language. The KZG commitment scheme is described in detail in [this paper](https://www.iacr.org/archive/asiacrypt2010/6477178/6477178.pdf). The current implementation is not optimized for performance but serves as a straightforward illustration of the scheme.

## Getting Started

Below are instructions to get this project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have the latest version of the Noir language installed on your machine. Visit the [official Noir website](https://noir-lang.org/) for the installation guide.

### Usage

The code is contained within a single file. The implementation is structured as follows:

1. The `eval_key` function computes the evaluation key based on a generator `g` and a scalar `s`.
2. The `commit` function computes the commitment of a polynomial `p` using an evaluation key `e`.
3. The `eval` function computes the evaluation of polynomial `p` at a point `x` with a generator `g`.
4. The `main` function demonstrates how to use the `eval_key`, `commit`, and `eval` functions, and includes assertions to verify the correctness of the scheme.
5. A test function `test_main` is provided to exemplify the usage of the `main` function with specific values.

### File Structure

- `main.nr`: Contains the implementation of the KZG commitment scheme.

### Functions

#### `eval_key(g: Field, s: Field) -> [Field; 5]`

This function computes the evaluation key based on a generator `g` and a secret `s`.

#### `commit(e: [Field; 5], p: [Field; 5]) -> Field`

This function computes the commitment of a polynomial `p` using an evaluation key `e`.

#### `eval(g: Field, x: Field, p: [Field; 5]) -> Field`

This function computes the evaluation of polynomial `p` at a point `x` with a generator `g`.

#### `main(g: Field, p: [Field; 5], x: Field, e: [Field; 5])`

This function demonstrates the usage of the `eval_key`, `commit`, and `eval` functions, and includes assertions to verify the correctness of the scheme.

#### `#[test] fn test_main()`

A test function to exemplify the usage of the `main` function with specific values.

## Running the Tests

To run the tests, use the following command:

```bash
noir test
```

This will execute the `test_main` function, verifying the correctness of the implementation.

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

- The KZG commitment scheme is based on the paper by Kate, Zaverucha, and Goldberg: [https://www.iacr.org/archive/asiacrypt2010/6477178/6477178.pdf](https://www.iacr.org/archive/asiacrypt2010/6477178/6477178.pdf)
- Thanks to the Noir community for providing the language and the necessary tools to implement cryptographic schemes.