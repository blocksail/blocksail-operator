# Use a base image with Go installed
FROM golang:1.16 as builder

# Set the working directory inside the container
WORKDIR /workspace

# Copy the Go modules manifests
COPY go.mod go.sum ./

# Download the Go modules
RUN go mod download

# Copy the source code
COPY main.go main.go
COPY api/ api/
COPY controllers/ controllers/

# Build the operator binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o blocksail-operator main.go

# Use a minimal base image for the final container
FROM gcr.io/distroless/static:nonroot

# Set the working directory inside the container
WORKDIR /

# Copy the operator binary from the builder stage
COPY --from=builder /workspace/blocksail-operator .

# Set the entry point to run the operator binary
ENTRYPOINT ["/blocksail-operator"]
