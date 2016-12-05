#!/bin/sh

exec /usr/bin/ruby -rsinatra -e'set :bind, "0.0.0.0"; set :port, 8000; set :public_folder, "."'

