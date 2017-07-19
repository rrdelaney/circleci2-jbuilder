# circleci2-jbuilder

CircleCI 2.0 build image for jbuilder-based OCaml projects


## Example usage

```yaml
version: 2
jobs:
  build:
    working_directory: /retyped
    docker:
      - image: rrdelaney/circleci2-jbuilder
    steps:
      - checkout
      - run:
          name: 'Clean build artifacts'
          command: 'make clean'
      - run:
          name: 'Build JS files'
          command: 'eval $(opam config env) && make js'
          environment:
            TERM: xterm
      - run:
          name: 'Install JS dependencies'
          command: 'npm install'
      - run:
          name: 'Run tests'
          command: 'npm test'
```
