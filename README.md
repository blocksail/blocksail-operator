# blocksail-operator [WIP]

blocksail-operator is a work-in-progress Kubernetes operator that allows users to run highly available blockchain nodes such as validators and RPC nodes for major public blockchains including Berachain, Ethereum, Cosmos, and more.

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

## Building and Running Locally

To build and run the blocksail-operator locally, follow these steps:

1. Build the operator:
   ```sh
   make build
   ```

2. Run the operator:
   ```sh
   make run
   ```

## Directory Structure

The repository is organized as follows:

```
blocksail-operator/
├── api/
│   └── v1alpha1/
│       └── node_types.go
├── charts/
│   └── blocksail-operator/
├── config/
│   ├── crd/
│   │   └── bases/
│   │       └── blocksail.io_nodes.yaml
│   └── samples/
│       └── blocksail.io_v1alpha1_node.yaml
├── controllers/
│   └── node_controller.go
├── main.go
└── README.md
```

## Usage

Here are some examples of how to use blocksail-operator:

1. Deploy a node:
   ```yaml
   apiVersion: blocksail.io/v1alpha1
   kind: Node
   metadata:
     name: my-node
   spec:
     blockchain: ethereum
     network: mainnet
     replicas: 3
     type: validator
   ```

2. Deploy another node:
   ```yaml
   apiVersion: blocksail.io/v1alpha1
   kind: Node
   metadata:
     name: my-rpc-node
   spec:
     blockchain: cosmos
     network: testnet
     replicas: 2
     type: rpc
   ```

## Using the Helm Chart

To deploy the blocksail-operator using the Helm chart, follow these steps:

1. Add the Helm repository:
   ```sh
   helm repo add blocksail https://example.com/helm-charts
   ```

2. Install the blocksail-operator:
   ```sh
   helm install blocksail-operator blocksail/blocksail-operator
   ```

## Using the Docker Image

To use the blocksail-operator Docker image, follow these steps:

1. Build the Docker image:
   ```sh
   docker build -t blocksail-operator .
   ```

2. Push the Docker image to a registry:
   ```sh
   docker push <your-registry>/blocksail-operator
   ```

3. Deploy the blocksail-operator using the Docker image:
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: blocksail-operator
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: blocksail-operator
     template:
       metadata:
         labels:
           app: blocksail-operator
       spec:
         containers:
           - name: blocksail-operator
             image: <your-registry>/blocksail-operator
             ports:
               - containerPort: 8080
   ```
