#!/bin/bash
_tgtimg=$(head -n 1 .target_image)
_tgtver=$(head -n 1 .faircamp_version)
_DKR_REPO="${_tgtimg%:*}"
_DKR_VERSION="${_tgtimg#*:}"
emd=$(which eatmydata || true)
if [ -z "$emd" ]; then
  _cmd="docker build"
else
  _cmd="eatmydata docker build"
fi

if [ "$WANT_PUSH" = "1" ]; then
  _extra_opts="--push"
else
  _extra_opts=""
fi
set -x
${_cmd} ${_extra_opts} --build-arg FAIRCAMP_VERSION="${_tgtver}" --build-arg PROPER_UID=$(id -u) --build-arg PROPER_GID=$(id -g) -t ${_DKR_REPO}:${_DKR_VERSION} .
set +x
