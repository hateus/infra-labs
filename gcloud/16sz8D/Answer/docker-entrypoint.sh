#!/bin/bash

set -e

find . \! -user app -exec chown app '{}' +
exec gosu app npm run start
