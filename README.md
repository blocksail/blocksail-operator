# blocksail-operator

blocksail-operator is a Kubernetes operator that allows users to run highly available blockchain nodes such as validators and RPC nodes for major public blockchains including Berachain, Ethereum, Cosmos, and more.

## Installation

To install blocksail-operator, follow these steps:

1. Clone the repository:
   ```sh
   git clone https://github.com/w3b5ync/blocksail-operator.git
   cd blocksail-operator
   ```

2. Install the operator using Helm:
   ```sh
   helm install blocksail-operator ./charts/blocksail-operator
   ```

## Usage

Here are some examples of how to use blocksail-operator:

1. Deploy a validator node:
   ```yaml
   apiVersion: blocksail.io/v1alpha1
   kind: Validator
   metadata:
     name: my-validator
   spec:
     blockchain: ethereum
     network: mainnet
     replicas: 3
   ```

2. Deploy an RPC node:
   ```yaml
   apiVersion: blocksail.io/v1alpha1
   kind: RPCNode
   metadata:
     name: my-rpc-node
   spec:
     blockchain: cosmos
     network: testnet
     replicas: 2
   ```
