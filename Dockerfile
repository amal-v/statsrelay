FROM golang
COPY . /usr/local/go/src/github.com/statsrelay
WORKDIR /usr/local/go/src/github.com/statsrelay
RUN go get
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o statsrelay .


FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /usr/local/go/src/github.com/statsrelay/statsrelay .




