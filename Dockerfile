# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info
LABEL maintainer="AnniePrasannaX<anniepx97@gmail.com"

# Set the Current Working Directory inside the container
WORKDIR /app

#to get mod and sum files
RUN go mod init CrudDemo

# copying demo.go into app which is working directory
COPY demo.go .

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

#Download gorilla mux
RUN go get github.com/gorilla/mux

# Build the Go app
RUN go build -o main .

# Expose port 9090 to the outside world
EXPOSE 9090

# Command to run the executable
CMD ["./main"]