#!/usr/bin/env bash
# Copyright 2018 Slightech Co., Ltd. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

[ -n "${_MKDIR_SH_}" ] && return || readonly _MKDIR_SH_=1
[ -n "${_VERBOSE_}" ] && echo "-- INCLUDE: mkdir.sh"

MKDIR="mkdir -p"

_mkdir() {
  dir="$1"; required="$2"; verbose="$3";
  [ -n "$verbose" ] || [ -z "${_VERBOSE_}" ] || verbose=1;
  if [ -e "$dir" ]; then
    if [ -d "$dir" ]; then
      [ -z "$verbose" ] || echo "-- MKDIR: $dir exists"
    else
      [ -z "$verbose" ] || echo >&2 "-- MKDIR: $dir not directory"
      if [ -n "$required" ]; then
        echo >&2 "-- MKDIR: $dir not directory, but required"
        exit 1
      fi
    fi
  else
    [ -z "$verbose" ] || echo "-- MKDIR: $dir creates"
    $MKDIR "$dir"
  fi
}
