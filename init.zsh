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
# Function: p6df::modules::julia::langmgr::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::julia::langmgr::init() {

  p6df::core::lang::mgr::init "$P6_DFZ_SRC_DIR/HiroakiMikami/jlenv" "jl"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::jl::prompt::lang()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6df::modules::jl::prompt::lang() {

  local str
  str=$(p6df::core::lang::prompt::lang \
    "jl" \
    "jlenv version-name 2>/dev/null" \
    "julia -v | p6_filter_column_pluck 3")

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: words julia $JLENV_ROOT = p6df::modules::julia::prompt::env()
#
#  Returns:
#	words - julia $JLENV_ROOT
#
#  Environment:	 JLENV_ROOT
#>
######################################################################
p6df::modules::julia::prompt::env() {

  p6_return_words 'julia' '$JLENV_ROOT' '$JLENV_HOOK_PATH' '$JLENV_DIR'
}
