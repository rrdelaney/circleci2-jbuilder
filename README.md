# circleci2-jbuilder

CircleCI 2.0 build image for jbuilder-based OCaml projects


## Example usage

```yaml
version: 2
jobs:
  build:
    docker:
      - image: rrdelaney/circleci2-jbuilder
        environment:
          TERM: xterm
    steps:
      - checkout
      - restore_cache:
          keys:
            - opam-deps-{{ checksum "MyProject.opam" }}
      - run:
          name: 'Install OCaml dependencies'
          command: 'eval $(opam config env) && opam install -y <my-dependencies>'
      - save_cache:
          key: opam-deps-{{ checksum "MyProject.opam" }}
          paths:
            - ~/.opam
      - run:
          name: 'Build JS files'
          command: 'eval $(opam config env) && jbuilder build src/cli.exe'
      - run:
          name: 'Install JS dependencies'
          command: 'npm install'
      - run:
          name: 'Run tests'
          command: 'npm test'
```
