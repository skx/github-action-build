FROM golang:latest

LABEL "com.github.actions.name"="github-action-build"
LABEL "com.github.actions.description"="Run a repository-specific build-script"
LABEL "com.github.actions.icon"="settings"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.0"
LABEL repository="http://github.com/skx/github-action-build"
LABEL homepage="http://github.com/skx/github-action-build"
LABEL maintainer="Steve Kemp <steve@steve.fi>"

COPY build /usr/local/bin/build

ENTRYPOINT ["/usr/local/bin/build"]
