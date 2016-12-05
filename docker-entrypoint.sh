#!/bin/sh

exec /usr/bin/ruby -rsinatra -e'set :port, 8000; set :public_folder, "."'

