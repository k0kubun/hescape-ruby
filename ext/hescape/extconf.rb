require "mkmf"

$CFLAGS << ' -msse4'

create_makefile("hescape/hescape")
