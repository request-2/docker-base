# This is the base image for request dockers, hopefully preinstalling as much
# stuff as possible so that later stages do not need to compile everything
# themselves.

FROM debian:testing

RUN apt-get -qq update && \
    apt-get install --no-install-recommends -y \
    psmisc curl procps vim \
    ghc cabal-install \
    yarnpkg \
    nginx ssmtp \
    libpq-dev postgresql-client zlib1g-dev

# add the haskell backend
ADD backend /src/request2-backend-tmp

# download hackage and precompile backend packages (the `cabal build` step does not need source files)
RUN cabal update && \
    cd /src/request2-backend-tmp && \
    cabal build --only-dependencies && \
    rm -fr /src/request2-backend-tmp
