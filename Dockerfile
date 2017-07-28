FROM circleci/node

RUN wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin
RUN opam switch 4.02.3
RUN eval $(opam config env) && opam update && opam install -y jbuilder
