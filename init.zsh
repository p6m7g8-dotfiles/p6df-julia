# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::julia::deps()
#
#>
######################################################################
p6df::modules::julia::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    HiroakiMikami/jlenv
    HiroakiMikami/julia-build
  )
}

######################################################################
#<
#
# Function: p6df::modules::julia::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::julia::init() {

  p6df::core::lang::mgr::init "$P6_DFZ_SRC_DIR/HiroakiMikami/jlenv" "jl"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::jl::env::prompt::info()
#
#  Returns:
#	str - str
#
#  Environment:	 JLENV_ROOT
#>
######################################################################
p6df::modules::jl::env::prompt::info() {

  local str="julia_root:\t  $JLENV_ROOT"

  p6_return_str "$str"
}
