
# Base Docker image for Request2 deployments

This mainly caches the precompiled dependencies so that we don't need to
recompile everything everytime from scratch.

If the list of dependencies get changed, you can bump this by bumping the
submodule commit.
