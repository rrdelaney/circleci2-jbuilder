FROM circleci/node

RUN sudo apt-get install opam
RUN opam init -y && opam update
RUN opam switch 4.02.3
RUN eval $(opam config env) && opam install -y jbuilder
