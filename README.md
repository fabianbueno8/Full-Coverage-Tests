
# PrivateBank Contract with Full Coverage Tests

This project contains a `PrivateBank` contract along with full coverage tests using the Foundry framework.

## Prerequisites

Before running the project, ensure you have the following installed on your machine:

- **Foundry**: A Solidity development toolkit. Install it by following the instructions in the official [Foundry Book](https://book.getfoundry.sh/).
- **Git**: For cloning the repository.
- **An Ethereum local node** or **Anvil**: Anvil is a local Ethereum node simulator that comes with Foundry.

## Instructions for Running the Project

1. **Clone the repository:**

    ```bash
    git clone <repo-link>
    cd PrivateBankContract
    ```

2. **Install dependencies:**

    If your project has additional dependencies, run:

    ```bash
    forge install
    ```

3. **Compile the contracts:**

    ```bash
    forge build
    ```

4. **Run the tests:**

    To execute all tests, use the following command:

    ```bash
    forge test
    ```

    This will run all the test cases and provide you with coverage and result reports.

5. **Check code coverage (Optional):**

    To see the test coverage, run:

    ```bash
    forge coverage
    ```

## Project Structure

- **src/PrivateBank.sol**: Contains the `PrivateBank` Solidity contract.
- **test/PrivateBankTest.t.sol**: Contains the test cases for the contract using Foundry's test framework.
