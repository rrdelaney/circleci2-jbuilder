FROM circleci/node

RUN sudo apt-get install opam
RUN opam init -y && opam update
RUN opam install jbuilder
