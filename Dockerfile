FROM golang:alpine

# install some important tools
RUN apk add --update tzdata \
    bash wget curl git;

# set gopath
RUN mkdir -p $$GOPATH/bin && \
    # the dependencies manager
    curl https://glide.sh/get | sh && \
    # builds and (re)starts your web application everytime you save a Go or template file
    go get github.com/pilu/fresh

# set envariable for app root
ENV APP_ROOT $GOPATH/src/gitlab.com/gwd

# Copy all files to app root volume
COPY . $APP_ROOT
# set working directory
WORKDIR $APP_ROOT/

# run glide to update the dependencies and launch the fresh server
CMD glide update && fresh -c runner.conf main.go
