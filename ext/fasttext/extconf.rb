require "mkmf-rice"

# -pthread and -O3 set by default
$CXXFLAGS << " -std=c++17 -funroll-loops " << with_config("optflags", "-march=native")

ext = File.expand_path(".", __dir__)
fasttext = File.expand_path("../../vendor/fastText/src", __dir__)

$srcs = Dir["{#{ext},#{fasttext}}/*.{cc,cpp}"]
$INCFLAGS << " -I#{fasttext}"
$VPATH << fasttext

create_makefile("fasttext/ext")
