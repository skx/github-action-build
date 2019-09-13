# GitHub Action for building a project

This repository contains a simple GitHub Action implementation, which allows you to build your project, in a repository-specific fashion.


## Enabling the action

There are two steps required to use this action:

* Enable the action inside your repository.
  * This might mean creating a file `.github/workflows/release.yml` which is where the action is invoked for release-steps, for example.
* Add your project-specific `.github/build` script.
  * This is the script which will actually carry out your build-steps.
    * A C-project might just run `make`.
    * A golang-based project might run `go build .` multiple times for different architectures.


## Sample Configuration

This configuration runs the script `.github/build` every time a release is made of your project, and is defined in the file `.github/workflows/release.yml`:

```
on: release
name: Handle Release
jobs:
  generate:
    name: Create release-artifacts
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Generate
      uses: skx/github-action-build@master
```

We assume that the `.github/build` script generated a series of binaries, and these can be acccessed by later steps in your workflow.  For example you might use my uploading-action:

* [https://github.com/skx/github-action-publish-binaries](https://github.com/skx/github-action-publish-binaries)
